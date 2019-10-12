local class = require 'middleclass'

Rover = class('Rover')

function Rover:initialize(x, y)
  self.x = x
  self.y = y
  self.s = 2.5
  self.w = 32 * self.s
  self.h = 32 * self.s
  self.r = 0
  self.img = love.graphics.newImage('sprites/Curiosity Hub.png')
  self.e = 1000
  self.back = love.graphics.newImage("sprites/backside of rover.png")
end



function Rover:update(dt,map)
    if self.x < 0 then
      self.x = 0
    end
    if self.y < 0 then
      self.y = 0
    end
    if self.x > map.w*map.imgw - self.w then
      self.x = map.w*map.imgw- self.w
    end
    if self.y > map.h*map.imgh - self.h then
      self.y = map.h*map.imgh- self.h
  end
end

function Rover:draw()
  love.graphics.setColor(1,1,1)
  --love.graphics.print(self.x..", "..self.y, self.x, self.y)
  print(self.x)
  print(self.y)
  if insideHub == true then
    love.graphics.draw(self.back, self.x, self.y, 0, 4)
  elseif insideHub == false then
    love.graphics.draw(self.img, (self.x), (self.y), self.r, self.s, self.s, 16, 16)
  end
end


return Rover
