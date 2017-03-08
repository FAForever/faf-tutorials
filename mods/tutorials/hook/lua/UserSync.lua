NoOrdersAllowed = false

local allowedKeyMap =
{
    ['NumMinus']    = {action =  'UI_Lua import("/lua/ui/uimain.lua").DecreaseGameSpeed()',
        category = 'game', order = 1,},
    ['NumPlus']     = {action =  'UI_Lua import("/lua/ui/uimain.lua").IncreaseGameSpeed()',
        category = 'game', order = 2,},
    ['NumStar']     = {action =  'WLD_ResetSimRate',
        category = 'game', order = 3,},
}

local oldOnSync = OnSync
OnSync = function()
    oldOnSync()
    if Sync.OpenURL then
        OpenURL(Sync.OpenURL)
    end

    if Sync.SetRepeatBuild then
        for unitID, val in Sync.SetRepeatBuild do
            local unit = GetUnitById(unitID)
            unit:ProcessInfo('SetRepeatQueue', tostring(val))
        end
    end
    
    if Sync.NoOrdersAllowed then
        NoOrdersAllowed = Sync.NoOrdersAllowed
        IN_ClearKeyMap()
        IN_AddKeyMapTable(allowedKeyMap)
    elseif Sync.NoOrdersAllowed == false then
        IN_ClearKeyMap()
        NoOrdersAllowed = Sync.NoOrdersAllowed
        IN_AddKeyMapTable(import('/lua/ui/game/gamemain.lua').modifiersKeys)
        import('/modules/hotbuild.lua').addModifiers()
        IN_AddKeyMapTable(import('/lua/keymap/keymapper.lua').GetKeyMappings(true))
    end
end