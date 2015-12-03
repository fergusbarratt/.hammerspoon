-- -----------------------------------------------
-- -- Set up
-- -----------------------------------------------

local hyper = {"shift", "cmd", "alt", "ctrl"}
local mash      = {"cmd", "alt", "ctrl"}
local mashshift = {"cmd", "alt", "shift"}
local funkymash = {"cmd", "ctrl", "shift"}

local laptopScreen = "Color LCD"

local internal_display = {
        {"Google Chrome",  nil,          laptopScreen, nil, nil, hs.geometry.rect(0, 450, 720, 445)},
        {"Messenger",    nil,          laptopScreen, nil, nil, hs.geometry.rect(0, 24, 350, 425)},
        {"Sublime Text",  nil,     laptopScreen, hs.layout.right50, nil, nil},
        {"Terminal",  nil,     laptopScreen, nil, nil, hs.geometry.rect(350, 24, 366, 430)},
    }
hs.hotkey.bind(hyper, '1', function() hs.layout.apply(internal_display) end)

-----------------------------------------------
-- hyper a for left one half window
-----------------------------------------------

hs.hotkey.bind(hyper, "a", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

-----------------------------------------------
-- hyper a for right one half window
-----------------------------------------------

hs.hotkey.bind(hyper, "d", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

-----------------------------------------------
-- hyper s for fullscreen
-----------------------------------------------

hs.hotkey.bind(hyper, "s", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
end)

-----------------------------------------------
-- hyper q for top left one quarter window
-----------------------------------------------

hs.hotkey.bind(hyper, "q", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)

-----------------------------------------------
-- hyper e for top right one quarter window
-----------------------------------------------

hs.hotkey.bind(hyper, "e", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)

-----------------------------------------------
-- hyper c for bottom right one quarter window
-----------------------------------------------

hs.hotkey.bind(hyper, "c", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y + (max.h / 2)
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)

-----------------------------------------------
-- hyper z for bottom left one quarter window
-----------------------------------------------

hs.hotkey.bind(hyper, "z", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y + (max.h / 2)
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)
-----------------------------------------------
-- hyper x for top half window
-----------------------------------------------

hs.hotkey.bind(hyper, "x", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y + max.h / 2
    f.w = max.w
    f.h = max.h / 2
    win:setFrame(f)
end)

-----------------------------------------------
-- hyper w for top half window
-----------------------------------------------

hs.hotkey.bind(hyper, "w", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h / 2
    win:setFrame(f)
end)

-----------------------------------------------
-- Hyper i to show window hints
-----------------------------------------------

hs.hotkey.bind(hyper, "`", function()
    hs.hints.windowHints()
end)

-- Set grid size.
hs.grid.GRIDWIDTH  = 12
hs.grid.GRIDHEIGHT = 12
hs.grid.MARGINX    = 0
hs.grid.MARGINY    = 0
-- Set window animation off. It's much smoother.
hs.window.animationDuration = 0.05
-- Set volume increments
local volumeIncrement = 5

hs.hotkey.bind(mash, ';', function() hs.grid.snap(hs.window.focusedWindow()) end)
hs.hotkey.bind(mash, "'", function() hs.fnutils.map(hs.window.visibleWindows(), hs.grid.snap) end)

hs.hotkey.bind(hyper,      '=', function() hs.grid.adjustWidth(1)   end)
hs.hotkey.bind(hyper,      '-', function() hs.grid.adjustWidth(-1)  end)
hs.hotkey.bind(mashshift, '=', function() hs.grid.adjustHeight(1)  end)
hs.hotkey.bind(mashshift, '-', function() hs.grid.adjustHeight(-1) end)

hs.hotkey.bind(mashshift, 'left',  function() hs.window.focusedWindow():focusWindowWest()  end)
hs.hotkey.bind(mashshift, 'right', function() hs.window.focusedWindow():focusWindowEast()  end)
hs.hotkey.bind(mashshift, 'up',    function() hs.window.focusedWindow():focusWindowNorth() end)
hs.hotkey.bind(mashshift, 'down',  function() hs.window.focusedWindow():focusWindowSouth() end)

hs.hotkey.bind(hyper, 'M', hs.grid.maximizeWindow)

hs.hotkey.bind(hyper, 'F', function() hs.window.focusedWindow():toggleFullScreen() end)

hs.hotkey.bind(mash, 'N', hs.grid.pushWindowNextScreen)
hs.hotkey.bind(mash, 'P', hs.grid.pushWindowPrevScreen)

hs.hotkey.bind(hyper, 'J', hs.grid.pushWindowDown)
hs.hotkey.bind(hyper, 'K', hs.grid.pushWindowUp)
hs.hotkey.bind(hyper, 'H', hs.grid.pushWindowLeft)
hs.hotkey.bind(hyper, 'L', hs.grid.pushWindowRight)

hs.hotkey.bind(hyper, 'U', hs.grid.resizeWindowTaller)
hs.hotkey.bind(hyper, 'O', hs.grid.resizeWindowWider)
hs.hotkey.bind(hyper, 'I', hs.grid.resizeWindowThinner)
hs.hotkey.bind(hyper, 'Y', hs.grid.resizeWindowShorter)

hs.hotkey.bind(hyper, ';',     hs.spotify.play)
hs.hotkey.bind(hyper, "'",     hs.spotify.pause)

hs.hotkey.bind(hyper, 'T', function() hs.alert.show(os.date("%A %b %d, %Y - %I:%M%p"), 4) end)

hs.hotkey.bind(hyper, ']', function() hs.audiodevice.defaultOutputDevice():setVolume(hs.audiodevice.current().volume + 5) end)
hs.hotkey.bind(hyper, '[', function() hs.audiodevice.defaultOutputDevice():setVolume(hs.audiodevice.current().volume - 5) end)

-----------------------------------------------
-- Reload config on write
-----------------------------------------------

function reload_config(files)
    hs.reload()
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()

hs.alert.show("Hammerspoon, at your service.", 3)
