PhysicComponents = {}

function TickPhysic()
    for k, v in ipairs(PhysicComponents) do
        v:Update()
    end
end

HasBoxCollider = {
    AddToUpdate = function(self)
        table.insert(PhysicComponents,self)
    end,
    Update = function(self)
        local mouseX, mouseY = love.mouse.getPosition()
        if self.x <= mouseX and mouseX <= self.x + self.width 
        and self.y <= mouseY and mouseY <= self.y + self.height then
            self:OnMouseEntered()
        else
        end
    end,
    OnMouseEntered = function(self)
    end
}