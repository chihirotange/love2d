if arg[2] == "debug" then
    require("lldebugger").start()
end            

require "lib/vectorMath"
require "lib/extendedTable"

function love.load()
    Playground()
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

    for i = 1, 100 do
        local card = Card:new(0,0, 80, 130)
        Mouse:AddObjectToMouseOverlapDetection(card)
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

    UISystem:Update()
    Mouse:Update(dt)
    Debug:Update(dt)
end
function love.draw()
    Graphic:Update()
    UISystem:Draw()
    Debug:Draw()
end

function love.mousepressed()
    UISystem:OnMouseClicked()
end

function Playground()
    local sceneManager = require "scene/sceneManager"
    sceneManager:LoadScene("scene/mainmenu")
end