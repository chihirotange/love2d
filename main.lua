if arg[2] == "debug" then
    require("lldebugger").start()
end            

function love.load()
    flux = require "lib/flux"
    require("card")
    require("component/physic")
    require("component/graphic")

    card1 = Card:new(100, 100)
    card1 = Card:new(200, 200)
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