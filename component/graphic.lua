local graphic = {
    RenderComponents = {},
    PendingAddRenderComponents = {},
    AddToRenderUpdate = function(self, object)
        table.insert(self.PendingAddRenderComponents, object)
    end,
    Draw = function(self) 
        for k, v in ipairs(self.PendingAddRenderComponents) do
            table.insert(self.RenderComponents, v)
            self.PendingAddRenderComponents[k] = nil
        end
        for k, v in ipairs(self.RenderComponents) do
            v:Draw()
        end
    end,
    CanBeRendered = {
        drawIndex = 0,
        Draw = function(self)
        end
    }
}
return graphic