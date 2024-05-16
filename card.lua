local class = require "lib/middleclass"
require "component/physic"

Card = class("Card")

Card.x = 100
Card.y = 100
Card.width = 100
Card.height = 150
Card:include(HasBoxCollider)
function Card:OnMouseEntered()
    print("mouse entered")
end

function Card:Draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Card:initialize(name)
    self.name = name
end

function Card:Speak()
    print(self.name)
end