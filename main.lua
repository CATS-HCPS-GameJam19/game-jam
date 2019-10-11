-- 2019 HCPSxJMU Game Jam
-- Carlo Mehegan, Austin Spitzer, Thomas Shulgan, Stella Alexiou
-- October 11, 2019

local Rover = require 'rover'

function love.load()
  x = 100
end

function love.update(dt)
  x = x+10*dt
end

function love.draw()
  love.graphics.circle("fill", x, 200, 10)
end
