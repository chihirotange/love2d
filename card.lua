local class = require "lib/middleclass"
require "component/physic"
require "component/graphic"

Card = class("Card")

--CONSTRUCTOR
function Card:initialize(x, y, width, height)
    self.x = x or 0
    self.y = y or 0
    self.width = width or 50
    self.height = height or 50
    self:AddToPhysicEngineUpdate()
    self:AddToRenderEngineUpdate()

    -- Local members
    Card.isBeingGrabbed = false
end


-- PHYSICS
Card:include(HasPhysic)
function Card:PrephysicUpdate()
    if self.isBeingGrabbed then
        local mouseX, mouseY = love.mouse.getPosition()
        self:MoveToPosition(mouseX - self.width/2, mouseY - self.height/2)
    end
end
function Card:PhysicUpdate()
    HasBoxCollider.Update(self)
end

Card:include(HasBoxCollider)
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

Card:include(CanBeMoved)

-- GRAPHICS
Card:include(CanBeRendered)
function Card:Draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end