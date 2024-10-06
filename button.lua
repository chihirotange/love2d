local baseNode = require('baseNode')
local button = baseNode:extend()

function button:new(name, x, y, width, height)
  self.name = name
  self.x = x
  self.y = y
  self.width = width
  self.height = height
  self.bgColor = {255, 255, 255}
  self.hoveredBgColor = {255, 0, 0}
  self.textColor = {0, 0, 255}
  self.hoveredTextColor = {255, 255, 255}
  self._currentBgColor = self.bgColor
  self._currentTextColor = self.textColor
  self.isHovering = false
end

function button:draw()
  love.graphics.setColor(self._currentBgColor)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
  love.graphics.setColor(self._currentTextColor)
  love.graphics.printf(self.name, self.x, self.y, self.width, "center")
end

function button:update(dt)
end

function button:isCollide(x, y)
  return self.x <= x
  and x <= self.x + self.width
  and self.y <= y
  and y <= self.y + self.height
end

function button:hover()
  self._currentBgColor = self.hoveredBgColor
  self._currentTextColor = self.hoveredTextColor
end

function button:hoverExit()
  self._currentBgColor = self.bgColor
  self._currentTextColor = self.textColor
end

function button:onPressed()
  print("hello")
end

function button:getVerticalBound()
  return self.height
end

function button:getHorizontalBound()
  return self.width
end

return button
