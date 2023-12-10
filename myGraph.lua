local myGraph = {}

function myGraph:new(func, delay, x_start , y_start)
    
    local instance = {
        func = func or math.sin,
        x = {0},    
        y = {y_start},    
        i = 1,
        delay = delay or 0.5,
        timer = 0,
        lineData = {x_start, y_start - 0.0001, x_start, y_start}
    }   

    function instance:update(dt)       
        
        self.timer = self.timer + dt
        if self.timer > self.delay then
            self.i = self.i + 1
            self.x[self.i] = self.x[self.i - 1] + 5
            table.insert(self.lineData, self.x[self.i])
            self.y[self.i] = y_start + 100 * func(math.rad(self.x[self.i]))
            table.insert(self.lineData, self.y[self.i])
            self.timer = 0
        end        
    end

    function instance:draw()   
        love.graphics.line(x_start, y_start, love.graphics.getWidth(), y_start)
        love.graphics.line(x_start + 2, y_start - 200, x_start + 2, y_start + 200)
        for j = 0, love.graphics.getWidth(), 30 do
            love.graphics.setPointSize(3)
            love.graphics.points(x_start + j, y_start - 2)
            love.graphics.printf(j, x_start + j, y_start, love.graphics.getWidth(), "left")
        end
        
        for k = -200, 200, 100 do
            love.graphics.setPointSize(3)
            love.graphics.points(x_start + 2, y_start + k)
            love.graphics.printf(k / 100, x_start + 2, y_start + k, 100, "left")
            
        end   
        
        love.graphics.line(self.lineData)
    end

    return instance
end

return myGraph