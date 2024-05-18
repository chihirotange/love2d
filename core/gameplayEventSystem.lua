local gameplayEventSystem = {
    InitGameplayEventSystem = function(self, objectToInit)
        objectToInit.GameplayEventSystem = self
    end,
    -- card select
    CardSelectedListeners = {},
    BindToCardSelectedEvent = function(self, delegate)
        table.insert(self.CardSelectedListeners, delegate)
    end,
    EmitCardSelectedEvent = function(self)
        for k,v in ipairs(self.CardSelectedListeners) do
            v() -- magic
        end
    end,


    CanEmitEvent = {
        GameplayEventSystem = nil,
    }
}

return gameplayEventSystem