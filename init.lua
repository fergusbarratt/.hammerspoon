-- -----------------------------------------------
-- -- Set up
-- -----------------------------------------------

local hyper = {"shift", "cmd", "alt", "ctrl"}
local mash      = {"cmd", "alt", "ctrl"}
local mashshift = {"cmd", "alt", "shift"}
local funkymash = {"cmd", "ctrl", "shift"}
-- Right half is width so that python code doesn't wrap over in sublime
-- Left bottom removes black bars in netflix
local laptopScreen = "Color LCD"
rightHalf = hs.geometry.rect(700, 23, 740, 900)
leftHalf = hs.geometry.rect(0, 23, 700, 900)
bottomLeft = hs.geometry.rect(0, 430, 700, 466)
bottomRight = hs.geometry.rect(720, 450, 740, 445)
topLeft = hs.geometry.rect(0, 23, 700, 413)
topRight = hs.geometry.rect(700, 23, 740, 425)
topRightHalfWidthLeft = hs.geometry.rect(700, 23, 370, 405)
topRightHalfWidthRight = hs.geometry.rect(1070, 23, 370, 405)
topLeftHalfWidthLeft = hs.geometry.rect(0, 23, 350, 405)
topLeftHalfWidthRight = hs.geometry.rect(350, 23, 350, 405)
bottomRightHalfWidthLeft = hs.geometry.rect(700, 450, 370, 445)
bottomRightHalfWidthRight = hs.geometry.rect(1070, 450, 370, 445)
bottomLeftHalfWidthLeft = hs.geometry.rect(0, 430, 350, 466, 466)
bottomLeftHalfWidthRight = hs.geometry.rect(350, 430, 350, 466, 466)
local display_1 = {
        {"Google Chrome", nil, laptopScreen, nil, nil, bottomLeft},
        {"Sublime Text", nil, laptopScreen, nil, nil, rightHalf},
        {"Messenger", nil, laptopScreen, nil, nil, topLeftHalfWidthLeft},
        {"Terminal", nil, laptopScreen, nil, nil, topLeftHalfWidthRight},
    }
local display_2 = {
        {"Google Chrome", nil, laptopScreen, nil, nil, bottomLeft},
        {"Sublime Text", nil, laptopScreen, nil, nil, topLeft},
        {"Messenger", nil, laptopScreen, nil, nil, bottomLeftHalfWidthLeft},
        {"Atom", nil, laptopScreen, nil, nil, bottomLeftHalfWidthRight},
    }

hs.hotkey.bind(hyper, '1', function() hs.layout.apply(display_1) end)
hs.hotkey.bind(hyper, '2', function() hs.layout.apply(display_2) end)
hs.hotkey.bind(hyper, 'r', function() hs.reload() end)
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


hs.alert.show("Hammerspoon, at your service.", 3)
