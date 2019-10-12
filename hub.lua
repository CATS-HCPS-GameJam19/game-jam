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
  self.insideimg = love.graphics.newImage("sprites/Hub.png")
end



function Hub:update(dt)

end

function Hub:draw()
  love.graphics.draw(self.insideimg, -1000, -300, 0, 17.77, 18.75)
  love.graphics.setColor(1,1,1)
  love.graphics.draw(self.img, self.x, self.y, self.r, self.s, self.s)
end

return Hub
