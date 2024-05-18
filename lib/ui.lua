local class = require "lib/middleclass"

local uiSystem = class("UI System")

uiSystem:include({

})

uiSystem.Button = class("Button")
function uiSystem.Button:initialize(x, y, w, h, color, text)
    love.graphics.rectangle(x, y, w, h)
    love.graphics.setColor(color)
    love.graphics.print(text, x, y)
end

return uiSystem