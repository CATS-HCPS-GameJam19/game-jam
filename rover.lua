local class = require 'middleclass'

Rover = class('Rover')

function Rover:initialize(x, y)
  self.x = x
  self.y = y
  self.w = 16
  self.h = 16
  self.img = love.graphics.newImage('sprites/diggin boy.png')
end

function Rover:update(dt)
  -- none
end

function Rover:draw()
  love.graphics.setColor(1,1,1)
  love.graphics.draw(self.img, (self.x), (self.y), 0, 0.25)
end

return Rover
