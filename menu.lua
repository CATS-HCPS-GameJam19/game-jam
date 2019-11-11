local class = require 'middleclass'

Menu = class('Menu')

function Menu:initialize()
  self.x = 75
  self.y = 50
  self.w = love.graphics.getWidth() - 150
  self.h = love.graphics.getHeight() - 150

  self.texts = {
    "Speed",
    "Jumps",
    "Damage",
    "Luck",
    "",
    "Cannon 1",
    "Cannon 2",
    "Cannon 3",
    "Cannon 4",
    "",
    "Cannon 1",
    "Cannon 2",
    "Cannon 3",
    "Cannon 4",
    "",
    "Cannon 1",
    "Cannon 2",
    "Cannon 3",
    "Cannon 4",
    ""
  }
  self.prices = {
    50,
    100,
    20,
    50,
    5000,
    200,
    200,
    200,
    200,
    10000,
    200,
    200,
    200,
    200,
    10000,
    200,
    200,
    200,
    200,
    10000
  }
  self.buttons = {}
  self.Button = Button()
  local i = 0
  for gy=0,3 do
    for gx=0,4 do
      i = i + 1
      table.insert(self.buttons, self.Button:new(self.x + 30 + (120 * gx), self.y + 20 + (80 * gy), 110, 70, self.texts[i], self.prices[i]))
    end
  end
end


function drawCrosshair()
  if love.keyboard.isDown("lshift") then
    love.graphics.setColor(0,0,0)
  else
    love.graphics.setColor(1,1,1)
  end
  local mx, my = love.mouse.getX(), love.mouse.getY()
  love.graphics.line(mx, my - 10, mx, my - 5)
  love.graphics.line(mx, my + 10, mx, my + 5)
  love.graphics.line(mx - 10, my, mx - 5, my)
  love.graphics.line(mx + 10, my, mx + 5, my)
end

function isClicked(btn)
  if mouseIsDown == false then
    if love.mouse.getX() >= btn.x and
       love.mouse.getX() <= btn.x + btn.w and
       love.mouse.getY() >= btn.y and
       love.mouse.getY() <= btn.y + btn.h and
       love.mouse.isDown(1)
    then--draw pressed button if cursor is over button
      mouseIsDown = true
      return true
    else
      return false
    end
  elseif mouseIsDown == true then
    if love.mouse.isDown(1) ~= true then
      mouseIsDown = false
    end
    return false
  end
end

function Button() -- the class for buttons, objects made and stored in a table in menu:initialize
  Button = class('Button')
  function Button:initialize(x,y,w,h,text,price)
    self.x,self.y,self.w,self.h,self.text,self.price = x,y,w,h,text,price
    self.level = 1
    self.c = {1,1,1,1}
    self.isMaxed = false
  end
  function Button:draw()
    if self.isMaxed  == false then
      if love.mouse.getX() >= self.x and
         love.mouse.getX() <= self.x + self.w and
         love.mouse.getY() >= self.y and
         love.mouse.getY() <= self.y + self.h
      then--draw pressed button if cursor is over button
        self.c = {0.8,0.8,0.8}
      else--draw unpressed button
        self.c = {1,1,1}
      end
    elseif self.isMaxed == true then
      self.c = {0.988, 0.816, 0.181}
    end
    love.graphics.setColor(self.c)
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    love.graphics.printf(self.text, self.x + 10, self.y + 10, self.w - 15, "left")
    love.graphics.print(self.price, self.x + 10, self.y + 40)
  end
  return Button
end




function Menu:update(score)
  if love.keyboard.isDown("lshift") then
    -- SPEED UPGRADING
    if isClicked(self.buttons[1]) then
      if self.buttons[1].level <= 9 then
        if self.buttons[1].price < score then
          score = score - self.buttons[1].price
          self.buttons[1].level = self.buttons[1].level + 1
          self.buttons[1].text = "Speed " .. self.buttons[1].level
          self.buttons[1].price = math.floor(self.buttons[1].price * 1.8)
          -- player.speed = player.speed + 25
        end
        if self.buttons[1].level == 10 then
          self.buttons[1].price = ""
          self.buttons[1].isMaxed = true
        end
      end
    end
    --DAMAGE UPGRADING
    if isClicked(self.buttons[3]) then
      if self.buttons[3].level <= 9 then
        if self.buttons[3].price < score then
          score = score - self.buttons[3].price
          self.buttons[3].level = self.buttons[3].level + 1
          self.buttons[3].text = "Damage " .. self.buttons[3].level
          self.buttons[3].price = math.floor(self.buttons[3].price * 8)
          -- player.dmg = player.dmg + 1
        end
        if self.buttons[3].level == 10 then
          self.buttons[3].price = ""
          self.buttons[3].isMaxed = true
        end
      end
    end
  end
end

function Menu:draw()
  -- if love.keyboard.isDown("lshift") and onPad then
    love.graphics.setColor(1, 1, 1, 0.75)
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    for k,v in pairs(self.buttons) do
      v:draw()
    end
  -- end
end


return Menu
