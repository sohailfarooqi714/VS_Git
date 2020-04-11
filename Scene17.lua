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
    
    
    frames = {
    
        {
            -- 1
            x=1,
            y=1,
            width=555,
            height=650,

        },
        {
            -- 2
            x=1,
            y=653,
            width=554,
            height=650,

        },
        {
            -- 3
            x=1,
            y=1305,
            width=554,
            height=650,

        },
        {
            -- 4
            x=557,
            y=653,
            width=554,
            height=650,

        },
        {
            -- 5
            x=558,
            y=1,
            width=554,
            height=650,

        },
        {
            -- 6
            x=557,
            y=1305,
            width=554,
            height=650,

        },
        {
            -- 7
            x=1114,
            y=1,
            width=554,
            height=650,

        },
        {
            -- 8
            x=1113,
            y=653,
            width=554,
            height=650,

        },
        {
            -- 9
            x=1113,
            y=1305,
            width=554,
            height=650,

        },
    },

    sheetContentWidth = 1669,
    sheetContentHeight = 1956
}

--Conigure Image Sheet
local sheetOptionsKamali =
{
    
    frames = {
    
        {
            -- 1
            x=1,
            y=1,
            width=491,
            height=1000,

        },
        {
            -- 2
            x=1,
            y=1003,
            width=491,
            height=1000,

        },
    },

    sheetContentWidth = 493,
    sheetContentHeight = 2004
}
---------------------------------------------------------------------------------------------------------------
local text = {letters="Accessing Remote System PRJVENUS@Shui_PC \n\n Run sound_recorder.rb script . . . . . . Complete. \n\n System Microphone Accessible. \n\n Run webcam -p /var/www . . . . . . Complete. \n\n System Camera Accessible.", index = 1} --FOR MAIN FRAME 

local MainframeTextBox = display.newText("", 0, 0,"UI_Elements/Digital-System",15) -- FOR MAINFRAME EFFECT
MainframeTextBox.x = display.contentCenterX + 20
MainframeTextBox.y = display.contentCenterY
MainframeTextBox:setFillColor(0,1,0)
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
local objectSheet = graphics.newImageSheet( "Scene17Assets/SarahSpriteSheet.png", sheetOptionsSarah )

