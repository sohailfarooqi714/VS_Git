--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:4720b317811329032584059e54610290:ac85a3ebc9b40aaac0f6de493dd1479d:281f68969438d4839036c9e309573e0c$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = 
    {
    
        {
            -- V1
            x=1,
            y=1573,
            width=528,
            height=378,

            sourceX = 19,
            sourceY = 22,
            sourceWidth = 614,
            sourceHeight = 400
        },
        {
            -- V2
            x=1,
            y=1,
            width=549,
            height=842,

            sourceX = 87,
            sourceY = 58,
            sourceWidth = 655,
            sourceHeight = 900
        },
        {
            -- V3
            x=1,
            y=845,
            width=421,
            height=726,

            sourceX = 82,
            sourceY = 74,
            sourceWidth = 581,
            sourceHeight = 800
        },
    },

    sheetContentWidth = 551,
    sheetContentHeight = 1952
}

SheetInfo.frameIndex =
{

    ["V1"] = 1,
    ["V2"] = 2,
    ["V3"] = 3,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
