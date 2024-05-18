local mouseObject = {
    isHoldingSomething = false,
    holdingObject = nil,
    DetectMouseOnObjectsEvent = function(self, PhysicComponents)
        if not PhysicComponents then
            return
        end
        if love.mouse.isDown(1) and not self.isHoldingSomething then
            for k, v in ipairs(PhysicComponents) do
                if v:IsCollideWithMouse() and not self.isHoldingSomething then
                    self.isHoldingSomething = true
                    self.holdingObject = v
                end
            end
            if self.holdingObject then
                self.holdingObject:OnMouseDown()
            end
        end

        if self.isHoldingSomething and not love.mouse.isDown(1) then
            if self.holdingObject then
                self.holdingObject:OnMouseReleased()
                self.isHoldingSomething = false
                self.holdingObject = nil
            end 
        end
    end
}

return mouseObject