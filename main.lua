local player = require "bird"
require("pipe")

round = 0

function deep_copy(v)
  assert(type(v), "table")
  local u = {}
  for k, v in pairs(v) do
    u[k] = v
  end
  setmetatable(u, getmetatable(v))
  return u
end

function CheckCollision(a, b)
  assert(type(a), "table")
  assert(type(b), "table")
  if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
    return true
  else
    return false
  end
end

function love.load()
  pipe1 = deep_copy(Pipe)
  pipe2 = deep_copy(Pipe)
  player:load()
  pipe1:load(love.graphics.getWidth() - 154, 0, 54, love.graphics.getHeight() / 2 - 50)
  pipe2:load(love.graphics.getWidth() - 154, love.graphics.getHeight() / 2 + 50, 54, love.graphics.getHeight() / 2 - 50)
end

function love.update(dt)
  player:update(dt)
  pipe1:update(dt)
  pipe2:update(dt)
  if CheckCollision(player, pipe1) or CheckCollision(player, pipe2) then
    print("Collision!!")
    round = round + 1
    love.load()
  end
end

function love.keypressed(key)
  player:jump()
end

function love.draw()
  love.graphics.setBackgroundColor(0, 0.8, 1, 1)
  player:draw()
  pipe1:draw()
  pipe2:draw()
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.setFont(love.graphics.newFont(30))
  love.graphics.print("Round: "..round, 50, 50)
end
