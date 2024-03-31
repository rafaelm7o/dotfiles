local grid = {}
hs.grid.setGrid('12x12') -- allows us to place on quarters, thirds and halves
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0

grid.Layout = {
    fullScreen = '0,0 12x12',
    topHalf = '0,0 12x6',
    topThird = '0,0 4x6',
    topMiddleThird = '4,0 4x6',
    topLastThird = '8,0 4x6',
    topTwoThirds = '0,0 8x6',
    topCenterTwoThirds = '2,0 8x6',
    topLastTwoThirds = '4,0 8x6',
    topLeft = '0,0 6x6',
    topRight = '6,0 6x6',
    topBig = '2,0 8x7',
    topCenterRight = '6,0 4x6',
    topCenterLeft = '2,0 4x6',
    topCenterBig = '2,0 8x6',
    rightHalf = '6,0 6x12',
    rightThird = '8,0 4x12',
    rightTwoThirds = '4,0 8x12',
    bottomHalf = '0,6 12x6',
    bottomThird = '0,6 4x6',
    bottomMiddleThird = '4,6 4x6',
    bottomLastThird = '8,6 4x6',
    bottomTwoThirds = '0,6 8x6',
    bottomCenterTwoThirds = '2,6 8x6',
    bottomLastTwoThirds = '4,6 8x6',
    bottomRight = '6,6 6x6',
    bottomCenterLeft = '2,6 4x6',
    bottomCenterRight = '6,6 4x6',
    bottomLeft = '0,6 6x6',
    bottomBig = '2,5 8x7',
    bottomCenterBig = '2,6 8x6',
    leftHalf = '0,0 6x12',
    leftThird = '0,0 4x12',
    centerTwoThirds = '2,0 8x12',
    leftTwoThirds = '0,0 8x12',
    centeredBig = '2,2 8x7',
    centeredSmall = '4,4 4x4',
    centerThird = '4,0 4x12',
    centerThirdLeft = '2,1 4x11',
    centerThirdRight = '6,1 4x11',
  }

function grid.app(position)
    local win = hs.window.focusedWindow()
    local s = win:screen():frame()
    local screen = win:screen()
    hs.grid.set(win, position, screen)
end

return grid
