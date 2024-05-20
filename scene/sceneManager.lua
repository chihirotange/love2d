local SceneManager = {
    currentScreen = nil,
    Init = function(self, playerController, gameplayEventSystem)
        self.PlayerController = playerController
        self.GameplayEventSystem = gameplayEventSystem
    end,
    LoadScene = function(self, pathToScene)
        self.currentScreen = require ("" .. pathToScene)
        if self.currentScreen then
            self.currentScreen.SceneManager = self
            self.currentScreen:Load()
        else
            print("coudln't load screen," .. pathToScene .. "path is wrong?")
        end
    end,
    Update = function(self, dt)
        self.currentScreen:Update(dt)  
    end,
    Draw = function(self)
        self.currentScreen:Draw()
    end
}

return SceneManager