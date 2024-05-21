if arg[2] == "debug" then
    require("lldebugger").start()
end            

require "lib/vectorMath"
require "lib/extendedTable"
require "lib/debug"

local PlayerController = require "core/playerController"
local GameplayEventSystem = require "core/gameplayEventSystem"
local UISystem = require "lib/ui"

function love.load()
    Playground()
    Flux = require "lib/flux"
    Physic = require "component/physic"
    Graphic = require "component/graphic"

    SceneManager = require "scene/sceneManager"
    SceneManager:Init(PlayerController, GameplayEventSystem)

    SceneManager:LoadScene("scene/mainmenu")

end
function love.update(dt)
    Flux.update(dt)

    if love.keyboard.isDown("escape") then
        love.event.quit()
    end

    Physic:Update()

    SceneManager:Update(dt)
    PlayerController:Update(dt)
    UISystem:Update(dt)

    Debug:Update(dt)
end
function love.draw()
    Graphic:Draw()
    UISystem:Draw()
    Debug:Draw()
end

function love.mousepressed()
    UISystem:OnMouseClicked()
end

function Playground()
end