local Scene = require "scene/scene"
local UISystem = require "lib/ui"

local function CreateUI()
    local canvas = UISystem:createCanvas()
    canvas:createButton(10,10, 200, 30, "Play")
    canvas:createButton(500,10, 200, 30, "Discard")
end

local SceneMainMenu = Scene:new()
function SceneMainMenu:Load()
    local Card = require "playingCard"
    local CardContainer = require "core/cardContainer"
    local cardContainer = CardContainer:new(love.graphics.getWidth(), love.graphics.getHeight()*2/3)
    for i = 1, 100 do
        local card = Card:new(0,0, 80, 130)
        self.SceneManager.PlayerController:AddObjectToMouseOverlapDetection(card)
        self.SceneManager.GameplayEventSystem:BindToUIPlayCardEvent(card.TestFunc)
        cardContainer:AddItemToContainer(card)
    end

    --create ui
    CreateUI()
end


return SceneMainMenu