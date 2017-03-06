NoOrdersAllowed = false

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
    elseif Sync.NoOrdersAllowed == false then
        NoOrdersAllowed = Sync.NoOrdersAllowed
        IN_AddKeyMapTable(import('/lua/ui/game/gamemain.lua').modifiersKeys)
        import('/modules/hotbuild.lua').addModifiers()
        IN_AddKeyMapTable(import('/lua/keymap/keymapper.lua').GetKeyMappings(true))
    end
end