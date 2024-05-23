local DebugInternal = {
    printQueue = {},
    pendingAdd = {},
    pendingRemove = {},
    dt = 0,
}

Debug = {
    Update = function(dt)
        DebugInternal.dt = dt
        for k, v in ipairs(DebugInternal.pendingAdd) do
            table.insert(DebugInternal.printQueue, v)
        end
        table.clear(DebugInternal.pendingAdd)

        for k, v in ipairs(DebugInternal.pendingRemove) do
            table.removeItem(DebugInternal.printQueue, v)
        end
        table.clear(DebugInternal.pendingRemove)
        for k, v in ipairs(DebugInternal.printQueue) do
            v.time = v.time - dt
            if v.time <= 0 then
                table.insert(DebugInternal.pendingRemove, v)
            end
        end
    end,
    Log = function(str, time)
        if not str then
            return
        end
        local stringToPrint = {
            str = tostring(str),
            time = time or 1,
        }
        table.insert(DebugInternal.pendingAdd, stringToPrint)
    end,
    Draw = function(self)
        love.graphics.setColor(0, 1, 0)
        --draw deltaTime
        local width = love.graphics.getWidth()
        local height = love.graphics.getHeight()
        love.graphics.print("deltaTime: " .. string.format("%5.3f",DebugInternal.dt), width - 110, height * 15/16)

        for k, v in ipairs(DebugInternal.printQueue) do
            love.graphics.print(v.str, 50, k*20)
        end
        love.graphics.setColor(1, 1, 1)
    end
}