local object = require('libs.classic')

local panel = object:extend()

function panel:new(cursor, x, y, width, height)
  self.nodes = {}
  self.cursor = cursor
  self.x = x
  self.y = y
  print(self.x)
  self.width = width
  print(self.width)
  self.height = height
  self._alignment = "centered"
  self.cursor:addListener(self)
end

function panel:add(node)
  table.insert(self.nodes, node)
end

function panel:update(dt)
  for i, node in ipairs(self.nodes) do
    if node:isCollide(self.cursor.x, self.cursor.y) then
      node.isHovering = true
      node:hover()
    else
      if node.isHovering then
        node:hoverExit()
        node.isHovering = false
      end
    end
  end
end

function panel:draw()
  --draw bound
  love.graphics.setColor(0, 255, 0)
  love.graphics.rectangle("line", self.x, self.y, self.width, self.height)

  for i, node in ipairs(self.nodes) do
    node:draw()
  end
end

function panel:onPressed()
  for i, node in ipairs(self.nodes) do
    if node:isCollide(self.cursor.x, self.cursor.y) then
      node.onPressed()
    end
  end
end

return panel
