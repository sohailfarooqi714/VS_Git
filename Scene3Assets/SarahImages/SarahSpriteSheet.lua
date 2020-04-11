--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:5ad6e06b64e8cd9da2579160db7b8dc4:cc91f82b37f6a11ddf30392406155fd9:cc6ee35d01a034ea6cab1d8283bbd4bb$
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
            -- S1
            x=141,
            y=1,
            width=490,
            height=574,

            sourceX = 10,
            sourceY = 114,
            sourceWidth = 500,
            sourceHeight = 688
        },
        {
            -- S2
            x=1,
            y=577,
            width=490,
            height=574,

            sourceX = 10,
            sourceY = 114,
            sourceWidth = 500,
            sourceHeight = 688
        },
        {
            -- S3
            x=493,
            y=577,
            width=490,
            height=574,

            sourceX = 10,
            sourceY = 114,
            sourceWidth = 500,
            sourceHeight = 688
        },
        {
            -- S4
            x=985,
            y=577,
            width=490,
            height=574,

            sourceX = 10,
            sourceY = 114,
            sourceWidth = 500,
            sourceHeight = 688
        },
        {
            -- S5
            x=1653,
            y=1,
            width=206,
            height=574,

            sourceX = 191,
            sourceY = 114,
            sourceWidth = 500,
            sourceHeight = 688
        },
        {
            -- S6
            x=1,
            y=1,
            width=138,
            height=570,

            sourceX = 211,
            sourceY = 118,
            sourceWidth = 500,
            sourceHeight = 688
        },
        {
            -- S7
            x=825,
            y=1,
            width=190,
            height=574,

            sourceX = 190,
            sourceY = 114,
            sourceWidth = 500,
            sourceHeight = 688
        },
        {
            -- S8
            x=1477,
            y=577,
            width=206,
            height=574,

            sourceX = 191,
            sourceY = 114,
            sourceWidth = 500,
            sourceHeight = 688
        },
        {
            -- S9
            x=1685,
            y=577,
            width=190,
            height=574,

            sourceX = 190,
            sourceY = 114,
            sourceWidth = 500,
            sourceHeight = 688
        },
        {
            -- S10
            x=633,
            y=1,
            width=190,
            height=574,

            sourceX = 190,
            sourceY = 114,
            sourceWidth = 500,
            sourceHeight = 688
        },
        {
            -- S11
            x=825,
            y=1,
            width=190,
            height=574,

            sourceX = 190,
            sourceY = 114,
            sourceWidth = 500,
            sourceHeight = 688
        },
        {
            -- S12
            x=1017,
            y=1,
            width=190,
            height=574,

            sourceX = 190,
            sourceY = 114,
            sourceWidth = 500,
            sourceHeight = 688
        },
        {
            -- S13
            x=1209,
            y=1,
            width=206,
            height=574,

            sourceX = 191,
            sourceY = 114,
            sourceWidth = 500,
            sourceHeight = 688
        },
        {
            -- S14
            x=1417,
            y=1,
            width=234,
            height=574,

            sourceX = 163,
            sourceY = 114,
            sourceWidth = 500,
            sourceHeight = 688
        },
    },

    sheetContentWidth = 1876,
    sheetContentHeight = 1152
}

SheetInfo.frameIndex =
{

    ["S1"] = 1,
    ["S2"] = 2,
    ["S3"] = 3,
    ["S4"] = 4,
    ["S5"] = 5,
    ["S6"] = 6,
    ["S7"] = 7,
    ["S8"] = 8,
    ["S9"] = 9,
    ["S10"] = 10,
    ["S11"] = 11,
    ["S12"] = 12,
    ["S13"] = 13,
    ["S14"] = 14,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
