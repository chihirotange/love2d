local Physic = {
    PhysicComponents = {},
    PendingAddPhysicComponents = {},
    AddToPhysicUpdate = function(self, object)
        table.insert(self.PendingAddPhysicComponents, object)
    end,
    Update = function(self)
        for k,v in ipairs(self.PendingAddPhysicComponents) do
            table.insert(self.PhysicComponents, v)
            self.PendingAddPhysicComponents[k] = nil -- this will "delete" the item from array,
        end
        for k, v in ipairs(self.PhysicComponents) do
            v:PhysicUpdate()
        end
    end,
    OnMouseClicked = function(self)
        for k,v in ipairs(self.PhysicComponents) do
            if v:IsCollideWithMouse() then
                v:OnMouseClicked()
            end
        end
    end,
    HasPhysic = {
        x = 0,
        y = 0,
        PhysicUpdate = function(self)
        end
    },
    CanListenToMouseEvents = {
        mouseTraceOrder = 0,
        OnMouseEntered = function(self)
        end,
        OnMouseClicked = function(self)
        end,
        OnMouseDown = function(self)
        end,
        OnMouseReleased = function(self)
        end
    },
    HasBoxCollider = {
            width = 100,
            height = 100,
            -- @TODO: move to metatable
            IsCollideWithMouse = function(self)
                local mouseX, mouseY = love.mouse.getPosition()
                if self.x <= mouseX and mouseX <= self.x + self.width 
                and self.y <= mouseY and mouseY <= self.y + self.height then
                    return true
                else
                    return false
                end  
            end
    },
    CanBeMoved = {
        MoveToPosition = function(self, x, y)
            self.x = lerp(self.x, x, 0.2)
            self.y = lerp(self.y, y, 0.2)
        end
    },
    HasOrigin = {
        OriginX = 0,
        OriginY = 0,
        SetOrigin = function(self, x, y)
            self.OriginX = x
            self.OriginY = y 
        end,
        GetOrigin = function(self)
            return self.OriginX, self.OriginY
        end
    }
}
function lerp(a,b,t) return (1-t)*a + t*b end

return Physic