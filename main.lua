local player = require "bird"
require("pipe")

function deep_copy(v)
  assert(type(v), "table")
  local u = {}
  for k, v in pairs(v) do
    u[k] = v
  end
  setmetatable(u, getmetatable(v))
  return u
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
end

function love.keypressed(key)
  player:jump()
end

function love.draw()
  love.graphics.setBackgroundColor(0, 0.8, 1, 1)
  player:draw()
  pipe1:draw()
  pipe2:draw()
end
