local Scene = require "scene/scene"

local SceneMainMenu = Scene:new()
function SceneMainMenu:Load()
    local Card = require "playingCard"
    for i = 1, 100 do
        local card = Card:new(0,0, 80, 130)
        self.SceneManager.PlayerController:AddObjectToMouseOverlapDetection()
        self.SceneManager.GameplayEventSystem:BindToUIPlayCardEvent(card.TestFunc)
        -- cardContainer:AddItemToContainer(card)
    end
end

return SceneMainMenu