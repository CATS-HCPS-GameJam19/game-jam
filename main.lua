-- 2019 HCPSxJMU Game Jam
-- Carlo Mehegan, Austin Spitzer, Thomas Shulgan, Stella Alexiou
-- October 11, 2019
love.graphics.setDefaultFilter('nearest', 'nearest')
local Rover = require 'rover'
local Map = require 'map'
local Camera = require "camera"
local Mineral = require 'mineral'
local Battery = require 'battery'
local Hub = require "hub"

function love.load()
  blueMineral = {}
  for i = 1, 1500 do
    blueMineral[i] = Mineral:new('sprites/Blue mineral.png')
  end

  purpleMineral = {}
  for i = 1, 1300 do
    purpleMineral[i] = Mineral:new('sprites/puprple mineral.png')
  end

  redMineral = {}
  for i = 1, 1100 do
    redMineral[i] = Mineral:new('sprites/red mineral.png')
  end
  Mars = love.graphics.newImage("Sprites/Mars Background.png")
  rover = Rover:new(1500, 1000)
  map = Map:new(20,20,50)
  gameover = false
  gameoveralpha = 0
  insideHub = false
  hub = Hub:new(1000,1000)
  battery = Battery:new()
end

function love.update(dt)
  if battery.e >0 then
    if insideHub == false then
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
    elseif insideHub == true then
      if love.keyboard.isDown("d") then
        rover.x = rover.x + 2
      end
      if love.keyboard.isDown("s") then
        rover.y = rover.y + 2
      end
      if love.keyboard.isDown("a") then
        rover.x = rover.x - 2
      end
      if love.keyboard.isDown("w") then
        rover.y = rover.y - 2
      end
    end

    if insideHub == false then
      camera.x = rover.x  - (love.graphics.getWidth()/2)
      camera.y = rover.y  - (love.graphics.getHeight()/2)
    else
      camera.x = -1000
      camera.y = -300
    end

   if rover.x >= 240 + hub.x and
      rover.x <= 240 + 45 + hub.x and
      rover.y >= 110 + hub.y  and
      rover.y <= 110 + 95 + hub.y
    then
      insideHub = true
      rover.x = -650
      rover.y = 200
    end

    if insideHub == true then
      if rover.x >= -800 and
         rover.x <= -800 + 400 and
         rover.y >= 236 and
         rover.y <= 236 + 128
       then
         insideHub = false
         rover.x = hub.x + 400
         rover.y = hub.y + 200
       end
    end

    battery.x = rover.x  - (love.graphics.getWidth()/2) + 30
    battery.y = rover.y  - (love.graphics.getHeight()/2) + 30

    if insideHub == false then
      rover:update(dt,map)
      camera:checkBorderCollision(map)
    end

    battery:update(dt)
  else
    gameover = true
    gameoveralpha = gameoveralpha + 1
  end
end


function love.draw()

  camera:set()
  map:draw()
  for i = 1, #blueMineral do
    if FindProximity(blueMineral[i].x,blueMineral[i].y) < 1000 then
      blueMineral[i]:draw()
    end
  end
  for i = 1, #purpleMineral do
    if FindProximity(purpleMineral[i].x,purpleMineral[i].y) < 1000 then
      purpleMineral[i]:draw()
    end
  end
  for i = 1, #redMineral do
    if FindProximity(redMineral[i].x,redMineral[i].y) < 1000 then
      redMineral[i]:draw()
    end
  end
  hub:draw()
  rover:draw()
  battery:draw()

  if gameover == true then
    love.graphics.setColor(0, 0, 0, gameoveralpha/100)
    love.graphics.rectangle("fill", camera.x, camera.y, love.graphics.getWidth(), love.graphics.getHeight())
  end
  camera:unset()
end
function FindProximity(x,y)
  x0 = (x - rover.x)^2
  y0 = (y - rover.y)^2
  return math.sqrt(x0+y0)
end

function love.keypressed(key, scancode, isrepeat)
  if key == "escape" then
    love.event.quit()
  end
end
