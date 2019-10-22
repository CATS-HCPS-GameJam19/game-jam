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

  self.buildingw = 24 * self.s
  self.buildingh = 29 * self.s
  --stuff for entrance hitbox
  self.enterx = self.x + (23 * self.s)
  self.entery = self.y + (8 * self.s)
  self.enterw = 8 * self.s
  self.enterh = 13 * self.s

--for inside hub screen
  self.ins = 1
  self.inx = -1000
  self.iny = -1000
  self.inw = 45*17.77*self.ins
  self.inh = 32*18.75*self.ins
end

-- rover.x >= 240      + hub.x
-- rover.x <= 240 + 45 + hub.x
-- rover.y >= 110      + hub.y
-- rover.y <= 110 + 95 + hub.y


function Hub:update(dt)

end

function Hub:draw()
  love.graphics.draw(self.insideimg, self.inx, self.iny, 0, 17.77*self.ins, 18.75*self.ins) --inside of the hub
  love.graphics.setColor(1,1,1)
  love.graphics.draw(self.img, self.x, self.y, self.r, self.s) --the outside of the hub
end

return Hub
