myGraph = require('myGraph')

function love.load() 
 cosFunc = myGraph:new(math.cos, 0.1, 0, 200)
--  sinFunc = myGraph:new(math.sin, 0.1, 0, 500)
--  tanFunc = myGraph:new(math.tan, 0.1, 0, 500)
end

function love.update(dt)
    cosFunc:update(dt)
    -- sinFunc:update(dt)
    -- tanFunc:update(dt)
 end

function love.draw()
    cosFunc:draw()
    -- sinFunc:draw()
    -- tanFunc:draw()
 
end