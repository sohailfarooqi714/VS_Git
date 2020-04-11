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
local sheetOptionsMuavia =
{
    
    frames = {
    
        {
            -- 1
            x=1,
            y=1,
            width=607,
            height=800,

        },
        {
            -- 2
            x=610,
            y=1,
            width=386,
            height=800,

        },
        {
            -- 3
            x=610,
            y=803,
            width=386,
            height=800,

        },
        {
            -- 4
            x=998,
            y=1,
            width=386,
            height=800,

        },
        {
            -- 5
            x=998,
            y=803,
            width=386,
            height=800,

        },
        {
            -- 6
            x=1,
            y=803,
            width=607,
            height=800,

        },
    },

    sheetContentWidth = 1385,
    sheetContentHeight = 1604
}

--Conigure Image Sheet
local sheetOptionsChar =
{
    
    frames = {
    
        {
            -- 1
            x=1,
            y=1,
            width=335,
            height=800,

        },
        {
            -- 2
            x=338,
            y=1,
            width=355,
            height=800,

        },
        {
            -- 3
            x=1,
            y=803,
            width=1488,
            height=1000,

        },
    },

    sheetContentWidth = 1490,
    sheetContentHeight = 1804
}

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

local objectSheet = graphics.newImageSheet( "Scene16Assets/MuaviaSpriteSheet.png", sheetOptionsMuavia )

local objectSheet2 = graphics.newImageSheet( "Scene16Assets/CharSpriteSheet.png", sheetOptionsChar )
 
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

function LocationTextAppear()
    --Divider moves from right to left
    transition.to( LocationDivider, { x = 110, y = 259, time = 3000, delay = 600})
    --Location Text Transitions Appear
    transition.to( LocationTextUpper, { time = 6000, alpha = 1, onComplete = LocationTextDisappear } )
    transition.to( LocationTextLower, { time = 6000, alpha = 1, onComplete = LocationTextDisappear } )
    transition.to( LocationDivider, { time = 6000, alpha = 1, onComplete = LocationTextDisappear})
end

function LocationTextDisappear()
    --Location Text Transitions Disappear
    transition.to( LocationTextUpper, { time = 4500, delay = 1000,alpha = 0 } )
    transition.to( LocationTextLower, { time = 4500, delay = 1000,alpha = 0 } )
    transition.to( LocationDivider, { time = 4500, delay = 1000,alpha = 0})
end

function dialogFunction(event)
	--Previous Dialogues Disappear
    transition.to(DialogText1,{alpha = 0, time = 400, delay = 400})
    transition.to(DialogText2,{alpha = 0, time = 400, delay = 400})
    transition.to(DialogText3,{alpha = 0, time = 400, delay = 400})
    transition.to(DialogText4,{alpha = 0, time = 400, delay = 400})
      --Dialogue Strings
      DialogText1 = display.newText(Dialogue.Scene16[start]  , 240, 240, "UI_Elements/OpenSans-Light", 12)
      DialogText1:setFillColor( 0, 0, 0 )
      DialogText1.alpha = 0
      DialogText2 = display.newText(Dialogue.Scene16[mid1]  , 240, 260, "UI_Elements/OpenSans-Light", 12)
      DialogText2:setFillColor( 0, 0, 0 )
      DialogText2.alpha = 0
      DialogText3 = display.newText(Dialogue.Scene16[mid2]  , 240, 280, "UI_Elements/OpenSans-Light", 12)
      DialogText3:setFillColor( 0, 0, 0 )
      DialogText3.alpha = 0
      DialogText4 = display.newText(Dialogue.Scene16[finish]  , 240, 300, "UI_Elements/OpenSans-Light", 12)
      DialogText4:setFillColor( 0, 0, 0 )
      DialogText4.alpha = 0
    --New Dialogues Appear
    transition.to(DialogText1,{alpha = 1, time = 400, delay = 1000})
    transition.to(DialogText2,{alpha = 1, time = 400, delay = 1500})
    transition.to(DialogText3,{alpha = 1, time = 400, delay = 2000})
    transition.to(DialogText4,{alpha = 1, time = 400, delay = 2500})
     --Increment values
     start = start + 4
     mid1 = mid1 + 4
     mid2 = mid2 + 4
     finish = finish + 4
end

