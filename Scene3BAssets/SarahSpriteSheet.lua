--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:5ad5c31f0cd1d8ba259b856b311d886a:b68367de3cb4242d66c77a630dd423bb:758394406102f958881713b1e4bebabd$
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
            -- S1
            x=928,
            y=1,
            width=274,
            height=1135,

            sourceX = 423,
            sourceY = 240,
            sourceWidth = 1000,
            sourceHeight = 1375
        },
        {
            -- S2
            x=1204,
            y=1,
            width=378,
            height=1145,

            sourceX = 381,
            sourceY = 230,
            sourceWidth = 1000,
            sourceHeight = 1375
        },
        {
            -- S3
            x=1,
            y=1,
            width=238,
            height=1000,

        },
        {
            -- S4
            x=241,
            y=1,
            width=329,
            height=1000,

        },
        {
            -- S5
            x=572,
            y=1,
            width=354,
            height=1000,

        },
    },

    sheetContentWidth = 1583,
    sheetContentHeight = 1147
}

SheetInfo.frameIndex =
{

    ["S1"] = 1,
    ["S2"] = 2,
    ["S3"] = 3,
    ["S4"] = 4,
    ["S5"] = 5,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
