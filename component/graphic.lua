RenderComponents = {}
PendingAddRenderComponents = {}

function TickRender()
    for k, v in ipairs(PendingAddRenderComponents) do
        table.insert(RenderComponents, v)
        PendingAddRenderComponents[k] = nil
    end
    for k, v in ipairs(RenderComponents) do
        v:Draw()
    end
end

CanBeRendered = {
    AddToRenderEngineUpdate = function(self)
        print("added")
        table.insert(PendingAddRenderComponents, self)
    end,
    drawIndex = 0,
    Draw = function(self)
    end
}