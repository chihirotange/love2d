local debug = {
    dt = 0,
    Update = function(self, dt)
        self.dt = dt
    end,
    Draw = function(self)
        local width = love.graphics.getWidth()
        love.graphics.print("deltaTime: " .. string.format("%5.3f",self.dt), width - 200, 100)
    end
}

return debug