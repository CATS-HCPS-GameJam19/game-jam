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

  self.miniS = 1/4
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

function Map:updateMini(dt)

end
function Map:drawMini()
  for x = 1,self.w do
    for y = 1,self.h do
      love.graphics.setColor(1,1,1)
      love.graphics.setLineWidth(5)
      love.graphics.rectangle("line", self.miniX-3, self.miniY-3, self.miniW*self.w+ 6, self.miniH*self.h + 6)
      love.graphics.setLineWidth(1)
      love.graphics.draw(self.img,((self.tiles[x][y].x - 1)*self.miniW) + self.miniX, ((self.tiles[x][y].y - 1)*self.miniH) + self.miniY, 0, self.miniS)
    end
  end
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
