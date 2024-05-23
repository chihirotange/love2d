local class = require("lib/middleclass")
local PlayingCard = require "playingCard"

local cardDealer = class("Card Dealer")
function cardDealer:initialize(deck)
    if not deck then return end
    self.remainingCards = {}

    for k,v in ipairs(deck) do
        table.insert(self.remainingCards, v)
    end
    table.shuffle(self.remainingCards)
end

function cardDealer:dealSingleCard()
    local dealtCard = PlayingCard:new()
    local dealtCardData = table.pop(self.remainingCards)
    if not dealtCardData then return end
    dealtCard.Suit = dealtCardData.Suit
    dealtCard.Rank = dealtCardData.Rank
    dealtCard.Value = dealtCardData.value
    return dealtCard
end

return cardDealer