function CharControl()
    tapCount = tapCount + 1
    print(tapCount)
    if(tapCount == 1)then
        transition.to(dialogBox,{alpha = 0.85, time = 400, delay = 1500})
        transition.to(NerdsName,{alpha = 1, time = 400, delay = 1500})
    elseif(tapCount == 3)then
        transition.to(NerdsName,{time = 400, delay = 400, alpha = 0})
        transition.to(SaifName,{time = 400, delay = 1000, alpha = 1})
    elseif(tapCount == 4)then
        transition.to(SaifName,{time = 400, delay = 400, alpha = 0})
        transition.to(MuaviaName,{time = 400, delay = 1000, alpha = 1})
        transition.to(M2,{time = 2000, delay = 500, alpha = 1})
        transition.to(N1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 6)then
        transition.to(M2,{ alpha = 0, time = 2500} )
        transition.to(M1,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 7)then
        transition.to(MuaviaName,{time = 400, delay = 400, alpha = 0})
        transition.to(NerdsName,{time = 400, delay = 1000, alpha = 1})
        transition.to(N1,{time = 1000, delay = 400, alpha = 1} )
        transition.to(M1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 8)then
        transition.to(NerdsName,{time = 400, delay = 400, alpha = 0})
        transition.to(MuaviaName,{time = 400, delay = 1000, alpha = 1})
        transition.to(M1,{ alpha = 0, time = 2500} )
        transition.to(M2,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(N1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 9)then
        transition.to(MuaviaName,{time = 400, delay = 400, alpha = 0})
        transition.to(NerdsName,{time = 400, delay = 1000, alpha = 1})
        transition.to(N1,{time = 1000, delay = 400, alpha = 1} )
        transition.to(M2,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 10)then
        transition.to(NerdsName,{time = 400, delay = 400, alpha = 0})
        transition.to(MuaviaName,{time = 400, delay = 1000, alpha = 1})
        transition.to(M2,{ alpha = 0, time = 2500} )
        transition.to(M3,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(N1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 12)then
        transition.to(MuaviaName,{time = 400, delay = 400, alpha = 0})
        transition.to(SaifName,{time = 400, delay = 1000, alpha = 1})
        transition.to(N1,{ alpha = 0, time = 2500} )
        transition.to(S1,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(M3,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 13)then
        transition.to(SaifName,{time = 400, delay = 400, alpha = 0})
        transition.to(MuaviaName,{time = 400, delay = 1000, alpha = 1})
        transition.to(M3,{time = 1000, delay = 400, alpha = 1} )
        transition.to(S1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 15)then
        transition.to(MuaviaName,{time = 400, delay = 400, alpha = 0})
        transition.to(NerdsName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S1,{ alpha = 0, time = 2500} )
        transition.to(N1,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(M3,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 16)then
        transition.to(NerdsName,{time = 400, delay = 400, alpha = 0})
        transition.to(MuaviaName,{time = 400, delay = 1000, alpha = 1})
        transition.to(M3,{ alpha = 0, time = 2500} )
        transition.to(M4,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(N1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 19)then
        transition.to(MuaviaName,{time = 400, delay = 400, alpha = 0})
        transition.to(NerdsName,{time = 400, delay = 1000, alpha = 1})
        transition.to(N1,{time = 1000, delay = 400, alpha = 1} )
        transition.to(M4,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 20)then
        transition.to(NerdsName,{time = 400, delay = 400, alpha = 0})
        transition.to(MuaviaName,{time = 400, delay = 1000, alpha = 1})
        transition.to(M4,{ alpha = 0, time = 2500} )
        transition.to(M3,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(N1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 25)then
        transition.to(MuaviaName,{time = 400, delay = 400, alpha = 0})
        transition.to(NerdsName,{time = 400, delay = 1000, alpha = 1})
        transition.to(N1,{time = 1000, delay = 400, alpha = 1} )
        transition.to(M3,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 26)then
        transition.to(NerdsName,{time = 400, delay = 400, alpha = 0})
        transition.to(MuaviaName,{time = 400, delay = 1000, alpha = 1})
        transition.to(M3,{ alpha = 0, time = 2500} )
        transition.to(M1,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 27)then
        transition.to(MuaviaName,{time = 400, delay = 400, alpha = 0})
        transition.to(NerdsName,{time = 400, delay = 1000, alpha = 1})
        transition.to(N1,{time = 1000, delay = 400, alpha = 1} )
        transition.to(M1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 28)then
        transition.to(NerdsName,{time = 400, delay = 400, alpha = 0})
        transition.to(MuaviaName,{time = 400, delay = 1000, alpha = 1})
        transition.to(M1,{ alpha = 0, time = 2500} )
        transition.to(M2,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(N1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 29)then
        transition.to(MuaviaName,{time = 400, delay = 400, alpha = 0})
        transition.to(SaifName,{time = 400, delay = 1000, alpha = 1})
        transition.to(N1,{time = 1000, delay = 400, alpha = 1} )
        transition.to(M2,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 31)then
        transition.to(SaifName,{time = 400, delay = 400, alpha = 0})
        transition.to(MuaviaName,{time = 400, delay = 1000, alpha = 1})
        transition.to(M2,{time = 1000, delay = 400, alpha = 1} )
        transition.to(N1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 32)then
        transition.to(MuaviaName,{time = 400, delay = 400, alpha = 0})
        transition.to(NerdsName,{time = 400, delay = 1000, alpha = 1})
        transition.to(N1,{time = 1000, delay = 400, alpha = 1} )
        transition.to(M2,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 33)then
        transition.to(NerdsName,{time = 400, delay = 400, alpha = 0})
        transition.to(SaifName,{time = 400, delay = 1000, alpha = 1})
    elseif(tapCount == 34)then
        transition.to(SaifName,{time = 400, delay = 400, alpha = 0})
        transition.to(MuaviaName,{time = 400, delay = 1000, alpha = 1})
        transition.to(M2,{time = 1000, delay = 400, alpha = 1} )
        transition.to(N1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 35)then
        transition.to(MuaviaName,{time = 400, delay = 400, alpha = 0})
        transition.to(SaifName,{time = 400, delay = 1000, alpha = 1})
        transition.to(N1,{time = 1000, delay = 400, alpha = 1} )
        transition.to(M2,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 36)then
        transition.to(SaifName,{time = 400, delay = 400, alpha = 0})
        transition.to(MuaviaName,{time = 400, delay = 1000, alpha = 1})
        transition.to(M2,{time = 1000, delay = 400, alpha = 1} )
        transition.to(N1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 37)then
        transition.to(MuaviaName,{time = 400, delay = 400, alpha = 0})
        transition.to(SaifName,{time = 400, delay = 1000, alpha = 1})
        transition.to(N1,{ alpha = 0, time = 2500} )
        transition.to(S1,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(M2,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 39)then
        transition.to(S1,{ alpha = 0, time = 2500} )
        transition.to(N1,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 40)then
        transition.to(SaifName,{time = 400, delay = 400, alpha = 0})
        transition.to(NerdsName,{time = 400, delay = 1000, alpha = 1})
    elseif(tapCount == 41)then
        transition.to(NerdsName,{time = 400, delay = 400, alpha = 0})
        transition.to(MuaviaName,{time = 400, delay = 1000, alpha = 1})
        transition.to(M2,{ alpha = 0, time = 2500} )
        transition.to(M3,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(N1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 42)then
        transition.to(MuaviaName,{time = 400, delay = 400, alpha = 0})
        transition.to(SaifName,{time = 400, delay = 1000, alpha = 1})
        transition.to(N1,{ alpha = 0, time = 2500} )
        transition.to(S1,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(M3,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 43)then
        transition.to(S1,{ alpha = 0, time = 2500} )
        transition.to(N1,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 44)then
        transition.to(SaifName,{time = 400, delay = 400, alpha = 0})
        transition.to(MuaviaName,{time = 400, delay = 1000, alpha = 1})
        transition.to(M3,{time = 1000, delay = 400, alpha = 1} )
        transition.to(N1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 45)then
        transition.to(MuaviaName,{time = 400, delay = 400, alpha = 0})
        transition.to(SaifName,{time = 400, delay = 1000, alpha = 1})
        transition.to(N1,{ alpha = 0, time = 2500} )
        transition.to(S1,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(M3,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 46)then
        transition.to(SaifName,{time = 400, delay = 400, alpha = 0})
        transition.to(MuaviaName,{time = 400, delay = 1000, alpha = 1})
        transition.to(M3,{ alpha = 0, time = 2500} )
        transition.to(M2,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(S1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 47)then
        transition.to(MuaviaName,{time = 400, delay = 400, alpha = 0})
        transition.to(SaifName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S1,{time = 1000, delay = 400, alpha = 1} )
        transition.to(M2,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 48)then
        transition.to(S1,{ alpha = 0, time = 2500} )
        transition.to(N1,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 49)then
        transition.to(SaifName,{time = 400, delay = 400, alpha = 0})
        transition.to(MuaviaName,{time = 400, delay = 1000, alpha = 1})
        transition.to(M2,{time = 1000, delay = 400, alpha = 1} )
        transition.to(N1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 50)then
        transition.to(MuaviaName,{time = 400, delay = 400, alpha = 0})
        transition.to(NerdsName,{time = 400, delay = 1000, alpha = 1})
        transition.to(N1,{time = 1000, delay = 400, alpha = 1} )
        transition.to(M2,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 51)then
        transition.to(NerdsName,{time = 400, delay = 400, alpha = 0})
        transition.to(MuaviaName,{time = 400, delay = 1000, alpha = 1})
        transition.to(M2,{ alpha = 0, time = 2500} )
        transition.to(M5,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(N1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 52)then
        transition.to(M5,{ alpha = 0, time = 2500} )
        transition.to(M3,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 53)then
        transition.to(MuaviaName,{time = 400, delay = 400, alpha = 0})
        transition.to(NerdsName,{time = 400, delay = 1000, alpha = 1})
        transition.to(N1,{time = 1000, delay = 400, alpha = 1} )
        transition.to(M3,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 54)then
        transition.to(N1,{time = 2000, delay = 500, alpha = 0})
        transition.to(NerdsName,{time = 400, delay = 400, alpha = 0})
        transition.to(dialogBox,{time = 400, delay = 400, alpha = 0})
        transition.to(V1,{time = 2000, delay = 2500, alpha = 1})
    elseif(tapCount == 55)then
        transition.to(dialogBox,{alpha = 0.85, time = 400, delay = 1500})
        transition.to(MuaviaName,{time = 400, delay = 1000, alpha = 1})
        transition.to(M3,{ alpha = 0, time = 2500} )
        transition.to(M2,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(V1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 56)then
        transition.to(MuaviaName,{time = 400, delay = 400, alpha = 0})
        transition.to(VivianaName,{time = 400, delay = 1000, alpha = 1})
        transition.to(V1,{time = 1000, delay = 400, alpha = 1} )
        transition.to(M2,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 57)then
        transition.to(VivianaName,{time = 400, delay = 400, alpha = 0})
        transition.to(MuaviaName,{time = 400, delay = 1000, alpha = 1})
        transition.to(M2,{ alpha = 0, time = 2500} )
        transition.to(M6,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(V1,{time = 1000, delay = 400, alpha = 0.75} )
    end 
end

local function bringToFront()
    dialogBox:toFront()
    button:toFront()
    buttonOuter:toFront()
    NerdsName:toFront()
    MuaviaName:toFront()
    SaifName:toFront()
    VivianaName:toFront()
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

     --Scene Background
     background = display.newImageRect( sceneGroup, "Scene16Assets/bg_16.png", 565, 350)
     background.x = display.contentCenterX 
     background.y = display.contentCenterY
     background.alpha = 1
 
     --Scene Location Text
     LocationTextUpper = display.newText( sceneGroup,"Military Research Laboratory", 110, 250, "Scene3Assets/Fox", 14 )
     LocationTextUpper.alpha = 0
     LocationTextLower = display.newText( sceneGroup,"A Few Days Later...", 110, 272, "UI_Elements/Digital-Clock", 16 )
     LocationTextLower.alpha = 0
 
     --Divider PNG Image
     LocationDivider = display.newImageRect( sceneGroup, "Scene3Assets/divider.png", 150, 8)
     LocationDivider.x =  600
     LocationDivider.y =  259
 
     --Dialog Box PNG 
     dialogBox = display.newImageRect( sceneGroup, "Scene3Assets/textbox.png", 550, 100)
     dialogBox.x = display.contentCenterX 
     dialogBox.y = display.contentCenterY + 105
     dialogBox.alpha = 0

     --Nerds Pose
    N1 = display.newImageRect( sceneGroup, objectSheet2, 3, 360, 275 ) 
	N1.x = display.contentCenterX - 100
	N1.y = display.contentCenterY + 20
	N1.myName = "S1"
    N1.alpha = 1

    --Muavia Pose
    M1 = display.newImageRect( sceneGroup, objectSheet, 1, 213, 275 ) --Smile arms up
	M1.x = display.contentCenterX + 180
	M1.y = display.contentCenterY + 20
	M1.myName = "M1"
    M1.alpha = 0

    M2 = display.newImageRect( sceneGroup, objectSheet, 2, 140, 275 ) --Smile
	M2.x = display.contentCenterX + 190
	M2.y = display.contentCenterY + 20
	M2.myName = "M2"
    M2.alpha = 0

    M3 = display.newImageRect( sceneGroup, objectSheet, 3, 140, 275 ) --Unpleasant
	M3.x = display.contentCenterX + 190
	M3.y = display.contentCenterY + 20
	M3.myName = "M3"
    M3.alpha = 0

    M4 = display.newImageRect( sceneGroup, objectSheet, 4, 140, 275 ) --Angry
	M4.x = display.contentCenterX + 190
	M4.y = display.contentCenterY + 20
	M4.myName = "M4"
    M4.alpha = 0

    M5 = display.newImageRect( sceneGroup, objectSheet, 5, 140, 275 ) --Happy arms down
	M5.x = display.contentCenterX + 190
	M5.y = display.contentCenterY + 20
	M5.myName = "M5"
    M5.alpha = 0

    M6 = display.newImageRect( sceneGroup, objectSheet, 6, 213, 275 ) --Happy arms up
	M6.x = display.contentCenterX + 180
	M6.y = display.contentCenterY + 20
	M6.myName = "M6"
    M6.alpha = 0

    --Saif Poses
    S1 = display.newImageRect( sceneGroup, objectSheet2, 2, 130, 285 ) 
	S1.x = display.contentCenterX - 150
	S1.y = display.contentCenterY + 18
	S1.myName = "S1"
    S1.alpha = 0

    V1 = display.newImageRect( sceneGroup, objectSheet2, 1, 130, 285 ) 
	V1.x = display.contentCenterX - 150
	V1.y = display.contentCenterY + 18
	V1.myName = "V1"
    V1.alpha = 0
 
     --Dialogue Strings
     DialogText1 = display.newText(Dialogue.Scene16[start]  , 240, 240, "UI_Elements/OpenSans-Light", 12)
     DialogText1:setFillColor( 0, 0, 0 )
     DialogText1.alpha = 0
     DialogText2 = display.newText(Dialogue.Scene16[mid1]  , 240, 260, "UI_Elements/OpenSans-Light", 12)
     DialogText2:setFillColor( 0, 0, 0 )
     DialogText2.alpha = 0
     DialogText3 = display.newText(Dialogue.Scene16[mid2]  , 240, 280, "UI_Elements/OpenSans-Light", 12)
     DialogText3:setFillColor( 0, 0, 0 )
     DialogText3.alpha = 0
     DialogText4 = display.newText(Dialogue.Scene16[finish]  , 240, 300, "UI_Elements/OpenSans-Light", 12)
     DialogText4:setFillColor( 0, 0, 0 )
     DialogText4.alpha = 0

      --Nerds Name
    NerdsName = display.newText(sceneGroup,"Nerds", 10, 226, "UI_Elements/Ceria-Lebaran", 17)
    NerdsName:setFillColor( 0, 0, 0)
    NerdsName.alpha = 0

    --Saif Name
    SaifName = display.newText(sceneGroup,"Saif", 10, 226, "UI_Elements/Ceria-Lebaran", 17)
    SaifName:setFillColor( 0, 0, 0)
    SaifName.alpha = 0

    --Muavia Name
    MuaviaName = display.newText(sceneGroup,"Muavia", 20, 226, "UI_Elements/Ceria-Lebaran", 17)
    MuaviaName:setFillColor( 0, 0, 0)
    MuaviaName.alpha = 0

    --Viviana Name
    VivianaName = display.newText(sceneGroup,"Viviana", 20, 226, "UI_Elements/Ceria-Lebaran", 17)
    VivianaName:setFillColor( 0, 0, 0)
    VivianaName.alpha = 0

    --Button
    button = display.newImageRect( sceneGroup, "Scene3Assets/blue.png", 20, 20 )
    button.x = display.contentCenterX + 250
    button.y = display.contentCenterY + 120
    button.alpha = 1

    --Button Outer
    buttonOuter = display.newImageRect( sceneGroup, "Scene3Assets/blueOuter.png", 30, 30 )
    buttonOuter.x = display.contentCenterX + 250
    buttonOuter.y = display.contentCenterY + 120
    buttonOuter.alpha = 1

    bringToFront()

    button:addEventListener("tap" , buttonReappear)
    button:addEventListener("tap" , outerRotate)
    button:addEventListener("tap" , dialogFunction)
    button:addEventListener("tap" , CharControl)
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