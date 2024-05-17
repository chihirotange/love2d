if arg[2] == "debug" then
    require("lldebugger").start()
end            

function love.load()
    flux = require "lib/flux"
    soft = require "lib/soft"
    class = require "lib/middleclass"
    require("card")
    require("component/physic")
    require("component/graphic")

    card1 = Card:new(20, 100, 100, 150)
    card2 = Card:new(400, 150, 100, 150)
end
function love.update(dt)
    flux.update(dt)
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end
    TickPhysic()
end
function love.draw()
    TickRender()
end