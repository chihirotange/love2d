local UISystem = require "lib/ui"

local gameUi = {
    Init = function(self, eventSystem)
        if not eventSystem then
            print("event system not valid when create Game UI!")
        end
        self.eventSystem = eventSystem
    end,
    CreateUI = function(self)
        local button = UISystem.button:new(10, 10, 120, 40, "Play")
        local button2 = UISystem.button:new(200, 10, 120, 40, "Discard")
    end
}

return gameUi