local class = require 'middleclass'

Rover = class('Rover')

function Rover:initialize(x, y)
  self.x = x
  self.y = y
  self.s = 2.5
  self.w = 32 * self.s
  self.h = 32 * self.s
  self.img = love.graphics.newImage('sprites/Curiosity Mars.png')
end

function Rover:update(dt)
  -- none
end

function Rover:draw()
  love.graphics.setColor(1,1,1)
  love.graphics.draw(self.img, (self.x), (self.y), 0, self.s)
end

return Rover
