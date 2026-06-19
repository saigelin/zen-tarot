local Manager = {}

function Manager:load()
    self.bgm = love.audio.newSource("assets/audio/song.ogg", "stream")
    self.bgm:setLooping(true)
    self.se = love.audio.newSource("assets/audio/sfx.ogg", "static")
end

function Manager:playBGM()
    if self.bgm:isPlaying() then
        return
    end

    self.bgm:play()
end

function Manager:stopBGM()
    self.bgm:stop()
end

function Manager:playSE()
    self.se:stop()
    self.se:play()
end

return Manager
