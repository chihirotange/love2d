local class = require "lib/middleclass"
local Physic = require "component/physic"
local Graphic = require "component/graphic"

local Card = class("Card")

--CONSTRUCTOR
function Card:initialize(x, y, width, height)
    self.isSelected = false
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
    else
        self:MoveToPosition(self.OriginX - self.width/2, self.OriginY - self.height/2)
    end
end
Card:include(Physic.HasBoxCollider)

Card:include(Physic.CanBeGrabbed)
function Card:OnBeingGrabbed()
    self.isBeingGrabbed = true
end
function Card:OnBeingReleased()
    self.isBeingGrabbed = false
end

Card:include(Physic.CanbeSelected)
function Card:OnSelected()
    self.isSelected = true
end
function Card:OnDeselected()
    self.isSelected = false
end
function Card:IsBeingSelected()
    return self.isSelected
end

Card:include(Physic.CanBeMoved)
Card:include(Physic.HasOrigin)

-- EVENTS
function Card:TestFunc()
end

-- GRAPHICS
Card:include(Graphic.CanBeRendered)
function Card:Draw()
    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    if self.isSelected then
        love.graphics.setColor(1, 0, 0)
        love.graphics.rectangle("line", self.x - 2, self.y - 2, self.width + 4, self.height + 4)
    end
end

-- GAMEPLAY

return Card