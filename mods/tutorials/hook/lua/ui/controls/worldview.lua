local oldWorldView = WorldView
WorldView = Class(oldWorldView) {

    OnUpdateCursor = function(self)
        if NoOrdersAllowed then
            if not self.Cursor then
                self.Cursor = {UIUtil.GetCursor("DEFAULT")}
                self:ApplyCursor()
            end
            return
        end
        oldWorldView.OnUpdateCursor(self)
    end
}
