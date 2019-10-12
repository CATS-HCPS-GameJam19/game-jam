local class = require 'middleclass'

Hub = class('Hub')

function Hub:initialize(x,y)
  self.x = x
  self.y = y
  self.s = 10
  self.w = 32 * self.s
  self.h = 32 * self.s
  self.r = 0
  self.img = love.graphics.newImage('sprites/outside_of_hub.png')
end



function Hub:update(dt)
  -- none
end

function Hub:draw()
  love.graphics.setColor(1,1,1)
  love.graphics.draw(self.img, self.x, self.y, self.r, self.s, self.s)
end

return Hub