local objectSheet2 = graphics.newImageSheet( "Scene17Assets/KamaliSpriteSheet.png", sheetOptionsKamali )
 
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
    timer.performWithDelay(25, mainframeText, string.len(text.letters))
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
      DialogText1 = display.newText(Dialogue.Scene17[start]  , 240, 240, "UI_Elements/OpenSans-Light", 12)
      DialogText1:setFillColor( 0, 0, 0 )
      DialogText1.alpha = 0
      DialogText2 = display.newText(Dialogue.Scene17[mid1]  , 240, 260, "UI_Elements/OpenSans-Light", 12)
      DialogText2:setFillColor( 0, 0, 0 )
      DialogText2.alpha = 0
      DialogText3 = display.newText(Dialogue.Scene17[mid2]  , 240, 280, "UI_Elements/OpenSans-Light", 12)
      DialogText3:setFillColor( 0, 0, 0 )
      DialogText3.alpha = 0
      DialogText4 = display.newText(Dialogue.Scene17[finish]  , 240, 300, "UI_Elements/OpenSans-Light", 12)
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
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1500})
        transition.to(K2,{ alpha = 0, time = 2500} )
        transition.to(K1,{ alpha = 1, time = 800} )
        transition.to(S9,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 2)then
        transition.to(KamaliName,{time = 400, delay = 400, alpha = 0})
        transition.to(SarahName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S9,{ alpha = 0, time = 2500} )
        transition.to(S2,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(K1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 3)then
        transition.to(SarahName,{time = 400, delay = 400, alpha = 0})
        transition.to(KamaliName,{time = 400, delay = 1000, alpha = 1})
        transition.to(K1,{time = 1000, delay = 400, alpha = 1} )
        transition.to(S2,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 4)then
        transition.to(KamaliName,{time = 400, delay = 400, alpha = 0})
        transition.to(SarahName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S2,{ alpha = 0, time = 2500} )
        transition.to(S7,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(K1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 5)then
        transition.to(SarahName,{time = 400, delay = 400, alpha = 0})
        transition.to(KamaliName,{time = 400, delay = 1000, alpha = 1})
        transition.to(K1,{time = 1000, delay = 400, alpha = 1} )
        transition.to(S7,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 6)then
        transition.to(KamaliName,{time = 400, delay = 400, alpha = 0})
        transition.to(SarahName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S7,{ alpha = 0, time = 2500} )
        transition.to(S2,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(K1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 8)then
        transition.to(SarahName,{time = 400, delay = 400, alpha = 0})
        transition.to(KamaliName,{time = 400, delay = 1000, alpha = 1})
        transition.to(K1,{time = 1000, delay = 400, alpha = 1} )
        transition.to(S2,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 9)then
        transition.to(KamaliName,{time = 400, delay = 400, alpha = 0})
        transition.to(SarahName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S2,{ alpha = 0, time = 2500} )
        transition.to(S7,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(K1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 10)then
        transition.to(SarahName,{time = 400, delay = 400, alpha = 0})
        transition.to(KamaliName,{time = 400, delay = 1000, alpha = 1})
        transition.to(K1,{time = 1000, delay = 400, alpha = 1} )
        transition.to(S7,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 11)then
        transition.to(KamaliName,{time = 400, delay = 400, alpha = 0})
        transition.to(SarahName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S7,{time = 1000, delay = 400, alpha = 1} )
        transition.to(K1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 12)then
        transition.to(S7,{ alpha = 0, time = 2500} )
        transition.to(S2,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 13)then
        transition.to(SarahName,{time = 400, delay = 400, alpha = 0})
        transition.to(KamaliName,{time = 400, delay = 1000, alpha = 1})
        transition.to(K1,{ alpha = 0, time = 2500} )
        transition.to(K2,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(S2,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 14)then                          -------Kamali Leaves the Scene
        transition.to(KamaliName,{time = 400, delay = 400, alpha = 0})
        transition.to(SarahName,{time = 400, delay = 1000, alpha = 1})
        transition.to(K2,{ alpha = 0, time = 2000} )
        transition.to(S2,{time = 1000, delay = 400, alpha = 1} )
    elseif(tapCount == 15)then
        transition.to(S2,{ alpha = 0, time = 2500} )
        transition.to(S6,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 16)then
        transition.to(dialogBox,{time = 400, delay = 1000, alpha = 0})
        transition.to(SarahName,{time = 400, delay = 1000 ,alpha = 0})
        transition.to(background,{time = 1000, alpha = 0.75})
        transition.to(S6,{time = 1000, delay = 400, alpha = 0.75} )
        displayMainFrame()
    elseif(tapCount == 17)then
        transition.to(MainframeTextBox,{time = 400, delay = 1000, alpha = 0})
        transition.to(dialogBox,{alpha = 0.85, time = 400, delay = 1500})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1500})
        transition.to(S6,{ alpha = 0, time = 2500} )
        transition.to(S4,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 20)then
        transition.to(SarahName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S4,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 21)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(SarahName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S4,{ alpha = 0, time = 1000} )
        transition.to(S3,{ alpha = 1, time = 1000, delay = 500} )
        transition.to(S3,{ alpha = 0, time = 1500, delay = 1500} )
        transition.to(S5,{ alpha = 1, time = 1000 , delay = 2500} )
    elseif(tapCount == 23)then
        transition.to(SarahName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S5,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 26)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(SarahName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S5,{ alpha = 0, time = 2500} )
        transition.to(S6,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 27)then
        transition.to(SarahName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S6,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 28)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(SarahName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S6,{ alpha = 0, time = 2500} )
        transition.to(S9,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 29)then
        transition.to(SarahName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S9,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 33)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(SarahName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S9,{ alpha = 0, time = 2500} )
        transition.to(S4,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 36)then
        transition.to(SarahName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S4,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 38)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(SarahName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S4,{time = 1000, delay = 400, alpha = 1} )
    elseif(tapCount == 39)then
        transition.to(SarahName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S4,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 40)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(SarahName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S4,{time = 1000, delay = 400, alpha = 1} )
    elseif(tapCount == 41)then
        transition.to(SarahName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S4,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 42)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(SarahName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S4,{time = 1000, delay = 400, alpha = 1} )
    elseif(tapCount == 43)then
        transition.to(SarahName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S4,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 44)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(SarahName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S4,{ alpha = 0, time = 2500} )
        transition.to(S1,{ alpha = 1, time = 2000, delay = 500} )    
    elseif(tapCount == 46)then
        transition.to(SarahName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 47)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(SarahName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S1,{time = 1000, delay = 400, alpha = 1} )
    elseif(tapCount == 48)then
        transition.to(SarahName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 50)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(SarahName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S1,{ alpha = 0, time = 2500} )
        transition.to(S4,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 52)then
        transition.to(SarahName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S4,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 55)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(SarahName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S4,{time = 1000, delay = 400, alpha = 1} )
    elseif(tapCount == 56)then
        transition.to(S4,{ alpha = 0, time = 2500} )
        transition.to(S8,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 59)then
        transition.to(SarahName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S8,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 60)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(SarahName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S8,{time = 1000, delay = 400, alpha = 1} )
    elseif(tapCount == 61)then
        transition.to(SarahName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S8,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 62)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(SarahName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S8,{ alpha = 0, time = 2500} )
        transition.to(S5,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 63)then
        transition.to(S5,{ alpha = 0, time = 2500} )
        transition.to(S6,{ alpha = 1, time = 2000, delay = 500} )
    end     
end

local function bringToFront()
    dialogBox:toFront()
    button:toFront()
    buttonOuter:toFront()
    SarahName:toFront()
    KamaliName:toFront()
    VenusName:toFront()
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

     --Scene Background
     background = display.newImageRect( sceneGroup, "Scene17Assets/bg_17.png", 565, 350)
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

     --Kamali Name
    KamaliName = display.newText(sceneGroup,"Kamali", 15, 238, "UI_Elements/Ceria-Lebaran", 20)
    KamaliName.alpha = 0
    KamaliName:setFillColor( 0, 0, 0)
    --Sarah Name
    SarahName = display.newText(sceneGroup,"Sarah", 15, 238, "UI_Elements/Ceria-Lebaran", 20)
    SarahName.alpha = 0
    SarahName:setFillColor( 0, 0, 0) 
    --Venus Name
    VenusName = display.newText(sceneGroup,"Venus", 20, 235, "UI_Elements/Ceria-Lebaran", 20)
    VenusName:setFillColor( 0, 0, 0)
    VenusName.alpha = 0

     --Kamali Pose
    K1 = display.newImageRect( sceneGroup, objectSheet2, 1, 150, 305 ) --Smile
	K1.x = display.contentCenterX - 180
	K1.y = display.contentCenterY + 20
	K1.myName = "K1"
    K1.alpha = 0

    K2 = display.newImageRect( sceneGroup, objectSheet2, 2, 150, 305 ) --Serious
	K2.x = display.contentCenterX - 180
	K2.y = display.contentCenterY + 20
	K2.myName = "K2"
    K2.alpha = 1

    --Sarah Poses
    S1 = display.newImageRect( sceneGroup, objectSheet, 1, 210, 260 )
	S1.x = display.contentCenterX + 130
	S1.y = display.contentCenterY + 30
	S1.myName = "S1"
	S1.alpha = 0

	S2 = display.newImageRect( sceneGroup, objectSheet, 2, 210, 260 ) --smart face
	S2.x = display.contentCenterX + 130
	S2.y = display.contentCenterY + 30
	S2.myName = "S2"
    S2.alpha = 0
    
    S3 = display.newImageRect( sceneGroup, objectSheet, 3, 210, 260 )
	S3.x = display.contentCenterX + 130
	S3.y = display.contentCenterY + 30
	S3.myName = "S2"
    S3.alpha = 0
    
    S4 = display.newImageRect( sceneGroup, objectSheet, 4, 210, 260 )
	S4.x = display.contentCenterX + 130
	S4.y = display.contentCenterY + 30
	S4.myName = "S4"
    S4.alpha = 0
    
    S5 = display.newImageRect( sceneGroup, objectSheet, 5, 210, 260 )
	S5.x = display.contentCenterX + 130
	S5.y = display.contentCenterY + 30
	S5.myName = "S5"
    S5.alpha = 0
    
    S6 = display.newImageRect( sceneGroup, objectSheet, 6, 210, 260 )
	S6.x = display.contentCenterX + 130
	S6.y = display.contentCenterY + 30
	S6.myName = "S6"
    S6.alpha = 0
    
    S7 = display.newImageRect( sceneGroup, objectSheet, 7, 210, 260 )
	S7.x = display.contentCenterX + 130
	S7.y = display.contentCenterY + 30
	S7.myName = "S7"
    S7.alpha = 0
    
    S8 = display.newImageRect( sceneGroup, objectSheet, 8, 210, 260 )
	S8.x = display.contentCenterX + 130
	S8.y = display.contentCenterY + 30
	S8.myName = "S8"
    S8.alpha = 0
    
    S9 = display.newImageRect( sceneGroup, objectSheet, 9, 210, 260 ) -- default pose/face
	S9.x = display.contentCenterX + 130
	S9.y = display.contentCenterY + 30
	S9.myName = "S9"
	S9.alpha = 1
 
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