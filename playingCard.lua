local class = require "lib/middleclass"
local Card = require "card"

local PlayingCard = class("Playing Card", Card)
PlayingCard.Suit = "Heart"
PlayingCard.Value = 1
PlayingCard.Rank = "K"
function PlayingCard:initialize(x, y, width, height)
    Card.initialize(self, x, y, width, height);
end
function PlayingCard:Draw()
    Card.Draw(self)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print(self.Rank, self.x, self.y)
    love.graphics.print(self.Suit, self.x + 40, self.y)
    love.graphics.setColor(1, 1, 1)
end

function PlayingCard:OnMouseClicked()
end

return PlayingCard