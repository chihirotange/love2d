local object = require('classic')
local simpleUi = object:extend()
local panel = require('panel')
local button = require('button')
local verticalPanel = require('verticalPanel')

function simpleUi:new(cursor)
  self.panels = {}
  if not cursor then
    print("ERROR: cursor object is null!")
    return
  end
  self.cursor = cursor
end

function simpleUi.button(name,x, y, width, height)
  local newBtn = button(name, x, y, width, height)
  return newBtn
end

function simpleUi:panel(x, y, width, height)
  local newPanel = panel(self.cursor, x, y, width, height)
  table.insert(self.panels, newPanel)
  return newPanel
end

function simpleUi:verticalPanel(x, y, width, height)
  local newPanel = verticalPanel(self.cursor, x, y, width, height)
  table.insert(self.panels, newPanel)
  return newPanel
end

function simpleUi:update(dt)
  for i, p in ipairs(self.panels) do
    p:update(dt)
  end
end

function simpleUi:draw()
  for i, p in ipairs(self.panels) do
    p:draw()
  end
end

return simpleUi
