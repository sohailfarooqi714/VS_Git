--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:ce9fd4e89c5015768b9d7216f8659bb2:cd44c27657b740b7b014743fd4a244d5:47bcae534841436681f2d207939c39be$
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
            width=404,
            height=500,

        },
        {
            -- K2
            x=1,
            y=503,
            width=404,
            height=500,

        },
        {
            -- K3
            x=407,
            y=1,
            width=404,
            height=500,

        },
        {
            -- K4
            x=407,
            y=503,
            width=404,
            height=500,

        },
        {
            -- K5
            x=813,
            y=1,
            width=404,
            height=500,

        },
        {
            -- K6
            x=813,
            y=503,
            width=404,
            height=500,

        },
        {
            -- K7
            x=1219,
            y=1,
            width=404,
            height=500,

        },
        {
            -- K8
            x=1625,
            y=1,
            width=404,
            height=500,

        },
        {
            -- K9
            x=1219,
            y=503,
            width=404,
            height=500,

        },
    },

    sheetContentWidth = 2030,
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
    ["K9"] = 9,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
