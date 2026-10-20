

local ageIndex = 1
local difficultyIndex = 0
local age = "Age: "
local difficulty = "Difficulty: "
local ageText
local difficultyText
local currentAgeUI
local difficultyUI

local contentView





if PersistentDB:CheckExists("startingAge") then
    ageIndex = PersistentDB:GetInt("startingAge")
end


if PersistentDB:CheckExists("difficulty") then
    difficultyIndex = PersistentDB:GetInt("difficulty")
end


Event.ContentLayerReady.Subscribe("my-plugin-content", function(event)
    if contentView then contentView:Destroy() end

    local parent = event.component
    contentView = prettyui.SimpleView.new(parent, {
        width = parent.width,
        height = parent.height,
    })

    -- contentView:AddTitle("Age")
    ageText = contentView:AddText(age)

    difficultyText = contentView:AddText(difficulty)

    
    local title = contentView:AddTitle("Settings")

    local ageDropdown = contentView:AddCollapseButton("Starting Age", {
        expanded = false,
        resizeParent = false,
        onToggle = function(self, expanded)

        end,
    })

    currentAgeUI = ageDropdown:AddList({
        entries = {
            {label = "Fifth Age", id = 1},
            {label = "Sliske's Game", id = 2},
            {label = "Elder God Wars", id = 3},
            {label = "Age of Chaos", id = 4}
        },
        maxSelected = 1,
        selectedID = 1,
        onChange = UpdateStartingAge
    })
    -- local currentAge = contentView:AddList({
    --     entries = {
    --         {label = "Fifth Age", id = 1},
    --         {label = "Sixth Age - Sliske's Game", id = 2},
    --         {label = "Sixth Age - Elder God Wars", id = 3},
    --         {label = "Age of Chaos", id = 4}
    --     },
    --     maxSelected = 1,
    --     selectedID = 1,
    --     onChange = function(list,id,selected)
    --        -- setAge(id, selected)
    --     end,
    -- })
    
 --   contentView:AddTitle("Difficulty")

    local difficultyDropdown = contentView:AddCollapseButton("Difficulty", {
        expanded = false,
        resizeParent = false,
        onToggle = function(self, expanded)

        end,
    })
    difficultyUI = difficultyDropdown:AddList({
        entries = {
            {label = "Off", id = 1},
            {label = "Novice", id = 2},
            {label = "Intermediate", id = 3},
            {label = "Experienced", id = 4},
            {label = "Master", id = 5},
            {label = "Grandmaster", id = 6}
        },
        maxSelected = 1,
        selectedID = 1,
        onChange = UpdateDifficulty
    })
    -- local difficulty = contentView:AddList({
    --     entries = {
    --         {label = "Off", id = 0},
    --         {label = "Novice", id = 1},
    --         {label = "Intermediate", id = 2},
    --         {label = "Experienced", id = 3},
    --         {label = "Master", id = 4},
    --         {label = "Grandmaster", id = 5}
    --     },
    --     maxSelected = 1,
    --     selectedID = 1,
    --     onChange = function(list,id,selected)
    --        -- setDifficulty(id, selected)
    --     end,
    -- })

    local features = contentView:AddCheckboxButton({
        { text = "Require boss kills", value = "bosses"},
        { text = "Require lorebooks", value = "lorebooks" },
    }, {
        onChange = UpdateOptionals
    })

end)

function UpdateStartingAge(control,id,selected,eventType)
    print("Age changed. Label: "..tostring(currentAgeUI)..", ID: "..tostring(id)..", Selected: "..tostring(selected)..", eventType: "..tostring(eventType))
    ageIndex = id
    PersistentDB:SetInt("startingAge",ageIndex)
end
function UpdateDifficulty(control,id,selected,eventType)
    print("Difficulty changed. Label: "..tostring(difficultyUI)..", ID: "..tostring(id)..", Selected: "..tostring(selected)..", eventType: "..tostring(eventType))
    difficultyIndex = id
    PersistentDB:SetInt("difficulty",difficultyIndex)
end
function UpdateOptionals(group, values, changedValue, selected)

end


function PluginShutdown()
    PersistentDB:SetInt("startingAge",ageIndex)
    PersistentDB:SetInt("difficulty",difficultyIndex)
    Event.ContentLayerReady.Unsubscribe("my-plugin-content")
    if contentView then
        contentView:Destroy()
        contentView = nil
    end
end







-- Code section 2
-- Create a new group box for components
-- local myGroupBox = ui.GroupBox.new(game_window)
-- myGroupBox:SetHeaderLayout(250,20,0,0,0)
-- myGroupBox:SetSize(250,200)
-- myGroupBox:SetPos(50,250)
-- myGroupBox.headerText.content = "Agelocked Config"
-- --myGroupBox.headerText.font = 
-- myGroupBox.stylesheetID = id.StyleSheet.DEFAULT

-- -- Code section 3
-- -- Add some text
-- local myText = ui.Text.new(myGroupBox)
-- myText:SetSize(0,0,1.0,0.5)
-- myText:SetPos(0,0)
-- myText.content = "Hello world!"
-- myText.font = id.Font.MUSEO_SANS_15PT_REGULAR
-- myText:AlignTo(ui.AlignMode.CENTRE)

-- -- Code section 4
-- -- Add some colour
-- local myRectangle = ui.Rectangle.new(myGroupBox)
-- myRectangle:SetSize(0,0,1.0,0.5)
-- myRectangle:SetPos(0,0,0.0,0.5)
-- myRectangle.colour = Vector4.new(0.0, 1.0, 0.0, 1.0)
-- myRectangle.fill = true

-- -- Code section 4 version 2
-- -- Add a button
-- local myButton = ui.Button.new(myGroupBox)
-- myButton:SetPos(0,0,0.0,0.5)
-- myButton:SetSize(0,0,1.0,0.5)
-- myButton.label = "Push this button"
-- myButton.stylesheetID = id.StyleSheet.BUTTON_DEFAULT

-- Code section 5
-- Make the button do something
-- local function buttonPress()
--     myText.content = myText.content.."!"
-- end
-- myButton:Subscribe(ui.Hook.ONBUTTONPRESSED, buttonPress)

