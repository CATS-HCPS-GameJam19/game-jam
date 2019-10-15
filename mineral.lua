local class = require 'middleclass'

Mineral = class('Mineral')

function Mineral:initialize(img)
  self.x = love.math.random(0, 32000)
  self.y = love.math.random(0, 32000)
  self.w = 64
  self.h = 64
  self.img = love.graphics.newImage(img)
  self.broken = false
end

function Mineral:update(dt)
  -- none
end

function Mineral:draw()
  if self.broken == false then
    love.graphics.setColor(1,1,1)
    -- love.graphics.print(self.x..", "..self.y, self.x, self.y)
    love.graphics.draw(self.img, (self.x), (self.y), 0, 2)
  end
end

return Mineral
