local Config = {
    BGM = true
}

function Config:toggleBGM()
    if self.BGM then
        self.BGM = false
    else
        self.BGM = true
    end
    return self.BGM
end

function Config:getBGM()
    return self.BGM
end

return Config
