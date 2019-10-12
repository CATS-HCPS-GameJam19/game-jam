local class = require 'middleclass'

Mineral = class('Mineral')

function Mineral:initialize(img)
  self.x = love.math.random(0, 32000)
  self.y = love.math.random(0, 32000)
  self.img = love.graphics.newImage(img)
end

function Mineral:update(dt)
  -- none
end

function Mineral:draw()
  love.graphics.setColor(1,1,1)
  love.graphics.draw(self.img, (self.x), (self.y), 0, 2)
end

return Mineral
