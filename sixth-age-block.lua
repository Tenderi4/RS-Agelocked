-- ===========================================================================
-- Quests Chronological Timeline Ordering
--
-- Shows a small window with three checkboxes. Each checkbox hides its own
-- list of NPCs, so the world can match a chosen point in the story.
--
-- HOW IT WORKS
--   The game tells the plugin every time it is about to draw an NPC (the
--   "EntityDraw" event). If that NPC is on the list of a ticked checkbox, the
--   plugin answers "do not draw it". Nothing is deleted or changed; unticking
--   the box simply stops the plugin from saying no.
--
-- TO CHANGE WHAT A CHECKBOX HIDES, edit only section 1.
-- ===========================================================================


-- ===========================================================================
-- 1. THE LISTS: edit this section
--
-- Each entry in HIDE_GROUPS is one checkbox in the window.
--   key            : short unique name (used to remember the checkbox)
--   label          : the text shown next to the checkbox
--   npcConfigNames : the NPCs to hide, one per line, in quotes, with a comma.
--                    These are NPC "config names" such as "HANS" or
--                    "DOG_STRAY". Upper/lower case does not matter.
--
-- An NPC may appear in more than one group. It stays hidden as long as at
-- least one of those checkboxes is ticked.
--
-- Tip: typing   pan NPC   in the client console lists NPCs and their config
-- names, which you can copy from.
-- ===========================================================================
local PLUGIN_TITLE = "Quests Chronological Timeline Ordering"

local HIDE_GROUPS = {
    {
        key            = "sliskes_game",
        label          = "Hide all Sixth Age: Sliske's Game content",
        npcConfigNames = {
           
		   
		   --Emissary NPCs
            "GODEM_ARMADYL_EMISSARY",
	"GODEM_BANDOS_EMISSARY",
	"GODEM_SARADOMIN_EMISSARY",
	"GODEM_SEREN_EMISSARY",
	"GODEM_SLISKE_EMISSARY",
	"GODEM_ZAMORAK_EMISSARY",
	"GODEM_ZAROS_EMISSARY",
	"GODEM_GODLESS_EMISSARY",
	"GODEM_V_EMISSARY",
	
	--World Event NPCs
	"_6AWE3_QUARTERMASTER",
	"_6AWE1_CUTSCENE_REPLAYER",
	"_6AWE2_CUTSCENE_REPLAYER",
	"TUSKA_CRASHSITE_SCOPULUS",
"TUSKA_ASTROMANCER_LUMBRIDGE_TELEPORT",
"TUSKA_CRASHSITE_GARLANDIA",
"TUSKA_CRASHSITE_KARA_MEIR",
"TUSKA_TUSKA_RAID_CUTSCENE_TUSKA",
"TUSKA_CRASHSITE_LRC2_SLISKE",
	
	
	--Missing Presumed Death NPCs
	"SLISKE1_SURVIVOR",
"SLISKE1_SURVIVOR_SCARED",
"SLISKE1_SURVIVOR_NORMAL",
"SLISKE1_SPIRIT_MONK_1",
	"SLISKE1_SPIRIT_MONK_2",
	"SLISKE1_SPIRIT_MONK_3",
	"SLISKE1_SPIRIT_ELF_1",
	
	--GWD2 NPCs
	"GWD2_MINIQUEST_CURATOR",
"GWD2_MINIQUEST_CURATOR_VIS",



        },
    },
    {
        key            = "elder_god_wars",
        label          = "Hide all Sixth Age: Elder God Wars content",
        npcConfigNames = {
            "TODO_CONFIG_NAME",
            -- add the rest here, one per line
        },
    },
    {
        key            = "age_of_chaos",
        label          = "Hide all Age of Chaos content",
        npcConfigNames = {
            "TODO_CONFIG_NAME",
            -- add the rest here, one per line
        },
    },
}


-- ===========================================================================
-- 2. Hiding logic
-- ===========================================================================

-- The name this plugin uses when subscribing to the game's draw event.
local DRAW_EVENT_NAME = "questsTimelineHideNPCs"

-- How many checkboxes are currently ticked. When this is 0 the draw handler
-- returns immediately, which keeps the plugin cheap while nothing is hidden.
local tickedCount = 0

-- groupsByConfigID[npcConfigID] = list of the groups that contain that NPC.
-- Filled in as NPCs are seen, so each NPC type is only looked up once.
local groupsByConfigID = {}

-- Shared empty list used for NPCs that are on no list.
local NO_GROUPS = {}

-- Turn each group's list of names into a lookup table (all lower case) so
-- checking whether a name is on the list is fast.
local function prepareGroups()
    for _, group in ipairs(HIDE_GROUPS) do
        group.nameSet = {}
        for _, configName in ipairs(group.npcConfigNames) do
            group.nameSet[string.lower(configName)] = true
        end
        group.enabled = false
    end
end

