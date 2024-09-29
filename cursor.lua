local object = require('libs.classic')

local cursor = object:extend()

function cursor:new()
  self.x = 0
  self.y = 0
  self.listeners = {}
end

function cursor:update(dt)
  -- mouse location
  self.x, self.y = love.mouse.getPosition()
  -- mouse action
end

function cursor:draw(dt)
  love.graphics.setColor(0, 255, 0)
  love.graphics.circle("fill", self.x, self.y , 2)
end

function cursor:addListener(listener)
  table.insert(self.listeners, listener)
end

local cursorInstance = cursor()

function love.mousepressed()
  for i, l in ipairs(cursorInstance.listeners) do
    l:onPressed()
  end
end

return cursorInstance
