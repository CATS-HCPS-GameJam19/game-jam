-- 2019 HCPSxJMU Game Jam
-- Carlo Mehegan, Austin Spitzer, Thomas Shulgan, Stella Alexiou
-- October 11, 2019
local Rover = require 'rover'

function love.load()
  rover = Rover:new(100,100)
end

function love.update(dt)

end

function love.draw()
  rover:draw()
end


function FindProximity(x,y)
  x0 = (x - boy.x)^2
  y0 = (y - boy.y)^2
  return math.sqrt(x0+y0)
end

function Move(key)

  if key == "d" then
    rover.x = rover.x + 10
  end
  if key == "s" then
    rover.y = rover.y + 10
  end
  if key == "a" then
    rover.x = rover.x - 10
  end
  if key == "w" then
    rover.y = rover.y-1
  end

end


function love.keypressed(key, scancode, isrepeat)
  if key == "escape" then
    love.event.quit()
  end
  if key == "d" then
    Move("d")
  end
  if key == "s" then
    Move("s")
  end
  if key == "a" then
    Move("a")
  end
  if key == "w" then
    Move("w")
  end
end
