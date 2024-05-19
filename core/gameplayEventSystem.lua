local gameplayEventSystem = {
    InitGameplayEventSystem = function(self, objectToInit)
        objectToInit.GameplayEventSystem = self
    end,
    -- card select
    CardSelectedListeners = {1},
    BindToCardSelectedEvent = function(self, delegate)
        table.insert(self.CardSelectedListeners, delegate)
    end,
    EmitCardSelectedEvent = function(self)
        for k,v in ipairs(self.CardSelectedListeners) do
            v() -- magic
        end
    end,

    UIPlayCardListeners = {},
    BindToUIPlayCardEvent = function(self, delegate)
        table.insert(self.UIPlayCardListeners, delegate)
    end,
    EmitUIPlayCardEvent = function(self)
        print(#self.UIPlayCardListeners)
        for k,v in ipairs(self.UIPlayCardListeners) do
            v()
        end
    end
}

return gameplayEventSystem