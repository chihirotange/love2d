local class = require "lib/middleclass"
local graphic = require "component/graphic"
local physic = require "component/physic"

local CardContainer = class("Card Container")
function CardContainer:initialize(x, y, cardGap)
    self.x = x or 0 
    self.y = y or 0
    self.CardGap = cardGap or 100
    graphic:AddToRenderUpdate(self)
end

--physic
CardContainer:include(physic.HasPhysic)

CardContainer:include(graphic.CanBeRendered)
function CardContainer:Draw()
    love.graphics.circle("fill", self.x , self.y, 2)
    for k,v in ipairs(self.ItemsList) do
        local x, y = v:GetOrigin()
        love.graphics.circle("fill", x, y, 5)
    end
end

--
CardContainer:include({
    CardGap = 0,
    ItemsList = {},
    love.mouse.getPosition()
})
function CardContainer:AddItemToContainer(item)
    if item.SetOrigin then
        table.insert(self.ItemsList, item)
        for i = 1,#self.ItemsList do
            local x = self.x + (i - 1) * self.CardGap - (#self.ItemsList - 1) * self.CardGap/2 
            self.ItemsList[i]:SetOrigin(x, self.y)
        end
    end
end

return CardContainer