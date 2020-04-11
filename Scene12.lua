-----------------------------------------------------------------------------------------
--
-- main.lua
--
----------------------------------------------------------------------------------------

-- Your code here

local composer = require( "composer" )
local scene = composer.newScene()
local json = require( "json" )

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

--Conigure Image Sheet
local sheetOptionsSarah =
{
    
    frames = 
    {
    
        {
            -- S1
            x=1063,
            y=1,
            width=264,
            height=800,

        },
        {
            -- S2
            x=396,
            y=1,
            width=372,
            height=800,

        },
        {
            -- S3
            x=1329,
            y=1,
            width=250,
            height=800,

        },
        {
            -- S4
            x=1,
            y=1,
            width=393,
            height=800,

        },
        {
            -- S5
            x=770,
            y=1,
            width=291,
            height=800,

        },
    },

    sheetContentWidth = 1580,
    sheetContentHeight = 802
}

--Conigure Image Sheet
local sheetOptionsKS =
{
    
    frames = {
    
        {
            -- KS1
            x=1,
            y=1,
            width=825,
            height=800,

        },
        {
            -- KS2
            x=828,
            y=1,
            width=825,
            height=800,

        },
    },

    sheetContentWidth = 1654,
    sheetContentHeight = 802
}

--Conigure Image Sheet
local sheetOptionsIsaac =
{
    
    frames = 
    {
    
        {
            -- I1
            x=610,
            y=1,
            width=493,
            height=800,

        },
        {
            -- I2
            x=1,
            y=1,
            width=607,
            height=800,

        },
        {
            -- I3
            x=459,
            y=803,
            width=230,
            height=800,

        },
        {
            -- I4
            x=691,
            y=803,
            width=230,
            height=800,

        },
        {
            -- I5
            x=923,
            y=803,
            width=230,
            height=800,

        },
        {
            -- I6
            x=1,
            y=803,
            width=456,
            height=800,

        },
    },

    sheetContentWidth = 1154,
    sheetContentHeight = 1604
}

--Conigure Image Sheet
local sheetOptionsKamali =
{
    
    frames = 
    {
    
        {
            -- K1
            x=579,
            y=1,
            width=494,
            height=600,

        },
        {
            -- K2
            x=1075,
            y=1,
            width=494,
            height=600,

        },
        {
            -- K3
            x=579,
            y=603,
            width=494,
            height=600,

        },
        {
            -- K4
            x=1075,
            y=603,
            width=494,
            height=600,

        },
        {
            -- K5
            x=1,
            y=1205,
            width=494,
            height=600,

        },
        {
            -- K6
            x=497,
            y=1205,
            width=494,
            height=600,

        },
        {
            -- K7
            x=993,
            y=1205,
            width=494,
            height=600,

        },
        {
            -- K8
            x=1,
            y=1,
            width=576,
            height=700,

        },
    },

    sheetContentWidth = 1570,
    sheetContentHeight = 1806
}
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
local text = {letters="Accessing Remote System PRJVENUS@Hkamali_PC\n\nRun access script . . . Complete", index = 1} --FOR MAIN FRAME 

local MainframeTextBox = display.newText("", 0, 0,"UI_Elements/Digital-System",15) -- FOR MAINFRAME EFFECT
MainframeTextBox.x = display.contentCenterX
MainframeTextBox.y = display.contentCenterY
MainframeTextBox:setFillColor(0,1,0)
------------------------------------------------------------------------------------------------------
local objectSheet = graphics.newImageSheet( "Scene12Assets/SarahSpriteSheet.png", sheetOptionsSarah )
local objectSheet2 = graphics.newImageSheet( "Scene12Assets/KSSpriteSheet.png", sheetOptionsKS )
local objectSheet3 = graphics.newImageSheet( "Scene12Assets/IsaacSpriteSheet.png", sheetOptionsIsaac )
local objectSheet4 = graphics.newImageSheet( "Scene12Assets/KamaliSpriteSheet.png", sheetOptionsKamali )
 
local dataTable = {}
 
local filePath = system.pathForFile( "dialog1.json", system.ResourceDirectory ) 	--Specify path of interaction

local contents

local tapCount = 0
 
local start = 1
local mid1 = 2
local mid2 = 3
local finish = 4

local function loadData() -- CUSTOM FUNCTION LOADS JSON DATA INTO LUA TABLE
 
    local file = io.open( filePath, "r" )
 
    if file then
        print(" File Exists! ")
        contents = file:read( "*a" )
        io.close( file )
        dataTable = json.decode( contents )
    else
        print(" File Does Not Exist! ")
    end
