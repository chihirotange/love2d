if arg[2] == "debug" then
    require("lldebugger").start()
end            

require "lib/vectorMath"
require "lib/extendedTable"

function love.load()
    Playground()
    Flux = require "lib/flux"
    Physic = require "component/physic"
    Graphic = require "component/graphic"
    local PlayerController = require "core/mouseObject"
    -- CardContainer = require "core/cardContainer"
    local GameplayEventSystem = require "core/gameplayEventSystem"
    -- cardContainer = CardContainer:new(love.graphics.getWidth()/2, love.graphics.getHeight()*2/3, 100)
    -- UISystem = require "lib/ui"

    SceneManager = require "scene/sceneManager"
    SceneManager:Init(PlayerController, GameplayEventSystem)
    
    -- Debug = require "lib/debug"

    -- gameUI = require "gameUi"

    -- gameUI:Init(GameplayEventSystem)
    -- gameUI:CreateUI()

    SceneManager:LoadScene("scene/mainmenu")

end
function love.update(dt)
    -- Flux.update(dt)
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end
    -- Physic:Update()

    -- UISystem:Update()
    -- Debug:Update(dt)
    SceneManager:Update(dt)
end
function love.draw()
    Graphic:Draw()
    -- UISystem:Draw()
    -- Debug:Draw()
    -- SceneManager:Draw()
end

function love.mousepressed()
    -- UISystem:OnMouseClicked()
end

function Playground()
    -- local sceneManager = require "scene/sceneManager"
    -- sceneManager:LoadScene("scene/mainmenu")
end