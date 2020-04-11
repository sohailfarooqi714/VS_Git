--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:655fe9590a7252ffa0841e03b1c030a5:f382cd613e1820f890c8260998afa08f:1549103f05b151556ebb5d71874d750d$
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
            width=465,
            height=800,

        },
        {
            -- I2
            x=1366,
            y=1,
            width=415,
            height=800,

        },
        {
            -- I3
            x=468,
            y=1,
            width=447,
            height=800,

        },
        {
            -- I4
            x=917,
            y=1,
            width=447,
            height=800,

        },
    },

    sheetContentWidth = 1782,
    sheetContentHeight = 802
}

SheetInfo.frameIndex =
{

    ["I1"] = 1,
    ["I2"] = 2,
    ["I3"] = 3,
    ["I4"] = 4,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
