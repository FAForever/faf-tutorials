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
end