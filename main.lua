-- 2019 HCPSxJMU Game Jam
-- Carlo Mehegan, Austin Spitzer, Thomas Shulgan, Stella Alexiou
-- October 11, 2019
local Rover = require 'rover'

function love.load()
  rover = Rover:new(100,100)
end

function love.update(dt)
  if love.keyboard.isDown("d") then
    rover.x = rover.x + 10
  end
  if love.keyboard.isDown("s") then
    rover.y = rover.y + 10
  end
  if love.keyboard.isDown("a") then
    rover.x = rover.x - 10
  end
  if love.keyboard.isDown("w") then
    rover.y = rover.y - 10
  end
end

function love.draw()
  rover:draw()
end




-- function Move(key)
--
--   if key == "d" then
--     rover.x = rover.x + 10
--   end
--   if key == "s" then
--     rover.y = rover.y + 10
--   end
--   if key == "a" then
--     rover.x = rover.x - 10
--   end
--   if key == "w" then
--     rover.y = rover.y - 10
--   end
--
-- end


-- function love.keypressed(key, scancode, isrepeat)
--   if key == "escape" then
--     love.event.quit()
--   end
--   if key == "d" then
--     Move("d")
--   end
--   if key == "s" then
--     Move("s")
--   end
--   if key == "a" then
--     Move("a")
--   end
--   if key == "w" then
--     Move("w")
--   end
-- end