end

loadData()

local jsonData = json.encode(dataTable)
local Dialogue = json.decode(jsonData)

local function mainframeText()   --FOR MAINFRAME EFFECT
    local c = string.sub(text.letters, 1, text.index)
    MainframeTextBox.text = c
    text.index = text.index + 1
end

local function displayMainFrame()
    timer.performWithDelay(50, mainframeText, string.len(text.letters))
end

local function buttonReappear()
	--Button Disappear Transition
    transition.to( button,{ time = 1 ,delay = 1 ,alpha = 0} )
    --Button Reappear Transition
    transition.to( button,{ time = 1 ,delay = 3000 ,alpha = 1} )
end

function outerRotate()
    --Method 2
    transition.to( buttonOuter,{rotation = 360, time = 400} )
    transition.to( buttonOuter,{rotation = 720, time = 400, delay = 800} )
    transition.to( buttonOuter,{rotation = 1080, time = 400, delay = 1600} )
    transition.to( buttonOuter,{rotation = 1440, time = 400, delay = 2400} )
end

--Function for Location Text And Location Divider Transitions.
function LocationTextAppear()
    --Location Text Transitions Appear
    transition.to( LocationTextUpper, { time = 100, delay = 6000 ,alpha = 1 } )
    transition.to( LocationTextUpper1, { time = 100, delay = 6500 ,alpha = 1 } )
    transition.to( LocationTextLower, { time = 100, delay = 7500 ,alpha = 1})

    transition.to( LocationTextUpper, { time = 100, delay = 10000 ,alpha = 0 } )
    transition.to( LocationTextUpper1, { time = 100, delay = 10000 ,alpha = 0 } )
    transition.to( LocationTextLower, { time = 100, delay = 10000 ,alpha = 0})
end

function dialogFunction(event)
    --Increment values
    start = start + 4
    mid1 = mid1 + 4
    mid2 = mid2 + 4
    finish = finish + 4
	--Previous Dialogues Disappear
    transition.to(DialogText1,{alpha = 0, time = 400, delay = 400})
    transition.to(DialogText2,{alpha = 0, time = 400, delay = 400})
    transition.to(DialogText3,{alpha = 0, time = 400, delay = 400})
    transition.to(DialogText4,{alpha = 0, time = 400, delay = 400})
      --Dialogue Strings
      DialogText1 = display.newText(Dialogue.Scene12[start]  , 240, 240, "UI_Elements/OpenSans-Light", 12)
      DialogText1:setFillColor( 0, 0, 0 )
      DialogText1.alpha = 0
      DialogText2 = display.newText(Dialogue.Scene12[mid1]  , 240, 260, "UI_Elements/OpenSans-Light", 12)
      DialogText2:setFillColor( 0, 0, 0 )
      DialogText2.alpha = 0
      DialogText3 = display.newText(Dialogue.Scene12[mid2]  , 240, 280, "UI_Elements/OpenSans-Light", 12)
      DialogText3:setFillColor( 0, 0, 0 )
      DialogText3.alpha = 0
      DialogText4 = display.newText(Dialogue.Scene12[finish]  , 240, 300, "UI_Elements/OpenSans-Light", 12)
      DialogText4:setFillColor( 0, 0, 0 )
      DialogText4.alpha = 0
    --New Dialogues Appear
    transition.to(DialogText1,{alpha = 1, time = 400, delay = 1000})
    transition.to(DialogText2,{alpha = 1, time = 400, delay = 1500})
    transition.to(DialogText3,{alpha = 1, time = 400, delay = 2000})
    transition.to(DialogText4,{alpha = 1, time = 400, delay = 2500})
end

