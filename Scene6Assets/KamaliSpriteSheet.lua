--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:482824b36ad7cbcfc4cd17ef9f09a686:cabe6173da06d239c4792e65624d9f36:47bcae534841436681f2d207939c39be$
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
            y=803,
            width=561,
            height=800,

        },
        {
            -- K2
            x=564,
            y=803,
            width=508,
            height=800,

        },
        {
            -- K3
            x=1,
            y=1,
            width=614,
            height=800,

        },
        {
            -- K4
            x=617,
            y=1,
            width=614,
            height=800,

        },
        {
            -- K5
            x=1074,
            y=803,
            width=349,
            height=800,

        },
    },

    sheetContentWidth = 1424,
    sheetContentHeight = 1604
}

SheetInfo.frameIndex =
{

    ["K1"] = 1,
    ["K2"] = 2,
    ["K3"] = 3,
    ["K4"] = 4,
    ["K5"] = 5,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
