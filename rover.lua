local class = require 'middleclass'

Rover = class('Rover')

function Rover:initialize(x, y)
  self.x = x
  self.y = y
  self.w = 8
  self.h = 8
  self.r = 0
  self.img = love.graphics.newImage('sprites/Curiosity Mars.png')
end



function Rover:update(dt)
  -- none
end

function Rover:draw()
  love.graphics.setColor(1,1,1)
  love.graphics.draw(self.img, (self.x), (self.y), self.r, 2)
end

return Rover
