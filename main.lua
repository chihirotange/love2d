Object = require("libs.classic")

Timer = require("libs/timer")

function love.load()
	globalTimer = Timer()
	globalTimer:after(2, function()
		print("hello after 2s")
	end)
end

function love.update(dt)
	globalTimer:update(dt)
end

function love.draw() end

-- handle inputs
function love.keypressed(key)
	if key == "escape" then
		-- print("escape")
		love.event.quit()
	end
end
function love.run()
	if love.math then
		love.math.setRandomSeed(os.time())
	end

	if love.load then
		love.load(arg)
	end

	-- We don't want the first frame's dt to include time taken by love.load.
	if love.timer then
		love.timer.step()
	end

	local dt = 0

	-- Main loop time.
	while true do
		-- Process events.
		if love.event then
			love.event.pump()
			for name, a, b, c, d, e, f in love.event.poll() do
				if name == "quit" then
					if not love.quit or not love.quit() then
						return a
					end
				end
				love.handlers[name](a, b, c, d, e, f)
			end
		end

		-- Update dt, as we'll be passing it to update
		if love.timer then
			love.timer.step()
			dt = love.timer.getDelta()
		end

		-- Call update and draw
		if love.update then
			love.update(dt)
		end -- will pass 0 if love.timer is disabled

		if love.graphics and love.graphics.isActive() then
			love.graphics.clear(love.graphics.getBackgroundColor())
			love.graphics.origin()
			if love.draw then
				love.draw()
			end
			love.graphics.present()
		end

		if love.timer then
			love.timer.sleep(0.001)
		end
	end
end
