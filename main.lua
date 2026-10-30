

local ageIndex = 1
local difficultyIndex = 1
local enableBossKills = false
local enableLorebooks = false
local age = "Age: Fifth Age"
local difficulty = "Difficulty: Off"
local ageText
local difficultyText
local currentAgeUI
local difficultyUI

local contentView

local Ages = {{
        label = "Fifth Age", 
        id = 1
    },
    {
        label = "Sliske's Game", 
        id = 2,
        npcs = {
            -- Orlando Smith, the World Wakes starting point
            "TSD_ORLANDO_OUTSIDE",
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

        -- Divination tutorial NPCS

        -- Empty Throne Room
            "FOTG2_DIGSITE_GUIDE",
        },
        interactions = {
            -- Guthix's Cave
            "TSD_DIGSITE_DOORWAY_CLOSE",
            -- GWD2 Entrance
            "GWD2_ENTANCE_GATE_BASE_EMPTY_CLICKZONE",
            -- Empty Throne Room (related to Children of Mah, a Sliske's Game quest)
            "FOTG2_DIGSITE_ENTRANCE"
        },
        unlockedBy = {
            {id = 2, achievements = {

            }},
            {id = 3, achievements = {

            }},
            {id = 4, achievements = {

            }},
            {id = 5, achievements = {

            }},
            {id = 6, achievements = {

            }}
        }
        
    },
    {
        label = "Elder God Wars",
        id = 3,
        npcs = {
            -- Burthorpe Council
            "QUEST_CHAROS_SEREN_SIMPLE",
            "QUEST_CHAROS_SEREN_EXTRAVAGANT",
            "QUEST_CHAROS_DORIC_VIS",
            "QUEST_CHAROS_PHAROAH_OSMAN_VIS",
            "QUEST_CHAROS_CYLCOPS_KHAN_VIS",
            "QUEST_CHAROS_GARLANDIA_VIS",
            "QUEST_CHAROS_ZILYANNA_VIS",
            "QUEST_CHAROS_MOIA_VIS",
            "QUEST_CHAROS_AZZANADRA_VIS",
            "QUEST_CHAROS_ZANIK_VIS",
            "QUEST_CHAROS_ICTHLARIN_VIS",
            "QUEST_CHAROS_ZARADOR_VIS",
            "QUEST_CHAROS_GLOUPHRIE_REP_VIS",
            "QUEST_CHAROS_NARODE_VIS",
            "QUEST_CHAROS_VANESCULA_VIS",
            "QUEST_CHAROS_ONEIROMANCER_VIS",
            "QUEST_CHAROS_RANCOUR_VIS",
            "QUEST_CHAROS_JUNA_VIS",
            "QUEST_CHAROS_KING_ROALD_VIS",
            "QUEST_CHAROS_SIR_AMIK_VIS",
            "QUEST_CHAROS_LORD_DAQUARIUS_VIS",
            "QUEST_CHAROS_ARMADYL_VIS",
            "QUEST_CHAROS_BRUNDT_VIS",
            "QUEST_CHAROS_THOK",
            -- Anachronia ship NPCs
            "DINO_ONBOARDING_LANIAKEA",
            "DINO_ONBOARDING_VARROCK_GUARD",
            "DINO_ONBOARDING_ARCHAEOLOGIST",
            -- Arch Guild NPCs
            "ARCH_GUILDMASTER_REINIGER_TUTORIAL",
            "ARCH_KHARIDET_MANAGER",
            "ARCH_EVERLIGHT_MANAGER",
            "ARCH_INFERNALSOURCE_MANAGER",
            "ARCH_STORMGUARD_MANAGER",
            "ARCH_WARFORGE_MANAGER",

        },
        interactions = {
            -- The Needle
            "TNS_NEEDLE_VIS",
            -- Senntisten entrance
            "EGWD_SURFACE_ENTRANCE_DOOR",
            -- Anachronia ship
            "HUMAN_VEHICLE_BARGE_REGULAR_V4"

        },
        unlockedBy = {
            {id = 2, achievements = {

            }},
            {id = 3, achievements = {

            }},
            {id = 4, achievements = {

            }},
            {id = 5, achievements = {

            }},
            {id = 6, achievements = {
                
            }}
        }
    }, 
    {
        label = "Age of Chaos", 
        id = 4,
        npcs = {
            -- Adrasteia
            "ADRASTEIA_BASILISSA",
        },
        interactions = {
            -- Necromancy entrance
            "UNDERWORLD_ENTRANCE_LOUD",
            -- New Foundations quest start
            "QUEST_FORT_INTRO_START_LOC"
            -- Daughter of Chaos quest start

        },
        unlockedBy = {
            {id = 2, achievements = {

            }},
            {id = 3, achievements = {

            }},
            {id = 4, achievements = {

            }},
            {id = 5, achievements = {

            }},
            {id = 6, achievements = {
                
            }}
        }
    }
}

local Difficulties = {
    {label = "Off", id = 1},
    {label = "Novice", id = 2},
    {label = "Intermediate", id = 3},
    {label = "Experienced", id = 4},
    {label = "Master", id = 5},
    {label = "Grandmaster", id = 6}
}

local BlockedInteractions = {

}

local HiddenNPCs = {

}


-- CONFIG INTERFACE
Event.ContentLayerReady.Subscribe("agelocked-interface", function(event)
    if contentView then contentView:Destroy() end

    local parent = event.component
    contentView = prettyui.SimpleView.new(parent, {
        width = parent.width,
        height = parent.height,
    })



    if PersistentDB:CheckExists("startingAge") then
        ageIndex = PersistentDB:GetInt("startingAge")
        age = "Age: "..Ages[ageIndex].label
    end


    if PersistentDB:CheckExists("difficulty") then
        difficultyIndex = PersistentDB:GetInt("difficulty")
        difficulty = "Difficulty: "..Difficulties[difficultyIndex].label
    end
    
    if PersistentDB:CheckExists("enableBossKills") then
        enableBossKills = PersistentDB:Get("enableBossKills")
    end

    if PersistentDB:CheckExists("enableLorebooks") then
        enableLorebooks = PersistentDB:Get("enableLorebooks")
    end

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
        entries = Ages,
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
        entries = Difficulties,
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
        { text = "Require boss kills", value = "bosses", selected = enableBossKills},
        { text = "Require lorebooks", value = "lorebooks", selected = enableLorebooks },
    }, {
        onChange = function(group, values, changedValue, selected)
            --print(tostring(group).." "..tostring(values).." "..tostring(changedValue).." "..tostring(selected))
            if changedValue == "bosses" then
                enableBossKills = selected
                PersistentDB:Set("enableBossKills",selected)
            elseif changedValue == "lorebooks" then
                enableLorebooks = selected
                PersistentDB:Set("enableLorebooks",selected)    
            end
            
        end,
    })

end)

function UpdateStartingAge(control,id,selected,eventType)
    --print("Age changed. Label: "..tostring(currentAgeUI)..", ID: "..tostring(id)..", Selected: "..tostring(selected)..", eventType: "..tostring(eventType))
    ageIndex = id
    ageText.content = "Age: "..Ages[id].label
    PersistentDB:SetInt("startingAge",ageIndex)
end
function UpdateDifficulty(control,id,selected,eventType)
    --print("Difficulty changed. Label: "..tostring(difficultyUI)..", ID: "..tostring(id)..", Selected: "..tostring(selected)..", eventType: "..tostring(eventType))
    difficultyIndex = id
    difficultyText.content = "Difficulty: "..Difficulties[id].label
    PersistentDB:SetInt("difficulty",difficultyIndex)
end
-- function UpdateOptionals(group, values, changedValue, selected)
-- end

-- INTERFACE END


function PluginShutdown()
    PersistentDB:SetInt("startingAge",ageIndex)
    PersistentDB:SetInt("difficulty",difficultyIndex)
    Event.ContentLayerReady.Unsubscribe("agelocked-interface")
    if contentView then
        contentView:Destroy()
        contentView = nil
    end
end

