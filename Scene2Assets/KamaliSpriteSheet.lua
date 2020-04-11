--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:c4ff2e2cf0bcdaf0e7c4bf41008c5ba2:5232f11b69d474db0e49d1504315ab37:47bcae534841436681f2d207939c39be$
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
            width=942,
            height=1145,

            sourceX = 36,
            sourceY = 230,
            sourceWidth = 1000,
            sourceHeight = 1375
        },
        {
            -- K2
            x=945,
            y=1,
            width=942,
            height=1145,

            sourceX = 36,
            sourceY = 230,
            sourceWidth = 1000,
            sourceHeight = 1375
        },
    },

    sheetContentWidth = 1888,
    sheetContentHeight = 1147
}

SheetInfo.frameIndex =
{

    ["K1"] = 1,
    ["K2"] = 2,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
