--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:f1e7735e2de7a98e816996d05829c9a0:aba5c15bdd145ae524ef5ed51dcb1244:0ce10c4b49c92c07e1c312c13c913047$
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
            width=364,
            height=582,

            sourceX = 92,
            sourceY = 106,
            sourceWidth = 500,
            sourceHeight = 688
        },
        {
            -- K2
            x=367,
            y=1,
            width=302,
            height=582,

            sourceX = 91,
            sourceY = 106,
            sourceWidth = 500,
            sourceHeight = 688
        },
        {
            -- K3
            x=671,
            y=1,
            width=302,
            height=582,

            sourceX = 91,
            sourceY = 106,
            sourceWidth = 500,
            sourceHeight = 688
        },
        {
            -- K4
            x=267,
            y=1169,
            width=264,
            height=582,

            sourceX = 128,
            sourceY = 106,
            sourceWidth = 500,
            sourceHeight = 688
        },
        {
            -- K5
            x=1,
            y=585,
            width=302,
            height=582,

            sourceX = 91,
            sourceY = 106,
            sourceWidth = 500,
            sourceHeight = 688
        },
        {
            -- K6
            x=305,
            y=585,
            width=264,
            height=582,

            sourceX = 128,
            sourceY = 106,
            sourceWidth = 500,
            sourceHeight = 688
        },
        {
            -- K7
            x=533,
            y=1169,
            width=264,
            height=582,

            sourceX = 128,
            sourceY = 106,
            sourceWidth = 500,
            sourceHeight = 688
        },
        {
            -- K8
            x=571,
            y=585,
            width=264,
            height=582,

            sourceX = 128,
            sourceY = 106,
            sourceWidth = 500,
            sourceHeight = 688
        },
        {
            -- K9
            x=799,
            y=1169,
            width=264,
            height=582,

            sourceX = 128,
            sourceY = 106,
            sourceWidth = 500,
            sourceHeight = 688
        },
        {
            -- K10
            x=1,
            y=1169,
            width=264,
            height=582,

            sourceX = 128,
            sourceY = 106,
            sourceWidth = 500,
            sourceHeight = 688
        },
    },

    sheetContentWidth = 1064,
    sheetContentHeight = 1752
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
    ["K10"] = 10,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
