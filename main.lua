-- 2019 HCPSxJMU Game Jam
-- Carlo Mehegan, Austin Spitzer, Thomas Shulgan, Stella Alexiou
-- October 11, 2019
love.graphics.setDefaultFilter('nearest', 'nearest')
local Rover = require 'rover'
local Map = require 'map'
local Camera = require "camera"

function love.load()
  rover = Rover:new(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
  map = Map:new(20,20,50)
end

function love.update(dt)
  if love.keyboard.isDown("d") then
    rover.x = rover.x + 5

  end
  if love.keyboard.isDown("s") then
    rover.y = rover.y + 5
    rover.r = math.pi
  end
  if love.keyboard.isDown("a") then
    rover.x = rover.x - 5
  end
  if love.keyboard.isDown("w") then
    rover.y = rover.y - 5
  end
 camera.x = (rover.x + (rover.w/2)) - (love.graphics.getWidth()/2)
 camera.y = (rover.y + (rover.h/2)) - (love.graphics.getHeight()/2)
end

function love.draw()
  camera:set()
  map:draw()
  rover:draw()
  camera:unset()
end




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
