Font = require("core.font")
Gamestate = require("libs.hump.gamestate")
TitleScene = require("scenes.title")
DrawScene = require("scenes.draw")
ResultScene = require("scenes.result")
AudioMgr = require("systems.audio_manager")

function love.load()
    math.randomseed(os.time())
    AudioMgr:load()
    Gamestate.registerEvents()
    Gamestate.switch(TitleScene)
end
