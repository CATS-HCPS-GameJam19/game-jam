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
end

function Battery:update(num,dt)
  self.e = self.e + num
end

function Battery:draw()
  local sw = love.graphics.getWidth()
  local sh = love.graphics.getHeight()
  love.graphics.setColor(164/255, 235/255, 52/255)
  love.graphics.rectangle("fill", self.x,self.y,self.w*(self.e/1000),self.h)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.setLineWidth(5)
  love.graphics.rectangle("line", self.x,self.y,self.w,self.h)
  love.graphics.setLineWidth(1)
  love.graphics.rectangle("fill", self.x+self.w,self.y+self.h/3,self.w/15,self.h/4)
end

return Battery
