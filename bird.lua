Bird = {}

function Bird:load()
  self.x = 75
  self.y = 180
  self.width = 30
  self.height = 25
  self.gravity = 0
end

function Bird:update(dt)
  self.gravity = self.gravity + 516 * dt
  self.y = self.y + self.gravity * dt
end

function Bird:jump()
  self.gravity = -165
end

function Bird:draw()
  love.graphics.setColor(1, 1, 0.2)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Bird
