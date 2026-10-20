local function UpdateStartingAge(combo, id, label, eventType)
end
local function UpdateDifficulty(combo, id, label, eventType)
end
local function UpdateOptionals(group, values, changedValue, selected)
end

local __prettyui_layer_component_3
function onContentLayerReady(contentLayerReadyEvent)
    local rootLayer = contentLayerReadyEvent.component
    if __prettyui_layer_component_3 then __prettyui_layer_component_3:Destroy() end
    local contentLayer = prettyui.SimpleView.new(rootLayer, { width = rootLayer.width, height = rootLayer.height })
    __prettyui_layer_component_3 = contentLayer
    contentLayer:AddTitle("Starting Age")
    contentLayer:AddComboBox({ entries = { { label = "Fifth Age", id = 1 }, { label = "Sliske's Game", id = 2 }, { label = "Elder God Wars", id = 3 }, { label = "Age of Chaos", id = 4 } }, tooltip = "Set the age your character starts in. More recent ages like Age of Chaos can do quests from that age, as well as from all preceding eras.", selectedID = 1, onChange = UpdateStartingAge })
    contentLayer:AddTitle("Difficulty")
    contentLayer:AddComboBox({ 
        entries = { { label = "Off", id = 1 }, { label = "Novice", id = 2 }, { label = "Intermediate", id = 3 }, { label = "Experienced", id = 4 }, { label = "Master", id = 5 }, { label = "Grandmaster", id = 6 } }, 
        tooltip = [[
        Off: No extra requirements. 
        Novice: Main questlines are required to start the next age. 
        Intermediate: All suggested requirements become hard requirements for quests.
        Experienced: Extra requirements are added on top of existing suggested requirements.
        Master: All of that specific age's quests must be done to access the next age.
        Grandmaster: Quests must be done in order, one by one.]], 
        selectedID = 1, 
        onChange = UpdateDifficulty })
    contentLayer:AddTitle("Optional requirements")
    contentLayer:AddCheckboxButton({ { text = "Require boss kills", value = 1 }, { text = "Require lorebooks", value = 2 } }, { tooltip = "Require boss kills: PVM bosses become requirements for quests.\\nRequire lorebooks: Acquiring lorebooks can become requirements for quests and other content.", onChange = UpdateOptionals })
end
Event.ContentLayerReady.Subscribe("prettyui-editor-component_3-content", onContentLayerReady)

function PluginShutdown()
    Event.ContentLayerReady.Unsubscribe("prettyui-editor-component_3-content")
    if __prettyui_layer_component_3 then
        __prettyui_layer_component_3:Destroy()
        __prettyui_layer_component_3 = nil
    end
end