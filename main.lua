-- 2019 HCPSxJMU Game Jam
-- Carlo Mehegan, Austin Spitzer, Thomas Shulgan, Stella Alexiou
-- October 11, 2019
love.graphics.setDefaultFilter('nearest', 'nearest')
local Rover = require 'rover'
local Map = require 'map'
local Camera = require "camera"
local Mineral = require 'mineral'
local Battery = require 'battery'


function love.load()
  mineral = Mineral:new(100, 100);
  m2 = Mineral:new(50, 50)
  rover = Rover:new(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
  map = Map:new(20,20,50)
  battery = Battery:new()
end

function love.update(dt)
  battery:update(-0.05)
  if love.keyboard.isDown("d") then
    rover.r = rover.r + .08
  end
  if love.keyboard.isDown("s") then
    rover.y = rover.y - math.sin(rover.r - math.pi/2) * 1.5
    rover.x = rover.x - math.cos(rover.r - math.pi/2) * 1.5
    battery:update(-0.25)
  end
  if love.keyboard.isDown("a") then
    rover.r = rover.r - .08
  end
  if love.keyboard.isDown("w") then
    rover.y = rover.y + math.sin(rover.r - math.pi/2) * 1.5
    rover.x = rover.x + math.cos(rover.r - math.pi/2) * 1.5
    battery:update(-0.25)
  end
  battery.x = rover.x  - (love.graphics.getWidth()/2) + 30
  battery.y = rover.y  - (love.graphics.getHeight()/2) + 30
  camera.x = rover.x  - (love.graphics.getWidth()/2)
  camera.y = rover.y  - (love.graphics.getHeight()/2)
end

function love.draw()
  camera:set()
  map:draw()
  rover:draw()
  mineral:draw()
  m2:draw()
  battery:draw()
  camera:unset()
end




function love.keypressed(key, scancode, isrepeat)
  if key == "escape" then
    love.event.quit()
  end
end
