local Circle = Object:extend()

function Circle:new(x, y, r)
    self.x = x
    self.y = y
    self.r = r
end

function Circle:draw()
    love.graphics.circle("fill", self.x, self.y, self.r)
end

return Circle