function CharControl()
    tapCount = tapCount + 1
    print(tapCount)
    if(tapCount == 1)then
        transition.to(S1,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(S5,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 2)then
        transition.to(S5,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(KS1,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 3)then
        transition.to(KS1,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(KS2,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(dialogBox,{time = 400, delay = 1000, alpha = 0})
        transition.to(SarahName,{time = 400, delay = 1000 ,alpha = 0})
    elseif(tapCount == 4)then
        transition.to(dialogBox,{time = 400, delay = 1000, alpha = 1})
        transition.to(SarahName,{time = 400, delay = 1000, alpha = 1})
    elseif(tapCount == 9)then
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusName,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 11)then
        transition.to(VenusName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(KS2,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(S4,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 12)then
        transition.to(S4,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(KS2,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 13)then
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusName,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 14)then
        transition.to(VenusName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(KS2,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(S3,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 15)then
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusName,{alpha = 1, time = 400, delay = 1000})
        transition.to(S3,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(KS2,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 16)then
        transition.to(VenusName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 17)then
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusName,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 19)then
        transition.to(VenusName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(KS2,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(KS1,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 20)then
        transition.to(dialogBox,{time = 400, delay = 1000, alpha = 0})
        transition.to(SarahName,{time = 400, delay = 1000 ,alpha = 0})
        transition.to(I1,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(KS1,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(S3,{ alpha = 1, time = 2000, delay = 1000} )
        transition.to(K1,{ alpha = 1, time = 2000, delay = 1000} )
    elseif(tapCount == 21)then
        transition.to(dialogBox,{time = 400, delay = 1000, alpha = 1})
        transition.to(KamaliName,{time = 400, delay = 1000 ,alpha = 1})
        transition.to(K1,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(K3,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(S3 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to(I1 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 22)then
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})
        transition.to(I1 ,{time = 1000, delay = 400, alpha = 1})
        transition.to(K3 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 23)then
        transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(S3,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(S5,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(I1 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 24)then
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})
        transition.to(I1,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(I3,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(S5 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 25)then
        transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(S5,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(S3,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(I3 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 26)then
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})
        transition.to(I3 ,{time = 1000, delay = 400, alpha = 1})
        transition.to(S3 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 27)then
        transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to(K3 ,{time = 1000, delay = 400, alpha = 1})
        transition.to(I3 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 28)then
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})
        transition.to(I3,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(I2,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(K3 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 29)then
        transition.to(dialogBox,{time = 400, delay = 1000, alpha = 0})
        transition.to(IsaacName,{time = 400, delay = 1000 ,alpha = 0})
        transition.to(I2,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(I3,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(I3 ,{time = 1000, delay = 1500, alpha = 0.7})
        transition.to(K3,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(K4,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(K4,{ alpha = 0, time = 2500, delay = 3000} )
        transition.to(K7,{ alpha = 1, time = 2000, delay = 3000} )
    elseif(tapCount == 30)then
        transition.to(dialogBox,{time = 400, delay = 1000, alpha = 1})
        transition.to(KamaliName,{time = 400, delay = 1000 ,alpha = 1})
        transition.to(K7,{ alpha = 0, time = 2500, delay = 3000} )
        transition.to(K8,{ alpha = 1, time = 2000, delay = 3000} )
    elseif(tapCount == 32)then
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})
        transition.to(I3,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(I4,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(K8 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 33)then
        transition.to(dialogBox,{time = 400, delay = 1000, alpha = 0})
        transition.to(IsaacName,{time = 400, delay = 1000 ,alpha = 0})
        transition.to(S3,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(S4,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(K8,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(K6,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 34)then
        transition.to(dialogBox,{time = 400, delay = 1000, alpha = 1})
        transition.to(IsaacName,{time = 400, delay = 1000 ,alpha = 1})
        transition.to(S4 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to(K6 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 35)then
        transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to(K6 ,{time = 1000, delay = 400, alpha = 1})
        transition.to(I4 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 36)then
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(S4 ,{time = 1000, delay = 400, alpha = 1})
        transition.to(K6 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to(I4 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 37)then
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})
        transition.to(I4 ,{time = 1000, delay = 400, alpha = 1})
        transition.to(S4 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 38)then
        transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(S4 ,{time = 1000, delay = 400, alpha = 1})
        transition.to(I4 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 39)then
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to(K6,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(K8,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(S4 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 40)then
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})
        transition.to(I4 ,{time = 1000, delay = 400, alpha = 1})
        transition.to(K8 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 41)then
        transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to(K8,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(K4,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(I4 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 42)then
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})
        transition.to(I4 ,{time = 1000, delay = 400, alpha = 1})
        transition.to(K4 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 44)then
        transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to(K4 ,{time = 1000, delay = 400, alpha = 1})
        transition.to(I4 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 46)then
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})
        transition.to(I4 ,{time = 1000, delay = 400, alpha = 1})
        transition.to(K4 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 50)then
        transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(S4,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(S3,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(I4 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 53)then
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})
        transition.to(I4 ,{time = 1000, delay = 400, alpha = 1})
        transition.to(S3 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 56)then
        transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to(K4 ,{time = 1000, delay = 400, alpha = 1})
        transition.to(I4 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 58)then
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})
        transition.to(I4,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(I3,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(K4 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 59)then
        transition.to(dialogBox,{time = 400, delay = 1000, alpha = 0})
        transition.to(IsaacName,{time = 400, delay = 1000 ,alpha = 0})
        transition.to(I3 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to(background ,{time = 2000, delay = 1000, alpha = 0.7})
        displayMainFrame()
    elseif(tapCount == 60)then
        transition.to(MainframeTextBox,{time = 2000, delay = 400, alpha = 0})
        transition.to(dialogBox,{time = 400, delay = 1000, alpha = 1})
        transition.to(VenusName,{time = 400, delay = 1000 ,alpha = 1})
        transition.to(background ,{time = 2000, delay = 1000, alpha = 1})
        transition.to(S3 ,{time = 1000, delay = 400, alpha = 1})
        transition.to(K4,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(K5,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(I3 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 61)then
        transition.to(dialogBox,{time = 400, delay = 1000, alpha = 0})
        transition.to(IsaacName,{time = 400, delay = 1000 ,alpha = 0})
        transition.to(K5,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(K4,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(S3,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(S5,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(I3,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(I5,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 62)then
        transition.to(dialogBox,{time = 400, delay = 1000, alpha = 1})
        transition.to(VenusName,{time = 400, delay = 1000 ,alpha = 1})
    elseif(tapCount == 64)then
        transition.to(VenusName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to(K4,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(K5,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(I5 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to(S5 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 66)then
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusName,{alpha = 1, time = 400, delay = 1000})
        transition.to(K5 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 67)then
        transition.to(VenusName,{alpha = 0, time = 400, delay = 400})
        transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})
        transition.to(I5,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(I4,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 69)then
        transition.to(I4,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(I3,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 70)then
        transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusName,{alpha = 1, time = 400, delay = 1000})
        transition.to(I3 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 71)then
        transition.to(VenusName,{alpha = 0, time = 400, delay = 400})
        transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})
        transition.to(I3 ,{time = 1000, delay = 400, alpha = 1})
    elseif(tapCount == 73)then
        transition.to(I3,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(I4,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 74)then
        transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusName,{alpha = 1, time = 400, delay = 1000})
        transition.to(I4 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 75)then
        transition.to(VenusName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(S5,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(S3,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 76)then
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to(K5,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(K4,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(S3 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 78)then
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})
        transition.to(I4 ,{time = 1000, delay = 400, alpha = 1})
        transition.to(K4 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 81)then
        transition.to(I4,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(I6,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(I6,{ alpha = 0, time = 2000, delay = 3000} )
    elseif(tapCount == 82)then
        transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to(K4 ,{time = 1000, delay = 400, alpha = 1})
    elseif(tapCount == 83)then
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(S3 ,{time = 1000, delay = 400, alpha = 1})
        transition.to(K4 ,{time = 1000, delay = 400, alpha = 0.7})
    end
end
 
function bringToFront()
    dialogBox:toFront()
    button:toFront()
    buttonOuter:toFront()
    SarahName:toFront()
    VenusName:toFront()
    KamaliName:toFront()
    IsaacName:toFront()
end
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    --Scene Background
    background = display.newImageRect( sceneGroup, "Scene3Assets/Lab_bg1.png", 565, 350)
    background.x = display.contentCenterX 
    background.y = display.contentCenterY
    background.alpha = 1

    --Dialog Box PNG 
    dialogBox = display.newImageRect( sceneGroup, "Scene3Assets/textbox.png", 550, 110)
    dialogBox.x = display.contentCenterX 
    dialogBox.y = display.contentCenterY + 100
    dialogBox.alpha = 0

    --Scene Location Text
    LocationTextUpper = display.newText( sceneGroup,"5", 150,  100, "Scene3Assets/Fox", 45 )
    LocationTextUpper.alpha = 0
    LocationTextUpper1 = display.newText( sceneGroup,"Hours", 280, 100, "Scene3Assets/Fox", 45 )
    LocationTextUpper1.alpha = 0
    LocationTextLower = display.newText( sceneGroup,"Later", 250, 160, "Scene3Assets/Fox", 45 )
    LocationTextLower.alpha =  0

     --Dialogue Strings
     DialogText1 = display.newText(Dialogue.Scene12[start]  , 240, 240, "UI_Elements/OpenSans-Light", 12)
     DialogText1:setFillColor( 0, 0, 0 )
     DialogText1.alpha = 0
     DialogText2 = display.newText(Dialogue.Scene12[mid1]  , 240, 260, "UI_Elements/OpenSans-Light", 12)
     DialogText2:setFillColor( 0, 0, 0 )
     DialogText2.alpha = 0
     DialogText3 = display.newText(Dialogue.Scene12[mid2]  , 240, 280, "UI_Elements/OpenSans-Light", 12)
     DialogText3:setFillColor( 0, 0, 0 )
     DialogText3.alpha = 0
     DialogText4 = display.newText(Dialogue.Scene12[finish]  , 240, 300, "UI_Elements/OpenSans-Light", 12)
     DialogText4:setFillColor( 0, 0, 0 )
     DialogText4.alpha = 0
    
    --Kamali Name
    KamaliName = display.newText(sceneGroup,"Kamali", 15, 238, "UI_Elements/Ceria-Lebaran", 20)
    KamaliName.alpha = 0
    KamaliName:setFillColor( 0, 0, 0)
    --Sarah Name
    SarahName = display.newText(sceneGroup,"Sarah", 15, 238, "UI_Elements/Ceria-Lebaran", 20)
    SarahName.alpha = 0
    SarahName:setFillColor( 0, 0, 0) 
    --Venus Name
    VenusName = display.newText(sceneGroup,"Venus", 15, 238, "UI_Elements/Ceria-Lebaran", 20)
    VenusName.alpha = 0
    VenusName:setFillColor( 0, 0, 0)
    --Isaac Name
    IsaacName = display.newText(sceneGroup,"Isaac", 15, 238, "UI_Elements/Ceria-Lebaran", 20)
    IsaacName.alpha = 0
    IsaacName:setFillColor( 0, 0, 0)

    --Sarah Poses
    S1 = display.newImageRect( sceneGroup, objectSheet, 1, 90, 275 ) 
	S1.x = display.contentCenterX + 20
	S1.y = display.contentCenterY + 20
	S1.myName = "S1"
	S1.alpha = 0

    S2 = display.newImageRect( sceneGroup, objectSheet, 2, 130, 275 ) 
	S2.x = display.contentCenterX - 147
	S2.y = display.contentCenterY + 20
	S2.myName = "S2"
	S2.alpha = 0

	S3 = display.newImageRect( sceneGroup, objectSheet, 3, 82, 280 ) 
	S3.x = display.contentCenterX + 80
	S3.y = display.contentCenterY + 18
	S3.myName = "S3"
    S3.alpha = 0

    S4 = display.newImageRect( sceneGroup, objectSheet, 4, 130, 280 ) 
	S4.x = display.contentCenterX + 85
	S4.y = display.contentCenterY + 18
	S4.myName = "S4"
	S4.alpha = 0

	S5 = display.newImageRect( sceneGroup, objectSheet, 5, 98, 280 ) 
	S5.x = display.contentCenterX + 80
	S5.y = display.contentCenterY + 18
	S5.myName = "S5"
    S5.alpha = 0

    KS1 = display.newImageRect( sceneGroup, objectSheet2, 1, 290, 275 ) 
	KS1.x = display.contentCenterX + 150
	KS1.y = display.contentCenterY + 20
	KS1.myName = "KS1"
    KS1.alpha = 0

    KS2 = display.newImageRect( sceneGroup, objectSheet2, 2, 290, 275 ) 
	KS2.x = display.contentCenterX + 150
	KS2.y = display.contentCenterY + 20
	KS2.myName = "KS2"
    KS2.alpha = 0

    --Kamali Poses
    K1 = display.newImageRect( sceneGroup, objectSheet4, 1, 240, 290 )
	K1.x = display.contentCenterX + 180
	K1.y = display.contentCenterY + 30
	K1.myName = "K1"
	K1.alpha = 0

	K2 = display.newImageRect( sceneGroup, objectSheet4, 2, 240, 290 )
	K2.x = display.contentCenterX + 180
	K2.y = display.contentCenterY + 30
	K2.myName = "K2"
    K2.alpha = 0
    
    K3 = display.newImageRect( sceneGroup, objectSheet4, 3, 240, 290 )
	K3.x = display.contentCenterX + 180
	K3.y = display.contentCenterY + 30
	K3.myName = "K3"
    K3.alpha = 0
    
    K4 = display.newImageRect( sceneGroup, objectSheet4, 4, 240, 290 )
	K4.x = display.contentCenterX + 180
	K4.y = display.contentCenterY + 30
	K4.myName = "K4"
    K4.alpha = 0
    
    K5 = display.newImageRect( sceneGroup, objectSheet4, 5, 240, 290 )
	K5.x = display.contentCenterX + 180
	K5.y = display.contentCenterY + 30
	K5.myName = "K5"
    K5.alpha = 0
    
    K6 = display.newImageRect( sceneGroup, objectSheet4, 6, 240, 290 )
	K6.x = display.contentCenterX + 180
	K6.y = display.contentCenterY + 30
	K6.myName = "K6"
	K6.alpha = 0

    K7 = display.newImageRect( sceneGroup, objectSheet4, 7, 240, 290 )
	K7.x = display.contentCenterX + 180
	K7.y = display.contentCenterY + 30
	K7.myName = "K7"
    K7.alpha = 0
    
    K8 = display.newImageRect( sceneGroup, objectSheet4, 8, 240, 290 )
	K8.x = display.contentCenterX + 180
	K8.y = display.contentCenterY + 30
	K8.myName = "K8"
    K8.alpha = 0
    
    --Isaac Poses
    I1 = display.newImageRect( sceneGroup, objectSheet3, 1, 180, 300 )
	I1.x = display.contentCenterX - 140
	I1.y = display.contentCenterY + 10
	I1.myName = "I1"
	I1.alpha = 0

	I2 = display.newImageRect( sceneGroup, objectSheet3, 2, 230, 300 )
	I2.x = display.contentCenterX + 40
	I2.y = display.contentCenterY + 10
	I2.myName = "I2"
    I2.alpha = 0
    
    I3= display.newImageRect( sceneGroup, objectSheet3, 3, 87, 300 )
	I3.x = display.contentCenterX - 50
	I3.y = display.contentCenterY + 10
	I3.myName = "I3"
    I3.alpha = 0
    
    I4 = display.newImageRect( sceneGroup, objectSheet3, 4, 87, 300 )
	I4.x = display.contentCenterX - 50
	I4.y = display.contentCenterY + 10
	I4.myName = "I4"
    I4.alpha = 0
    
    I5 = display.newImageRect( sceneGroup, objectSheet3, 5, 87, 300 )
	I5.x = display.contentCenterX - 50
	I5.y = display.contentCenterY + 10
	I5.myName = "I5"
    I5.alpha = 0
    
    I6 = display.newImageRect( sceneGroup, objectSheet3, 6, 180, 300 )
	I6.x = display.contentCenterX - 180
	I6.y = display.contentCenterY + 12
	I6.myName = "I6"
	I6.alpha = 0

     --Button
    button = display.newImageRect( sceneGroup, "Scene3Assets/blue.png", 20, 20 )
    button.x = display.contentCenterX + 250
    button.y = display.contentCenterY + 120
    button.alpha = 0

    --Button Outer
    buttonOuter = display.newImageRect( sceneGroup, "Scene3Assets/blueOuter.png", 30, 30 )
    buttonOuter.x = display.contentCenterX + 250
    buttonOuter.y = display.contentCenterY + 120
    buttonOuter.alpha = 0

    --Next Button
    nextButton = display.newImageRect( sceneGroup, "Scene3Assets/skipScene.png", 30, 30 )
    nextButton.x = display.contentCenterX + 250
    nextButton.y = display.contentCenterY + 120
    nextButton.alpha = 0

    LocationTextAppear()
    bringToFront()

    timer.performWithDelay(12000, buttonReappear)
    transition.to(buttonOuter,{time = 1, delay = 15000, alpha = 1})

    --Sarah Yawns into the lab
    transition.to( S2,{alpha = 1, time = 800, delay = 11000} )
    transition.to( S2,{alpha = 0, time = 800, delay = 12000})
    transition.to( S1,{alpha = 1, time = 800, delay = 12000} )

    transition.to(SarahName,{alpha = 1, time = 400, delay = 13000})
    transition.to(dialogBox,{alpha = 1, time = 400, delay = 13000})
    transition.to(DialogText2,{alpha = 1, time = 400, delay = 13000})
    transition.to(DialogText3,{alpha = 1, time = 400, delay = 13500})

    button:addEventListener("tap" , CharControl)
    button:addEventListener("tap" , dialogFunction)
    button:addEventListener("tap" , buttonReappear)
    button:addEventListener("tap" , outerRotate)
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene