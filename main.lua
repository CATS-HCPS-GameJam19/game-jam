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
local Talkies = require('talkies')

function love.load()
  love.window.setMode(1200, 800)
  love.window.setTitle("Curious Curiosity")
  Bluem = love.graphics.newImage("sprites/Blue mineral.png")
  Redm = love.graphics.newImage("sprites/red mineral.png")
  Purplem = love.graphics.newImage("sprites/Puprple mineral.png")
  Talkies.font = love.graphics.newFont("nimbusmono-regular.otf", 30)
  local firstdialog = Talkies.say("NASA", "Hello, Curiosity! Welcome to Mars!--The goal of your mission:--collect as many minerals as possible and take them to the hub to upgrade yourself.")
  local seconddialog = Talkies.say("NASA", "The battery bar you see on the top of your screen shows you how much power you have left until you die.")
  local thirddialog = Talkies.say("NASA", "To charge your battery, view the map, and store your minerals, enter The Hub located to the bottom left of your current position. Minerals are spent to speed you up.")
  firstdialog:isShown()
  seconddialog:isShown()
  thirddialog:isShown()

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
  rover = Rover:new(7200, 6700)
  map = Map:new(20,20,50)
  gameover = false
  gameoveralpha = 0
  insideHub = false
  insideCharge1 = false
  insideCharge2 = false
  hub = Hub:new(6700,6700)
  battery = Battery:new()
  bmcount = 0
  pmcount = 0
  rmcount = 0
end

function love.update(dt)
  if battery.e >0 then
    for i = 1, #blueMineral do
      bm = blueMineral[i]
      if FindProximity(bm.x+(bm.w/2),bm.y+(bm.h/2)) < 30 and bm.broken == false
       then
        bmcount = bmcount + 1
        bm.broken = true
      end
    end
    for i = 1, #purpleMineral do
        pm = purpleMineral[i]
        if FindProximity(pm.x+(pm.w/2),pm.y+(pm.h/2)) < 30 and pm.broken == false
         then
          pmcount = pmcount + 1
          pm.broken = true
        end
      end
      for i = 1, #redMineral do
          rm = redMineral[i]
          if FindProximity(rm.x+(rm.w/2),rm.y+(rm.h/2)) < 30 and rm.broken == false
           then
            rmcount = rmcount + 1
            rm.broken = true
        end
      end

    Talkies.update(dt)

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
      camera.x = -1200
      camera.y = -400
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

  -- going into the hub
  if rover.x >= 240 + hub.x and
    rover.x <= 240 + 45 + hub.x and
    rover.y >= 110 + hub.y  and
    rover.y <= 110 + 95 + hub.y
  then
    insideHub = true
    rover.x = -650
    rover.y = 200
  end

  -- leaving the hub
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

  -- charging on the charge pad, using two different rectangles
  if insideHub == true then
    if rover.x + rover.w >= 124 -1000 and
      rover.x <= 124 + 107 -1000 and
      rover.y + rover.h >= 431 -300 and
      rover.y <= 431 + 75 -300
    then
      insideCharge1 = true
    else
      insideCharge1 = false
    end

    if rover.x >= 36 -1000 and
      rover.x <= 36 + 107 -1000 and
      rover.y >= 522 -300 and
      rover.y <= 522 + 75 -300
    then
      insideCharge2 = true
    else
      insideCharge2 = false
    end

    if insideCharge1 == true or insideCharge2 == true then
      battery.x = -1000 + 30
      battery.y = -300 + 30
      battery:charge(1)
    end
  end



  if insideHub == false then
    rover:update(dt,map)
    camera:checkBorderCollision(map)
    battery.x = rover.x  - (love.graphics.getWidth()/2) + 30
    battery.y = rover.y  - (love.graphics.getHeight()/2) + 30
    battery:update(dt)
    map.miniX = rover.x  - (love.graphics.getWidth()/2) + love.graphics.getWidth() - 240--175
    map.miniY = rover.y  - (love.graphics.getHeight()/2) + love.graphics.getHeight() - 240--175
  end

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
  map:drawMini(rover)

  if gameover == true then
    love.graphics.setColor(0, 0, 0, gameoveralpha/100)
    love.graphics.rectangle("fill", camera.x, camera.y, love.graphics.getWidth(), love.graphics.getHeight())
  end



  camera:unset()
  Talkies.draw()
  love.graphics.draw(Bluem, 450, 10)
  love.graphics.draw(Redm, 650, 10)
  love.graphics.draw(Purplem, 550, 10)
  love.graphics.print(bmcount, 500, 10)
  love.graphics.print(pmcount, 600, 10)
  love.graphics.print(rmcount, 700, 10)
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
  if key == "tab" then
    Talkies.clearMessages()
  end
  if key == "space" then Talkies.onAction()
  elseif key == "up" then Talkies.prevOption()
  elseif key == "down" then Talkies.nextOption()
  end
end
