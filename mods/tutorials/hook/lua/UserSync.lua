local oldOnSync = OnSync
OnSync = function()
	oldOnSync()
	if Sync.OpenURL then
        OpenURL(Sync.OpenURL)
	end
end