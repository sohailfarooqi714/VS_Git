--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:0065144141182679749486bc45044bdb:8f3721696f4b3d8907f1b9552062a2bf:281f68969438d4839036c9e309573e0c$
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
            -- V1
            x=1,
            y=1,
            width=911,
            height=738,

            sourceX = 158,
            sourceY = 176,
            sourceWidth = 1241,
            sourceHeight = 1000
        },
        {
            -- V2
            x=914,
            y=1,
            width=170,
            height=700,

            sourceX = 26,
            sourceY = 189,
            sourceWidth = 226,
            sourceHeight = 1000
        },
    },

    sheetContentWidth = 1085,
    sheetContentHeight = 740
}

SheetInfo.frameIndex =
{

    ["V1"] = 1,
    ["V2"] = 2,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
