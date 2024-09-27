local object = require('classic')
local button = object:extend()

function button:new(name, x, y, width, height)
  self.name = name
  self.x = x
  self.y = y
  self.width = width
  self.height = height
end

function button:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
  love.graphics.print(self.name, self.x, self.y)
end
