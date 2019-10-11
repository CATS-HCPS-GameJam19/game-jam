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

  self.tiles = {}
  for x = 1,self.w do
    self.tiles[x] = {}
    for y = 1,self.h do
      self.tiles[x][y] = {x = x, y = y}
    end
  end
end

function Map:update(dt)
  -- none
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
