--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:00f79449327e3dafba6ebd1893e9fcf3:c06160537185d0dcebcd03a7f3f80f0a:1549103f05b151556ebb5d71874d750d$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- I1
            x=1,
            y=1,
            width=406,
            height=500,

        },
        {
            -- I2
            x=409,
            y=1,
            width=406,
            height=500,

        },
        {
            -- I3
            x=817,
            y=1,
            width=406,
            height=500,

        },
    },

    sheetContentWidth = 1224,
    sheetContentHeight = 502
}

SheetInfo.frameIndex =
{

    ["I1"] = 1,
    ["I2"] = 2,
    ["I3"] = 3,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
