if arg[2] == "debug" then
    require("lldebugger").start()
end            

function love.load()
    Flux = require "lib/flux"
    Card = require "card"
    Physic = require "component/physic"
    Graphic = require "component/graphic"
    Mouse = require "core/mouseObject"
    CardContainer = require "core/CardContainer"

    cardContainer = CardContainer:new(love.graphics.getWidth()/2, love.graphics.getHeight()*2/3, 100)

    for i = 1, 10 do
        local card = Card:new(0,0, 80, 130)
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
end
function love.draw()
    Graphic:Update()
end