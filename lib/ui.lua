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

local uiSystem = {
    Elements = {},
    Draw = function(self)
        for k,v in ipairs(self.Elements) do
            v:Draw()
        end
    end,
    Update = function(self)
        for k,v in ipairs(self.Elements) do
            if v:IsMouseOver() then
                v:OnMouseOver()
            end
            if v.isHovered and not v:IsMouseOver() then
                v:OnMouseExit()
            end
        end
    end,
    OnMouseClicked = function(self)
        for k,v in ipairs(self.Elements) do
            if v:IsMouseOver() then
                v:OnMouseClicked()
            end
        end
    end,
    button = class("Button", uiElement)
}

uiSystem.button:include({
    initialize = function(self, x, y, w, h, text, color)
        self.x = x or 0
        self.y = y or 0
        self.width = w or 0
        self.height = h or 0
        self.color = color or {0, 0.5, 0.7}
        self.text = text or "Button"
        table.insert(uiSystem.Elements, self)
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
        print(self.text)
    end,
    OnMouseOver = function(self)
        self.isHovered = true
    end,
    OnMouseExit = function(self)
        self.isHovered = false
    end
})

return uiSystem