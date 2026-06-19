local Render = {}

function Render:draw(background)
    if not background then
        return
    end
    if background.image ~= nil then
        local screenWidth = 800
        local screenHeight = 600
        local imageWidth = background.image:getWidth()
        local imageHeight = background.image:getHeight()
        local sx = screenWidth / imageWidth
        local sy = screenHeight / imageHeight
        love.graphics.draw(background.image, 0, 0, 0, sx, sy)
    end
end

return Render
