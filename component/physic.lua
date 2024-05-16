PhysicComponents = {}
PendingAddPhysicComponents = {}
PendingRemovePhysicComponents = {}

function TickPhysic()
    -- add pending
    for k,v in ipairs(PendingAddPhysicComponents) do
        table.insert(PhysicComponents, v)
        PendingAddPhysicComponents[k] = nil -- this will "delete" the item from array,
    end
    for k, v in ipairs(PhysicComponents) do
        v:Update()
    end
end

HasPosition = {
    x = 0,
    y = 0
}

HasBoxCollider = {
    width = 100,
    height = 100,
    isMouseOver = false,
    AddToUpdate = function(self)
        table.insert(PendingAddPhysicComponents,self)
    end,
    RemoveFromUpdate = function(self)
        table.remove(PendingRemovePhysicComponents, self)
    end,
    Update = function(self)
        local mouseX, mouseY = love.mouse.getPosition()
        if self.x <= mouseX and mouseX <= self.x + self.width 
        and self.y <= mouseY and mouseY <= self.y + self.height then
            self:OnMouseEntered()

            if love.mouse.isDown(1) then
                self:OnMouseClicked()
            end
        end
    end,
    OnMouseEntered = function(self)
    end,
    OnMouseClicked = function(self)
    end
}

CanBeMoved = {
    MoveToPosition = function(self, x, y)
        self.x = x
        self.y = y
    end
}