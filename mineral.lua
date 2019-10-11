local class = require 'middleclass'

Mineral = class('Mineral')

function Mineral:initialize(x, y)
  self.x = x
  self.y = y
  self.img = love.graphics.newImage('sprites/Blue mineral.png')
end



function Mineral:update(dt)
  -- none
end

function Mineral:draw()
  love.graphics.setColor(1,1,1)
  love.graphics.draw(self.img, (self.x), (self.y), 0, 2)
end

return Mineral
