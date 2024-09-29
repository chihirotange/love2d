local panel = require('panel')
local verticalPanel = panel:extend()

function verticalPanel:new(cursor, x, y, width, height)
  verticalPanel.super.new(self, cursor, x, y, width, height)
  self._contentSpacing = 0
end

function verticalPanel:add(node)
  verticalPanel.super.add(self, node)
  local nodeIndex = #self.nodes - 1
  node:updateOrigin(self.x + self.width/2 - node:getHorizontalBound()/2,
                    self.y + nodeIndex * node:getVerticalBound() + nodeIndex * self._contentSpacing)
end

function verticalPanel:setContentSpacing(value)
  self._contentSpacing = value or 0
end

return verticalPanel
