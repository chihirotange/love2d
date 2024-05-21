local mouseObject = {
    ObjectsToCheck = {},
    currentSelectedObjects = {},
    MouseDownElapsedTime = 0,
    MouseDownPositionX = 0,
    MouseDownPositionY = 0,
    ObjectUnderCursor = nil,
    MouseIsDownLastFrame = false,
    isGrabbingSomething = false,
    checkMouseIsDragging = function(self)
        local mouseX, mouseY = love.mouse.getPosition()
        return VectorMath.SquaredDistance(mouseX, mouseY, self.MouseDownPositionX, self.MouseDownPositionY) > 0
    end,
    checkObjectUnderCursor = function(self)
        if self.isGrabbingSomething then
            return
        end
        local currentCollidedObject = nil
        for k, v in ipairs(self.ObjectsToCheck) do
            if v:IsCollideWithMouse() then  
                currentCollidedObject = v
            end
        end
        self.ObjectUnderCursor = currentCollidedObject
    end,
    AddObjectToMouseOverlapDetection = function(self, object)
        if object and object.IsCollideWithMouse then -- so i don't have to check valid for every frame, make sure object is valid from the start
            table.insert(self.ObjectsToCheck, object)
        end
    end,
    Update = function(self, dt)
        if love.mouse.isDown(1) then
            Debug:PrintString("down", 0.1)
            if not self.MouseIsDownLastFrame then
                self.MouseDownPositionX, self.MouseDownPositionY = love.mouse.getPosition() 
            end
            -- if self.MouseDownElapsedTime > 0.1
            if self.MouseDownElapsedTime > 0.08 and self:checkMouseIsDragging()
            and self.ObjectUnderCursor and self.ObjectUnderCursor.OnBeingGrabbed
            then
                self.isGrabbingSomething = true
                self.ObjectUnderCursor:OnBeingGrabbed()
                if self.ObjectUnderCursor.IsBeingSelected and self.ObjectUnderCursor:IsBeingSelected() then
                    self.ObjectUnderCursor:OnDeselected() 
                    table.removeItem(self.currentSelectedObjects, self.ObjectUnderCursor)
                end
            end
            self.MouseDownElapsedTime = self.MouseDownElapsedTime + dt
            self.MouseIsDownLastFrame = true
        end
        if not love.mouse.isDown(1) then
            Debug:PrintString("up", 0.1)
            if self.MouseIsDownLastFrame and self.ObjectUnderCursor then
                if self.isGrabbingSomething and self.ObjectUnderCursor.OnBeingReleased then
                    self.ObjectUnderCursor:OnBeingReleased()
                else if self.ObjectUnderCursor.OnSelected then
                    if not self.ObjectUnderCursor:IsBeingSelected() then
                        self.ObjectUnderCursor:OnSelected()
                        table.insert(self.currentSelectedObjects, self.ObjectUnderCursor)
                    else
                        self.ObjectUnderCursor:OnDeselected()
                        table.removeItem(self.currentSelectedObjects, self.ObjectUnderCursor)
                    end
                end
            end
            self.MouseIsDownLastFrame = false
            self.MouseDownElapsedTime = 0
            self.isGrabbingSomething = false
        end
        -- on mouse released
        self:checkObjectUnderCursor()
        print(self.MouseIsDownLastFrame)
    end
end
}

return mouseObject