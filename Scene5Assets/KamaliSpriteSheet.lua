--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:249fff026c99aab5ca3e947f120dccb2:40a56d97eaf9e9a1766e5da7e2b46296:47bcae534841436681f2d207939c39be$
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
            -- K1
            x=1,
            y=1,
            width=417,
            height=500,

        },
        {
            -- K2
            x=1,
            y=503,
            width=417,
            height=500,

        },
        {
            -- K3
            x=420,
            y=1,
            width=417,
            height=500,

        },
        {
            -- K4
            x=420,
            y=503,
            width=417,
            height=500,

        },
        {
            -- K5
            x=839,
            y=1,
            width=417,
            height=500,

        },
        {
            -- K6
            x=839,
            y=503,
            width=417,
            height=500,

        },
        {
            -- K7
            x=1258,
            y=1,
            width=417,
            height=500,

        },
        {
            -- K8
            x=1258,
            y=503,
            width=417,
            height=500,

        },
    },

    sheetContentWidth = 1676,
    sheetContentHeight = 1004
}

SheetInfo.frameIndex =
{

    ["K1"] = 1,
    ["K2"] = 2,
    ["K3"] = 3,
    ["K4"] = 4,
    ["K5"] = 5,
    ["K6"] = 6,
    ["K7"] = 7,
    ["K8"] = 8,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
