local class = require "lib/middleclass"

local uiElement = class("UI Element")
uiElement:include({
    x = 0,
    y = 0,
    isHovered = false,
    Update = function(self)
    end,
    Draw = function(self)
    end,
    OnMouseClicked = function(self)
    end,
    OnMouseOver = function(self)
    end,
    OnMouseExit = function(self)
    end,
    IsMouseOver = function(self)
    end
})

local button = class("Button", uiElement)
button:include({
    initialize = function(self, x, y, w, h, text, color)
        self.x = x or 0
        self.y = y or 0
        self.width = w or 0
        self.height = h or 0
        self.color = color or {0, 0.5, 0.7}
        self.text = text or "Button"
    end,
    Draw = function(self)
        if(self.isHovered) then
            love.graphics.setColor({0, 0.8, 0.8})
            love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
            love.graphics.setColor({1,1,1})
            love.graphics.printf(self.text, self.x, self.y + self.height/4, self.width, "center")
        else
            love.graphics.setColor(self.color)
            love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
            love.graphics.setColor({1,1,1})
            love.graphics.printf(self.text, self.x, self.y + self.height/4, self.width, "center")
        end
    end,
    IsMouseOver = function(self)
        local mouseX, mouseY = love.mouse.getPosition()
        return mouseX >= self.x and mouseX <= self.x + self.width 
        and mouseY >= self.y and mouseY <= self.y + self.height
    end,
    OnMouseClicked = function(self)
        Debug.Log(self.text)
    end,
    OnMouseOver = function(self)
        self.isHovered = true
    end,
    OnMouseExit = function(self)
        self.isHovered = false
    end
})

local canvas = class("Canvas", uiElement)
canvas:include{
    uiElements = {},
    initialize = function(self, x, y, width, height)
        self.x = x or 0
        self.y = y or 0
        self.width = width or love.graphics.getWidth()
        self.height = height or love.graphics.getHeight()
    end,
    OnMouseClicked = function(self)
        for k, v in ipairs(self.uiElements) do
            if v:IsMouseOver() then
                v:OnMouseClicked()
            end
        end
    end,
    Update = function(self, dt)
        -- detect mouse activity
        for k, v in ipairs(self.uiElements) do
            if v:IsMouseOver() then
                v:OnMouseOver()
            end
            if v.isHovered and not v:IsMouseOver() then
                v:OnMouseExit()
            end
        end
    end,
    Draw = function(self)
        love.graphics.rectangle("line", self.x, self.y, self.width - 1, self.height - 1)
        for k, v in ipairs(self.uiElements) do
            v:Draw()
        end
    end,
}
canvas.createButton = function(self, x, y, w, h, text, color)
        local createdButton = button:new(x, y, w, h, text, color)
        table.insert(self.uiElements, createdButton)
        return createdButton
end

local uiSystem = {
    canvases = {},
    Draw = function(self)
        for k,v in ipairs(self.canvases) do
            v:Draw()
        end
    end,
    Update = function(self, dt)
         for k,v in ipairs(self.canvases) do
            v:Update(dt)
        end
    end,
    OnMouseClicked = function(self)
        for k,v in ipairs(self.canvases) do
            v:OnMouseClicked()
        end
    end,
    createCanvas = function(self, x, y, width, height)
        local createdCanvas = canvas:new(x, y, width, height)
        table.insert(self.canvases, createdCanvas)
        return createdCanvas
    end
}

return uiSystem