--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:41ce3f8a9668a88f7311b39d1ab1b82a:720e05268b557d49b9ed69531d0a8bc4:281f68969438d4839036c9e309573e0c$
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
            -- Venus2
            x=1,
            y=1,
            width=265,
            height=932,

            sourceX = 15,
            sourceY = 161,
            sourceWidth = 295,
            sourceHeight = 1200
        },
        {
            -- Venus2Salam
            x=533,
            y=1,
            width=253,
            height=930,

            sourceX = 23,
            sourceY = 100,
            sourceWidth = 295,
            sourceHeight = 1200
        },
        {
            -- Venus2Smile
            x=268,
            y=1,
            width=263,
            height=930,

            sourceX = 12,
            sourceY = 100,
            sourceWidth = 295,
            sourceHeight = 1200
        },
    },

    sheetContentWidth = 787,
    sheetContentHeight = 934
}

SheetInfo.frameIndex =
{

    ["Venus2"] = 1,
    ["Venus2Salam"] = 2,
    ["Venus2Smile"] = 3,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
