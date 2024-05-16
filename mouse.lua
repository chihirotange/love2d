function DetectMouseAction()
    local x, y = love.mouse.getPosition()

    if x > rect.x and x < rect.x + rect.x and y > rect.y and y < rect.y + rect.height then
        rect.x = x
        rect.y = y
    end
end