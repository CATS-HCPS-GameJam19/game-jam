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
  blueMineral = {}
  for i = 1, love.math.random(500, 510) do
    blueMineral[i] = Mineral:new('sprites/Blue mineral.png')
  end

  purpleMineral = {}
  for i = 1, love.math.random(300, 310) do
    purpleMineral[i] = Mineral:new('sprites/puprple mineral.png')
  end

  redMineral = {}
  for i = 1, love.math.random(100, 110) do
    redMineral[i] = Mineral:new('sprites/red mineral.png')
  end
  Mars = love.graphics.newImage("Sprites/Mars Background.png")
  rover = Rover:new(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
  map = Map:new(20,20,50)
  battery = Battery:new()
end

function love.update(dt)
  battery:charge(-0.05)
  if love.keyboard.isDown("d") then
    rover.r = rover.r + .08
  end
  if love.keyboard.isDown("s") then
    rover.y = rover.y - math.sin(rover.r - math.pi/2) * 1.5
    rover.x = rover.x - math.cos(rover.r - math.pi/2) * 1.5
    battery:charge(-0.25)
  end
  if love.keyboard.isDown("a") then
    rover.r = rover.r - .08
  end
  if love.keyboard.isDown("w") then
    rover.y = rover.y + math.sin(rover.r - math.pi/2) * 1.5
    rover.x = rover.x + math.cos(rover.r - math.pi/2) * 1.5
    battery:charge(-0.25)
  end
  battery.x = rover.x  - (love.graphics.getWidth()/2) + 30
  battery.y = rover.y  - (love.graphics.getHeight()/2) + 30
  camera.x = rover.x  - (love.graphics.getWidth()/2)
  camera.y = rover.y  - (love.graphics.getHeight()/2)
  camera:checkBorderCollision(map)
  rover:update(dt,map)
  battery:update(dt)
end


function love.draw()
  camera:set()
  map:draw()
  rover:draw()
  for i = 1, #blueMineral do
    blueMineral[i]:draw()
  end

  for i = 1, #purpleMineral do
    purpleMineral[i]:draw()
  end

  for i = 1, #redMineral do
    redMineral[i]:draw()
  end
  battery:draw()
  camera:unset()

end




function love.keypressed(key, scancode, isrepeat)
  if key == "escape" then
    love.event.quit()
  end
end
