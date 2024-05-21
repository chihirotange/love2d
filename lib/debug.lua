Debug = {
    printQueue = {},
    pendingAdd = {},
    pendingRemove = {},
    dt = 0,
    Update = function(self, dt)
        self.dt = dt

        for k, v in ipairs(self.pendingAdd) do
            table.insert(self.printQueue, v)
        end
        table.clear(self.pendingAdd)

        for k, v in ipairs(self.pendingRemove) do
            table.removeItem(self.printQueue, v)
        end
        table.clear(self.pendingRemove)
        for k, v in ipairs(self.printQueue) do
            v.time = v.time - dt
            if v.time <= 0 then
                table.insert(self.pendingRemove, v)
            end
        end
    end,
    Draw = function(self)
        love.graphics.setColor(0, 1, 0)
        --draw deltaTime
        local width = love.graphics.getWidth()
        local height = love.graphics.getHeight()
        love.graphics.print("deltaTime: " .. string.format("%5.3f",self.dt), width - 110, height * 15/16)

        for k, v in ipairs(self.printQueue) do
            love.graphics.print(v.str, 50, k*20)
        end
        love.graphics.setColor(1, 1, 1)
    end,
    PrintString = function(self, str, time)
        if not str then
            return
        end
        local stringToPrint = {
            str = str,
            time = time or 1,
        }
        table.insert(self.pendingAdd, stringToPrint)
    end
}