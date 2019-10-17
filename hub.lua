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
  --stuff for entrance hitbox
  self.enterx = self.x + (24 * self.s)
  self.entery = self.y + (8 * self.s)
  self.enterw = 8 * self.s
  self.enterh = 13 * self.s
end

-- rover.x >= 240      + hub.x
-- rover.x <= 240 + 45 + hub.x
-- rover.y >= 110      + hub.y
-- rover.y <= 110 + 95 + hub.y


function Hub:update(dt)

end

function Hub:draw()
  love.graphics.draw(self.insideimg, -1000, -300, 0, 17.77, 18.75) --inside of the hub
  love.graphics.setColor(1,1,1)
  love.graphics.draw(self.img, self.x, self.y, self.r, self.s) --the outside of the hub
end

return Hub
