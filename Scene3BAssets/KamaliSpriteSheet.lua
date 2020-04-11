--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:4da3921df8db18aa0c639b601f440485:9499484243a72dc6c4f4810aa862a1c3:47bcae534841436681f2d207939c39be$
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
            width=779,
            height=1200,

        },
        {
            -- K2
            x=782,
            y=1,
            width=600,
            height=1161,

            sourceX = 185,
            sourceY = 214,
            sourceWidth = 1000,
            sourceHeight = 1375
        },
        {
            -- K3
            x=1384,
            y=1,
            width=526,
            height=1161,

            sourceX = 257,
            sourceY = 214,
            sourceWidth = 1000,
            sourceHeight = 1375
        },
    },

    sheetContentWidth = 1911,
    sheetContentHeight = 1202
}

SheetInfo.frameIndex =
{

    ["K1"] = 1,
    ["K2"] = 2,
    ["K3"] = 3,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
