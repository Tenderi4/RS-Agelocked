

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

local Ages = {
    {label = "Fifth Age", id = 1},
    {label = "Sliske's Game", id = 2},
    {label = "Elder God Wars", id = 3},
    {label = "Age of Chaos", id = 4}
}

local Difficulties = {
    {label = "Off", id = 1},
    {label = "Novice", id = 2},
    {label = "Intermediate", id = 3},
    {label = "Experienced", id = 4},
    {label = "Master", id = 5},
    {label = "Grandmaster", id = 6}
}

local Optionals = 



Event.ContentLayerReady.Subscribe("my-plugin-content", function(event)
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


function PluginShutdown()
    PersistentDB:SetInt("startingAge",ageIndex)
    PersistentDB:SetInt("difficulty",difficultyIndex)
    Event.ContentLayerReady.Unsubscribe("my-plugin-content")
    if contentView then
        contentView:Destroy()
        contentView = nil
    end
end

