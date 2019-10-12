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
end



function Rover:update(dt)
  -- none
end

function Rover:draw()
  love.graphics.setColor(1,1,1)
  love.graphics.draw(self.img, (self.x), (self.y), self.r, self.s, self.s, 16, 16)
end

function Rover:drawBattery()
  local sw = love.graphics.getWidth()
  local sh = love.graphics.getHeight()
  love.graphics.rectangle("line", sw/12, sh/12, sw/5, sw/12)
end

return Rover
