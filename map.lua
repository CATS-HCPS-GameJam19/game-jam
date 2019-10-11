local class = require 'middleclass'

Map = class('Map')

function Map:initialize(x, y)
  self.x = 0
  self.y = 0
  self.w = love.graphics.getWidth()
  self.h = love.graphics.getHeight()
  self.img = love.graphics.newImage('sprites/diggin boy.png')
end

function Map:update(dt)
  -- none
end

function Map:draw()
  love.graphics.setColor(226/255, 123/255, 88/255)
  love.graphics.draw(self.img, (self.x), (self.y), 0, 0.25)
end

return Rover