-- Work out (and remember) which groups an NPC type belongs to.
-- npcType is an NPC "config", as found on an NPCEntity.
local function groupsFor(npcType)
    if npcType == nil then
        return NO_GROUPS
    end

    local cached = groupsByConfigID[npcType.id]
    if cached ~= nil then
        return cached
    end

    local found = NO_GROUPS
    local configName = npcType.configName
    if type(configName) == "string" then
        local lowered = string.lower(configName)
        for _, group in ipairs(HIDE_GROUPS) do
            if group.nameSet[lowered] then
                if found == NO_GROUPS then
                    found = {}
                end
                found[#found + 1] = group
            end
        end
    end

    groupsByConfigID[npcType.id] = found
    return found
end

-- True if any group in the list is currently ticked.
local function anyTicked(groups)
    for _, group in ipairs(groups) do
        if group.enabled then
            return true
        end
    end
    return false
end

-- The game calls this just before drawing each entity.
-- Return true to draw it normally, or false to skip drawing it.
local function onEntityDraw(event)
    -- Only NPCs are handled; players and item stacks are drawn as usual.
    if event.entityType ~= EntityType.NPC then
        return true
    end

    -- Nothing ticked: nothing to hide.
    if tickedCount == 0 then
        return true
    end

    local npc = event.npcEntity

    -- Some NPCs change form depending on a game variable. For those, "config"
    -- is the form currently showing and "parentConfig" is the shared parent,
    -- so both are checked.
    if anyTicked(groupsFor(npc.config)) or anyTicked(groupsFor(npc.parentConfig)) then
        return false
    end

    return true
end

-- Turn one group on or off (called when its checkbox is clicked).
local function setGroupEnabled(group, value)
    if group.enabled == value then
        return
    end
    group.enabled = value
    if value then
        tickedCount = tickedCount + 1
    else
        tickedCount = tickedCount - 1
    end

    -- Remember the choice for next time. Saving right away (rather than only
    -- at shutdown) means a client crash does not lose it.
    PersistentDB:SetBool("hide_" .. group.key, value)
end


-- ===========================================================================
-- 3. User interface
-- ===========================================================================

-- The window is kept here so it can be removed when the plugin is turned off.
local window = nil

local function buildUI()
    -- Plugin windows are attached to a layer the game provides for plugins.
    local gameWindow = ui.Interfaces:GetComponent(id.Component.TOPLEVEL_V2__PLUGIN_BUILD_LAYER_TOP)

    -- The window itself: a group box with its header removed.
    window = ui.GroupBox.new(gameWindow)
    window:SetHeaderLayout(0, 0, 0, 0, 0)
    window:SetSize(400, 170)          -- width, height. Make larger if labels are cut off.
    window:SetPos(20, 20)             -- distance from the top-left of the game window
    window.stylesheetID = id.StyleSheet.GROUPBOX_DEFAULT

    -- The window is split into 4 equal rows: a title, then one row per checkbox.
    local ROW_HEIGHT = 0.25

    local title = ui.Text.new(window)
    title:SetSize(0, 0, 1.0, ROW_HEIGHT)
    title:SetPos(0, 0)
    title.content = PLUGIN_TITLE
    title.font = id.Font.MUSEO_SANS_15PT_REGULAR
    title:AlignTo(ui.AlignMode.CENTRE)

    for index, group in ipairs(HIDE_GROUPS) do
        local check = ui.Check.new(window)
        check:SetSize(0, 0, 1.0, ROW_HEIGHT)
        check:SetPos(0, 0, 0.0, ROW_HEIGHT * index)
        check.stylesheetID = id.StyleSheet.CHECKBOX_DEFAULT
        check.label = group.label

        -- Restore the choice saved last time. (Setting a checkbox from code is
        -- not described in the documentation, so this is guarded: if it does
        -- not work, the box stays unticked and nothing is hidden, keeping the
        -- box and the behaviour in agreement.)
        if PersistentDB:GetBool("hide_" .. group.key) == true then
            pcall(function() check.value = true end)
            if check.value == true then
                setGroupEnabled(group, true)
            else
                print("[QuestsTimeline] Could not restore the tick for: " .. group.label)
            end
        end

        -- Runs each time the player clicks this checkbox.
        -- "ticked" is true if the box is now ticked.
        check:Subscribe(ui.Hook.ONBUTTONPRESSED, "toggle", function(clickedCheck, ticked)
            setGroupEnabled(group, ticked)
        end)
    end
end


-- ===========================================================================
-- 4. Start-up and shutdown
-- ===========================================================================

prepareGroups()
buildUI()
Event.EntityDraw.Subscribe(DRAW_EVENT_NAME, onEntityDraw)

-- The game calls this function by name when the plugin is turned off or the
-- client closes. (It must stay a global function, not "local".) It removes
-- the window and stops hiding NPCs, so everything returns to normal.
function PluginShutdown()
    Event.EntityDraw.Unsubscribe(DRAW_EVENT_NAME)
    if window ~= nil then
        window:Destroy()
        window = nil
    end
end
