-- 2019 HCPSxJMU Game Jam
-- Carlo Mehegan, Austin Spitzer, Thomas Shulgan, Stella Alexiou
-- October 11, 2019
local Rover = require 'rover'
local Map = require 'map'
local Camera = require "camera"
function love.load()
  rover = Rover:new(100,100)
  map = Map:new(50,50,4)

  -- tiles = {}
  -- for x = 1,100 do
  --   tiles[x] = {}
  --   for y = 1,100 do
  --     tiles[x][y] = {x = x, y = y, c = {226/255, 123/255, 88/255, love.math.random(20,80)/100}}
  --   end
  -- end

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
camera:movementUpdate(dt)
end

function love.draw()
  camera:set()
  love.graphics.rectangle("fill", 20, 20, 30, 30)
  -- for x = 1,100 do
  --   for y = 1,100 do
  --     love.graphics.setColor(tiles[x][y].c)
  --     love.graphics.rectangle("fill", (tiles[x][y].x - 1)*40, (tiles[x][y].y - 1)*40, 40, 40)
  --   end
  -- end
  map:draw()
  rover:draw()
  camera:unset()
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
