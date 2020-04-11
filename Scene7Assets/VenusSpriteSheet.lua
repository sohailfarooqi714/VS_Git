--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:066584554f2f41b752711b622ae4169e:076f9ecd81b110770488175e47b5495a:281f68969438d4839036c9e309573e0c$
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
            -- 1
            x=1,
            y=1,
            width=226,
            height=1000,

        },
        {
            -- 2
            x=229,
            y=1,
            width=226,
            height=1000,

        },
        {
            -- 3
            x=457,
            y=447,
            width=136,
            height=562,

            sourceX = 20,
            sourceY = 150,
            sourceWidth = 180,
            sourceHeight = 800
        },
        {
            -- 4
            x=457,
            y=1,
            width=549,
            height=444,

            sourceX = 94,
            sourceY = 105,
            sourceWidth = 745,
            sourceHeight = 600
        },
    },

    sheetContentWidth = 1007,
    sheetContentHeight = 1010
}

SheetInfo.frameIndex =
{

    ["1"] = 1,
    ["2"] = 2,
    ["3"] = 3,
    ["4"] = 4,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
