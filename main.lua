if arg[2] == "debug" then
    require("lldebugger").start()
end            

function love.load()
    flux = require "lib/flux"
    require("card")
    require("component/physic")

    card1 = Card:new()
    card1:AddToUpdate()

end
function love.update(dt)
    flux.update(dt)
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end

    TickPhysic()

end
function love.draw()
    card1:Draw()
end