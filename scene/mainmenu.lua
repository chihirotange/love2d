local Scene = require "scene/scene"

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
end

return SceneMainMenu