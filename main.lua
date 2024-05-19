if arg[2] == "debug" then
    require("lldebugger").start()
end            

function love.load()
    Flux = require "lib/flux"
    Card = require "playingCard"
    Physic = require "component/physic"
    Graphic = require "component/graphic"
    Mouse = require "core/mouseObject"
    CardContainer = require "core/cardContainer"
    GameplayEventSystem = require "core/gameplayEventSystem"
    cardContainer = CardContainer:new(love.graphics.getWidth()/2, love.graphics.getHeight()*2/3, 100)
    UISystem = require "lib/ui"
    
    Debug = require "lib/debug"

    gameUI = require "gameUi"

    gameUI:Init(GameplayEventSystem)
    gameUI:CreateUI()

    playerController = require "playerController"
    playerController:Init(GameplayEventSystem)

    for i = 1, 1000 do
        local card = Card:new(0,0, 80, 130)
        GameplayEventSystem:BindToUIPlayCardEvent(card.TestFunc)
        cardContainer:AddItemToContainer(card)
    end
end
function love.update(dt)
    Flux.update(dt)
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end
    Physic:Update()

    Mouse:DetectMouseOnObjectsEvent(Physic.PhysicComponents)
    UISystem:Update()
    Debug:Update(dt)
end
function love.draw()
    Graphic:Update()
    UISystem:Draw()
    Debug:Draw()
end

function love.mousepressed()
    Physic:OnMouseClicked()
    UISystem:OnMouseClicked()
end