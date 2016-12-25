function NISMode(state)
    NISActive = state
    local worldView = import("/lua/ui/game/worldview.lua")
    if state == 'on' then
        import('/lua/ui/dialogs/saveload.lua').OnNISBegin()
        import('/lua/ui/dialogs/options.lua').OnNISBegin()
        import('/lua/ui/game/consoleecho.lua').ToggleOutput(false)
        import('/lua/ui/game/multifunction.lua').PreNIS()
        import('/lua/ui/game/tooltip.lua').DestroyMouseoverDisplay()
        import('/lua/ui/game/chat.lua').OnNISBegin()
        import('/lua/ui/game/unitviewDetail.lua').OnNIS()
        HideGameUI(state)
        ShowNISBars()
        if worldView.viewRight then
            import("/lua/ui/game/borders.lua").SplitMapGroup(false, true)
            preNISSettings.restoreSplitScreen = true
        else
            preNISSettings.restoreSplitScreen = false
        end
        preNISSettings.Resources = worldView.viewLeft:IsResourceRenderingEnabled()
        preNISSettings.Cartographic = worldView.viewLeft:IsCartographic()
        -- worldView.viewLeft:EnableResourceRendering(false)                   -- Don't hide resources icons
        worldView.viewLeft:SetCartographic(false)
        ConExecute('UI_RenderUnitBars false')
        ConExecute('UI_NisRenderIcons false')
        ConExecute('ren_SelectBoxes false')
        for i, v in rangePrefs do
            ConExecute(i..' false')
        end
        preNISSettings.gameSpeed = GetGameSpeed()
        if preNISSettings.gameSpeed ~= 0 then
            SetGameSpeed(0)
        end
        preNISSettings.Units = GetSelectedUnits()
        SelectUnits({})
        RenderOverlayEconomy(false)
    else
        import('/lua/ui/game/worldview.lua').UnlockInput()
        import('/lua/ui/game/multifunction.lua').PostNIS()
        HideGameUI(state)
        HideNISBars()
        if preNISSettings.restoreSplitScreen then
            import("/lua/ui/game/borders.lua").SplitMapGroup(true, true)
        end
        -- worldView.viewLeft:EnableResourceRendering(preNISSettings.Resources)   -- Nothing to re-enable
        worldView.viewLeft:SetCartographic(preNISSettings.Cartographic)
        -- Todo: Restore settings of overlays, lifebars properly
        ConExecute('UI_RenderUnitBars true')
        ConExecute('UI_NisRenderIcons true')
        ConExecute('ren_SelectBoxes true')
        for i, v in rangePrefs do
            if Prefs.GetFromCurrentProfile(i) == nil then
                ConExecute(i..' true')
            else
                ConExecute(i..' '..tostring(Prefs.GetFromCurrentProfile(i)))
            end
        end
        if GetGameSpeed() ~= preNISSettings.gameSpeed then
            SetGameSpeed(preNISSettings.gameSpeed)
        end
        SelectUnits(preNISSettings.Units)
        import('/lua/ui/game/consoleecho.lua').ToggleOutput(true)
    end
    import('/lua/ui/game/missiontext.lua').SetLayout()
end