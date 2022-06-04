Pipe = {}

function Pipe:load(x, y, width, height)
  self.x = x
  self.y = y
  self.width = width
  self.height = height
  self.vel = -50
end

function Pipe:update(dt)
  self.x = self.x + self.vel * dt
end

function Pipe:draw()
  love.graphics.setColor(0.4, 0.8, 0, 1)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
