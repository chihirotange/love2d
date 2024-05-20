local Class = require "lib/middleclass"

local Scene = Class("Scene")
function Scene:LoadScene()
    print("scene loaded")
end

return Scene