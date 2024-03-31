local grid = require("grid")
local spaces = require("hs._asm.undocumented.spaces")

hs.window.animationDuration = 0
-- disable animations
-- Forward function declarations.
local chain = nil
local moveToNextScreen = nil
local lastSeenChain = nil
local lastSeenWindow = nil
local lastSeenAt = nil
local appWatcher = nil
local windowSize = { frame = nil, zoom = false }
chain = function(movements)
	local chainResetInterval = 2
	-- seconds
	local cycleLength = #movements
	local sequenceNumber = 1
	return function()
		local win = hs.window.frontmostWindow()
		local id = win:id()
		local now = hs.timer.secondsSinceEpoch()
		local screen = win:screen()
		if lastSeenChain ~= movements or lastSeenAt < now - chainResetInterval or lastSeenWindow ~= id then
			sequenceNumber = 1
			lastSeenChain = movements
		elseif sequenceNumber == 1 then
			-- At end of chain, restart chain on next screen.
			screen = screen:next()
		end
		lastSeenAt = now
		lastSeenWindow = id
		hs.grid.set(win, movements[sequenceNumber], screen)
		sequenceNumber = sequenceNumber % cycleLength + 1
		appWatcher:start()
	end
end

moveToNextSpace = function(sp)
    local count = 0
    local allSpaces = spaces.query()
    for _ in pairs(allSpaces) do count = count + 1 end

    local win = hs.window.focusedWindow()      -- current window
    local uuid = win:screen():spacesUUID()     -- uuid for current screen
    local spaceID = spaces.layout()[uuid][sp]  -- internal index for sp
    local set = {}
    for _, l in ipairs(allSpaces) do set[l] = true end
    print(set)
    spaces.moveWindowToSpace(win:id(), spaceID) -- move window to new space
    spaces.changeToSpace(spaceID)
end
--
-- Key bindings.
--
local hotkeys = hs.hotkey.modal.new({ "cmd", "shift", "alt" }, "F19")
-- Applicatons
hotkeys:bind({ "alt", "shift" }, "m", function()
  hs.application.open('mail.app')
end)

hotkeys:bind({ "alt", "shift" }, "c", function()
  hs.application.open('cron.app')
end)

