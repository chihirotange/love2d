local class = require "lib/middleclass"
local Physic = require "component/physic"
local Graphic = require "component/graphic"

local Card = class("Card")

--CONSTRUCTOR
function Card:initialize(x, y, width, height)
    self.x = x or 0
    self.y = y or 0
    self.width = width or 50
    self.height = height or 50
    Physic:AddToPhysicUpdate(self)
    Graphic:AddToRenderUpdate(self)
    Card.isBeingGrabbed = false
end


-- PHYSICS
Card:include(Physic.HasPhysic)
function Card:PhysicUpdate()
    if self.isBeingGrabbed then
        local mouseX, mouseY = love.mouse.getPosition()
        self:MoveToPosition(mouseX - self.width/2, mouseY - self.height/2)
        self.GameplayEventSystem:EmitCardSelectedEvent()
    else
        self:MoveToPosition(self.OriginX - self.width/2, self.OriginY - self.height/2)
    end

end
Card:include(Physic.HasBoxCollider)

Card:include(Physic.CanListenToMouseEvents)
function Card:OnMouseEntered()
end
function Card:OnMouseClicked()
end
function Card:OnMouseDown()
    self.isBeingGrabbed = true
end
function Card:OnMouseReleased()
    self.isBeingGrabbed = false
end

Card:include(Physic.CanBeMoved)
Card:include(Physic.HasOrigin)

-- EVENTS
function Card:TestFunc()
    print("hello")
end

-- GRAPHICS
Card:include(Graphic.CanBeRendered)
function Card:Draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Card