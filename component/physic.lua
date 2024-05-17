-- local class = require "../lib/middleclass"

PhysicComponents = {}
PendingAddPhysicComponents = {}
PendingRemovePhysicComponents = {}

MouseState = {
    isHoldingSomething = false,
    holdingObject = nil,
    Update = function(self)
        if love.mouse.isDown(1) and not self.isHoldingSomething then
            for k, v in ipairs(PhysicComponents) do
                if v:IsCollideWithMouse() and not self.isHoldingSomething then
                    self.isHoldingSomething = true
                    self.holdingObject = v
                end
            end
            if self.holdingObject then
                self.holdingObject:OnMouseDown()
            end
        end

        if self.isHoldingSomething and not love.mouse.isDown(1) then
            if self.holdingObject then
                self.holdingObject:OnMouseReleased()
                self.isHoldingSomething = false
            end 
        end
    end
}

local function lerp(a,b,t) return (1-t)*a + t*b end

function TickPhysic()
    -- add pending
    for k,v in ipairs(PendingAddPhysicComponents) do
        table.insert(PhysicComponents, v)
        PendingAddPhysicComponents[k] = nil -- this will "delete" the item from array,
    end
    for k, v in ipairs(PhysicComponents) do
        v:PrephysicUpdate()
    end

    MouseState:Update()

    for k, v in ipairs(PhysicComponents) do
        v:PhysicUpdate()
    end
end
HasPhysic = {
    x = 0,
    y = 0,
    -- addedToPhysicUpdate = false,
    AddToPhysicEngineUpdate = function(self)
        -- if self.addedToPhysicUpdate then
        --     return
        -- else
        table.insert(PendingAddPhysicComponents, self)
            -- self.addedToPhysicUpdate = true
        -- end
    end,
    PrephysicUpdate = function(self)
    end,
    PhysicUpdate = function(self)
    end
}
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
}

-- ColliderObject = class("ColliderObject")
-- function ColliderObject:IsCollideWithMouse()
-- end

-- HasBoxCollider = class("ColliderObject")
HasBoxCollider = {
        HasBoxCollider = {
            isMouseAlreadyDown = false,
        },
        width = 100,
        height = 100,
        isMouseOver = false,
        -- AddToUpdate = function(self)
        --     table.insert(PendingAddPhysicComponents,self)
        -- end,
        -- RemoveFromUpdate = function(self)
        --     table.remove(PendingRemovePhysicComponents, self)
        -- end,
        Update = function(self)
        --     local mouseX, mouseY = love.mouse.getPosition()
        --     if self.x <= mouseX and mouseX <= self.x + self.width 
        --     and self.y <= mouseY and mouseY <= self.y + self.height then
        --         self:OnMouseEntered()
    
        --         if love.mouse.isDown(1) then
        --             self:OnMouseClicked()
        --             if not self.HasBoxCollider.isMouseAlreadyDown then
        --                 self:OnMouseDown()
        --                 self.HasBoxCollider.isMouseAlreadyDown = true
        --             end
        --         end
                
        --     end
        --     if not love.mouse.isDown(1) and self.HasBoxCollider.isMouseAlreadyDown then
        --         self.HasBoxCollider.isMouseAlreadyDown = false
        --         self:OnMouseReleased()
        --     end
        end,
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
}

CanBeMoved = {
    MoveToPosition = function(self, x, y)
        self.x = lerp(self.x, x, 0.1)
        self.y = lerp(self.y, y, 0.1)
    end
}