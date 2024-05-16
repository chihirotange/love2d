local class = require "lib/middleclass"
require "component/physic"
require "component/graphic"

Card = class("Card")

-- PHYSICS
Card:include(HasPosition)
Card.x = 100
Card.y = 200

Card:include(HasBoxCollider)
Card.width = 100
Card.height = 150
function Card:OnMouseEntered()
end
function Card:OnMouseClicked()
    self:MoveToPosition(math.random(400), math.random(400))
end

Card:include(CanBeMoved)
-- GRAPHICS
Card:include(CanBeRendered)
function Card:Draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end