local object = require('libs.classic')

local baseNode = object:extend()

baseNode.isHovering = false

function baseNode:update(dt)
end

function baseNode:draw()
end

function baseNode:isCollide(x, y)
end

function baseNode:onHover()
end

function baseNode:onPressed()
end

function baseNode:updateOrigin(x, y)
  self.x = x
  self.y = y
end

-- for vertical panels to get the size incase of for example radius vs height
function baseNode:getVerticalBound()
  return 0
end

function baseNode:getHorizontalBound()
  return 0
end

return baseNode
