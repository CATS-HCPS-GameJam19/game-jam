camera = {}
camera.x = 0
camera.y = 0
camera.scaleX = 1
camera.scaleY = 1
camera.rotation = 0

camera.camerascale = 1

function camera:set()
  love.graphics.push()
  love.graphics.rotate(-self.rotation)
  love.graphics.scale(1 / self.scaleX, 1 / self.scaleY)
  love.graphics.translate(-self.x, -self.y)
end

function camera:unset()
  love.graphics.pop()
end

function camera:move(dx, dy)
  self.x = self.x + (dx or 0)
  self.y = self.y + (dy or 0)
end

function camera:rotate(dr)
  self.rotation = self.rotation + dr
end

function camera:scale(sx, sy)
  sx = sx or 1
  self.scaleX = self.scaleX * sx
  self.scaleY = self.scaleY * (sy or sx)
end

function camera:setPosition(x, y)
  self.x = x or self.x
  self.y = y or self.y
end

function camera:setScale(sx, sy)
  self.scaleX = sx or self.scaleX
  self.scaleY = sy or self.scaleY
end

function camera:checkBorderCollision(map)
  if camera.x < 0 then
    camera.x = 0
  end
  if camera.y < 0 then
    camera.y = 0
  end
  if camera.x > map.w*map.imgw - love.graphics.getWidth() then
    camera.x = map.w*map.imgw- love.graphics.getWidth()
  end
  if camera.y > map.h*map.imgh - love.graphics.getHeight() then
    camera.y = map.h*map.imgh- love.graphics.getHeight()
  end
end

function camera:checkBorderCollision2(grass)
  if camera.x < 0 then
    camera.x = 0
  end
  if camera.y < 0 then
    camera.y = 0
  end
  if camera.x > grass.mapwidth * camera.camerascale - grass.dim then
    camera.x = grass.mapwidth * camera.camerascale - grass.dim
  end
  if camera.y > grass.mapheight * camera.camerascale - grass.dim * camera.camerascale then
    camera.y = grass.mapheight * camera.camerascale - grass.dim * camera.camerascale
  end
end

function camera:movementUpdate(dt)
  if love.mouse.isDown(1) then
    local x = ( ( love.mouse.getX() * camera.camerascale ) - ( love.graphics.getWidth() / 2 * camera.camerascale ) )
    local y = ( ( love.mouse.getY() * camera.camerascale ) - ( love.graphics.getHeight() / 2 * camera.camerascale ) )

    local length = math.sqrt((x * x) + (y * y))

    if length >= 50 then
      movex = (x * (1/length)) * 200
      movey = (y * (1/length)) * 200
    else
      movex = 0
      movey = 0
    end

    camera.y = camera.y + movey * dt
    camera.x = camera.x + movex * dt
  end
end

return camera
