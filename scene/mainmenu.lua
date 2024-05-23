local Scene = require "scene/scene"
local UISystem = require "lib/ui"
local CardDealer = require "core/cardDealer"
local CardContainer = require "core/cardContainer"
local deck = require "data/deckData"

local function CreateUI()
    local canvas = UISystem:createCanvas()
    canvas:createButton(10,10, 200, 30, "Play")
    canvas:createButton(500,10, 200, 30, "Discard")
end

local SceneMainMenu = Scene:new()
function SceneMainMenu:Load()
    local cardContainer = CardContainer:new(love.graphics.getWidth()/2, love.graphics.getHeight()*2/3)
    local cardDealer = CardDealer:new(deck.defaultDeck)
    for i = 1, 5 do
        local card = cardDealer:dealSingleCard()
        if card then 
            self.SceneManager.PlayerController:AddObjectToMouseOverlapDetection(card)
            cardContainer:AddItemToContainer(card)
        end
    end

    --create ui
    CreateUI()
end


return SceneMainMenu