-- Grid
hotkeys:bind({ "cmd", "alt" }, "right", chain({ grid.Layout.rightHalf, grid.Layout.leftHalf }))
hotkeys:bind({ "cmd", "alt" }, "left", chain({ grid.Layout.leftHalf, grid.Layout.rightHalf }))
hotkeys:bind({ "cmd", "alt" }, "up", chain({ grid.Layout.topHalf, grid.Layout.bottomHalf }))
hotkeys:bind({ "cmd", "alt" }, "down", chain({ grid.Layout.bottomHalf, grid.Layout.topHalf }))
hotkeys:bind({ "cmd", "alt", "shift" }, "return", function()
	grid.app(grid.Layout.fullScreen)
end)
hotkeys:bind({ "cmd", "alt" }, "u", function()
	grid.app(grid.Layout.topLeft)
end)
hotkeys:bind({ "cmd", "alt" }, "i", function()
	grid.app(grid.Layout.topRight)
end)
hotkeys:bind({ "cmd", "alt", "shift" }, "u", function()
	grid.app(grid.Layout.topCenterLeft)
end)
hotkeys:bind({ "cmd", "alt", "shift" }, "i", function()
	grid.app(grid.Layout.topCenterRight)
end)
hotkeys:bind({ "cmd", "alt" }, "j", function()
	grid.app(grid.Layout.bottomLeft)
end)
hotkeys:bind({ "cmd", "alt" }, "k", function()
	grid.app(grid.Layout.bottomRight)
end)
hotkeys:bind({ "cmd", "alt", "shift" }, "j", function()
	grid.app(grid.Layout.bottomCenterLeft)
end)
hotkeys:bind({ "cmd", "alt", "shift" }, "k", function()
	grid.app(grid.Layout.bottomCenterRight)
end)
hotkeys:bind({ "cmd", "alt" }, "q", function()
	grid.app(grid.Layout.leftTwoThirds)
end)
hotkeys:bind({ "cmd", "alt" }, "w", function()
	grid.app(grid.Layout.centerTwoThirds)
end)
hotkeys:bind({ "cmd", "alt" }, "e", function()
	grid.app(grid.Layout.rightTwoThirds)
end)
hotkeys:bind({ "cmd", "alt" }, "a", function()
	grid.app(grid.Layout.leftThird)
end)
hotkeys:bind({ "cmd", "alt" }, "s", function()
	grid.app(grid.Layout.centerThird)
end)
hotkeys:bind({ "cmd", "alt" }, "d", function()
	grid.app(grid.Layout.rightThird)
end)
hotkeys:bind({ "cmd", "alt" }, "c", function()
	grid.app(grid.Layout.centeredBig)
end)
hotkeys:bind({ "cmd", "alt" }, "z", function()
	grid.app(grid.Layout.centerThirdLeft)
end)
hotkeys:bind({ "cmd", "alt" }, "x", function()
	grid.app(grid.Layout.centerThirdRight)
end)
hotkeys:bind({ "cmd", "alt" }, "b", function()
	grid.app(grid.Layout.bottomBig)
end)
hotkeys:bind({ "cmd", "alt" }, "t", function()
	grid.app(grid.Layout.topBig)
end)
hotkeys:bind({ "cmd", "alt", "shift"}, "b", function()
	grid.app(grid.Layout.bottomCenterBig)
end)
hotkeys:bind({ "cmd", "alt", "shift"}, "t", function()
	grid.app(grid.Layout.topCenterBig)
end)
hotkeys:bind({ "cmd", "alt" }, "1", function()
	grid.app(grid.Layout.topThird)
end)
hotkeys:bind({ "cmd", "alt" }, "2", function()
	grid.app(grid.Layout.topMiddleThird)
end)
hotkeys:bind({ "cmd", "alt" }, "3", function()
	grid.app(grid.Layout.topLastThird)
end)
hotkeys:bind({ "cmd", "alt" }, "4", function()
	grid.app(grid.Layout.bottomThird)
end)
hotkeys:bind({ "cmd", "alt" }, "5", function()
	grid.app(grid.Layout.bottomMiddleThird)
end)
hotkeys:bind({ "cmd", "alt" }, "6", function()
	grid.app(grid.Layout.bottomLastThird)
end)
hotkeys:bind({ "cmd", "alt" }, "7", function()
	grid.app(grid.Layout.topTwoThirds)
end)
hotkeys:bind({ "cmd", "alt" }, "8", function()
	grid.app(grid.Layout.topLastTwoThirds)
end)
hotkeys:bind({ "cmd", "alt" }, "9", function()
	grid.app(grid.Layout.bottomTwoThirds)
end)
hotkeys:bind({ "cmd", "alt" }, "0", function()
	grid.app(grid.Layout.bottomLastTwoThirds)
end)
hotkeys:bind({ "cmd", "alt" }, "o", function()
	grid.app(grid.Layout.topCenterTwoThirds)
end)
hotkeys:bind({ "cmd", "alt" }, "l", function()
	grid.app(grid.Layout.bottomCenterTwoThirds)
end)
hotkeys:bind({ "ctrl", "alt", "cmd" }, "right", function()
        moveToNextSpace(1)
end)
hotkeys:bind({ "ctrl", "alt", "cmd" }, "left", function()
        moveToNextSpace(-1)
end)

hotkeys:bind({ "cmd", "alt"}, "return", function()
	local win = hs.window.frontmostWindow()
	if windowSize["zoom"] == false then
		windowSize["frame"] = win:frame()
		grid.app(grid.Layout.fullScreen)
		windowSize["zoom"] = true
	else
		win:setFrame(windowSize["frame"])
		windowSize["zoom"] = false
	end
end)

hotkeys:bind({ "cmd" }, "escape", function()
	-- hs.hints.windowHints()
	hs.hints.windowHints(hs.window.visibleWindows())
end)

hs.urlevent.httpCallback = function(scheme, host, params, fullURL)
    if host == nil then
        host = 'file'
    end
    local success, _, res = hs.osascript.applescript('choose from list {"Firefox", "Safari"} with prompt "Open '..host..' with…"');
    local app
    if success and res:match('Firefox') ~= nil then
        app = 'org.mozilla.firefox'
    elseif success and res:match('Safari') ~= nil then
        app = 'com.apple.Safari'
    else
        return
    end
    hs.urlevent.openURLWithBundle(fullURL, app)
end

function applicationWatcher(appName, eventType, appObject)

	windowSize["zoom"] = false
	if appName == "Finder" then
		if eventType == hs.application.watcher.activated then
			-- hotkeys:exit()
			-- Bring all Finder windows forward when one gets activated
			appObject:selectMenuItem({ "Window", "Bring All to Front" })
		elseif eventType == hs.application.watcher.deactivated then
			-- Emacs just lost focus, enable our hotkeys
			-- hotkeys:enter()
		end
	end
end

appWatcher = hs.application.watcher.new(applicationWatcher):start()
hotkeys:enter()

function reloadConfig(files)
	doReload = false
	for _, file in pairs(files) do
		if file:sub(-4) == ".lua" then
			doReload = true
		end
	end
	if doReload then
		hs.reload()
	end
end

local reloadWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

