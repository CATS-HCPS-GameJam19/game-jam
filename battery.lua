local class = require 'middleclass'

Battery = class('Battery')

function Battery:initialize()
  self.x = 30
  self.y = 30
  self.w = 160
  self.h = 50
  self.r = 0
  -- self.img = love.graphics.newImage('sprites/Curiosity Hub.png')
  self.e = 1000
  self.maxe = 1000
end

function Battery:update(mapw,maph)
  if self.x < 30 then
    self.x = 30
  end
  if self.y < 30 then
    self.y = 30
  end
  if self.x > mapw - love.graphics.getWidth() + 30 then
    self.x = mapw - love.graphics.getWidth() + 30
  end
  if self.y > maph - love.graphics.getHeight() + 30 then
    self.y = maph - love.graphics.getHeight() + 30
  end
end

--used to change the battery's charge
function Battery:charge(num)
  if num > 0 then
    if self.e + num > self.maxe then
      self.e = self.maxe
    else
      self.e = self.e + num
    end
  elseif num < 0 then
    if self.e + num < 0 then
      self.e = 0
    else
      self.e = self.e + num
    end
  end
end

function Battery:draw()
  local sw = love.graphics.getWidth()
  local sh = love.graphics.getHeight()
  if self.e/self.maxe < 0.25 then
    love.graphics.setColor(219/255, 0/255, 0/255)
  else
    love.graphics.setColor(164/255, 235/255, 52/255)
  end
  love.graphics.rectangle("fill", self.x,self.y,self.w*(self.e/self.maxe),self.h)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.setLineWidth(5)
  love.graphics.rectangle("line", self.x,self.y,self.w,self.h)
  love.graphics.setLineWidth(1)
  love.graphics.rectangle("fill", self.x+self.w,self.y+self.h/3,self.w/15,self.h/4)
end

return Battery
