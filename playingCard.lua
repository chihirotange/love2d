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
    love.graphics.print(self.Rank, self.x + 5, self.y + 5)
    love.graphics.print(self.Suit, self.x + 45, self.y + 5)
    love.graphics.setColor(1, 1, 1)
end

function PlayingCard:OnSelected()
    Card.OnSelected(self)
    Debug.Log(self.Suit)
end

return PlayingCard