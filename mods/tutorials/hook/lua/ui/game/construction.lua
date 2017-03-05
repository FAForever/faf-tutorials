local oldOnClickHandler = OnClickHandler
function OnClickHandler(button, modifiers)
    if NoOrdersAllowed then
        return
    end
    oldOnClickHandler(button, modifiers)
end

local oldOnRolloverHandler = OnRolloverHandler
function OnRolloverHandler(button, state)
    if NoOrdersAllowed then
        local item = button.Data
        if state == 'enter' then
            if item.type == 'item' or item.type == 'queuestack' or item.type == 'unitstack' or item.type == 'attachedunit' then
                UnitViewDetail.Show(__blueprints[item.id], sortedOptions.selection[1], item.id)
            elseif item.type == 'enhancement' then
                UnitViewDetail.ShowEnhancement(item.enhTable, item.unitID, item.icon, GetEnhancementPrefix(item.unitID, item.icon), sortedOptions.selection[1])
            end
        else
            UnitViewDetail.Hide()
        end
        return
    end
    oldOnRolloverHandler(button, state)
end

local oldCreateExtraControls = CreateExtraControls
function CreateExtraControls(controlType)
    oldCreateExtraControls(controlType)
    if NoOrdersAllowed then
        controls.extraBtn1:Disable()
        controls.extraBtn2:Disable()
    end
    
end
