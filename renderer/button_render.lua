local Render = {}

function Render:draw(uiButton)
    local w = uiButton.w
    local h = uiButton.h
    love.graphics.setColor(0.5, 0.5, 0.5)
    love.graphics.rectangle("line", uiButton.x, uiButton.y, w, h)
    w = w - 1
    h = h - 1
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", uiButton.x, uiButton.y, w, h)

    love.graphics.setColor(1, 1, 1, 1)
end

return Render
