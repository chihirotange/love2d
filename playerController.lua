local PlayerController = {
    Init = function(self, eventSystem)
        if not eventSystem then
            print("eventSystem invalid - PlayerController")
            return
        end
        self.eventSystem = eventSystem
    end,
    OnMouseClicked = function(self)
    end
}

return PlayerController