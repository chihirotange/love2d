if arg[2] == "debug" then
    require("lldebugger").start()
end            

function love.load()
    Flux = require "lib/flux"
    Card = require "card"
    Physic = require "component/physic"
    Graphic = require "component/graphic"
    Mouse = require "core/mouseObject"

    card1 = Card:new(20, 100, 100, 150)
    -- card2 = Card:new(400, 150, 100, 150)
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