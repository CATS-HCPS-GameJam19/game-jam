local class = require 'middleclass'

Map = class('Map')

function Map:initialize(w,h,s)
  self.x = 0
  self.y = 0
  self.w = w
  self.h = h
  self.s = s
  self.img = love.graphics.newImage('sprites/Mars Background.png')
  self.imgw = 32 * self.s
  self.imgh = 32 * self.s

  self.miniS = 1/3
  self.miniW = 32 * self.miniS
  self.miniH = 32 * self.miniS
  self.miniX = 0
  self.miniY = 0

  self.tiles = {}
  for x = 1,self.w do
    self.tiles[x] = {}
    for y = 1,self.h do
      self.tiles[x][y] = {x = x, y = y}
    end
  end
end

function Map:updateMini(mapw,maph)
  if self.miniX < love.graphics.getWidth() - 240 then
    self.miniX = love.graphics.getWidth() - 240
  end
  if self.miniY < love.graphics.getHeight() - 240 then
    self.miniY = love.graphics.getHeight() - 240
  end
  if self.miniX > mapw - 240 then
    self.miniX = mapw - 240
  end
  if self.miniY > maph - 240 then
    self.miniY = maph - 240
  end
end


function Map:drawMini(rover,hub)
  love.graphics.setColor(1,1,1)
  for x = 1,self.w do
    for y = 1,self.h do
      love.graphics.draw(self.img,((self.tiles[x][y].x - 1)*self.miniW) + self.miniX, ((self.tiles[x][y].y - 1)*self.miniH) + self.miniY, 0, self.miniS)
    end
  end
  -- love.graphics.setColor(0,0,0)
  love.graphics.draw(hub.img, (hub.x/self.imgw)*self.miniW + self.miniX, (hub.y/self.imgh)*self.miniH + self.miniY, 0, self.miniS, self.miniS)
  -- love.graphics.rectangle("fill", (hub.x/self.imgw)*self.miniW + self.miniX, (hub.y/self.imgh)*self.miniH + self.miniY, 32*self.miniS, 32*self.miniS)
  -- love.graphics.draw(self.img,(math.floor(rover.x/self.imgw)*self.miniW) + self.miniX, (math.floor(rover.y/self.imgh)*self.miniH) + self.miniY, 0, self.miniS)
  love.graphics.setColor(1,1,1)
  love.graphics.draw(rover.img,(rover.x/self.imgw)*self.miniW + self.miniX, (rover.y/self.imgh)*self.miniH + self.miniY, rover.r, self.miniS, self.miniS, (rover.w*self.miniS)/2, (rover.h*self.miniS)/2)
  love.graphics.setColor(1,1,1)
  love.graphics.setLineWidth(5) --drawn multiple times in order to make the line opaque (big braaaaaain)
  love.graphics.rectangle("line", self.miniX-3, self.miniY-3, self.miniW*self.w+ 6, self.miniH*self.h + 6)
  love.graphics.rectangle("line", self.miniX-3, self.miniY-3, self.miniW*self.w+ 6, self.miniH*self.h + 6)
  love.graphics.rectangle("line", self.miniX-3, self.miniY-3, self.miniW*self.w+ 6, self.miniH*self.h + 6)
  love.graphics.setLineWidth(1)
end

function Map:draw()
  for x = 1,self.w do
    for y = 1,self.h do
      love.graphics.setColor(1,1,1)
      love.graphics.draw(self.img, (self.tiles[x][y].x - 1)*self.imgw, (self.tiles[x][y].y - 1)*self.imgh, 0, self.s)
    end
  end
end

return Map
