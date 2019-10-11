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
<<<<<<< HEAD
    rover.r = rover.r - .04
=======
    -- rover.x = rover.x + 5
    rover.r = rover.r - .08

>>>>>>> 02cd25972cf2ef395d79911d7d01c80558225eb9
  end
  if love.keyboard.isDown("s") then
    rover.y = rover.y - math.sin(rover.r - math.pi/2) * 1.5
    rover.x = rover.x - math.cos(rover.r - math.pi/2) * 1.5

  end
  if love.keyboard.isDown("a") then
<<<<<<< HEAD
    rover.r = rover.r + .04
=======
    -- rover.x = rover.x - 5
    rover.r = rover.r + .08
>>>>>>> 02cd25972cf2ef395d79911d7d01c80558225eb9
  end
  if love.keyboard.isDown("w") then
    rover.y = rover.y + math.sin(rover.r - math.pi/2) * 1.5
    rover.x = rover.x + math.cos(rover.r - math.pi/2) * 1.5
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




function love.keypressed(key, scancode, isrepeat)
  if key == "escape" then
    love.event.quit()
  end
end
