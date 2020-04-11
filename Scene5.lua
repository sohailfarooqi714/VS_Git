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

-- Configure image sheet
local sheetOptionsKamali =
{
    frames = 
    {
    
        {
            -- K1
            x=1,
            y=1,
            width=417,
            height=500,

        },
        {
            -- K2
            x=1,
            y=503,
            width=417,
            height=500,

        },
        {
            -- K3
            x=420,
            y=1,
            width=417,
            height=500,

        },
        {
            -- K4
            x=420,
            y=503,
            width=417,
            height=500,

        },
        {
            -- K5
            x=839,
            y=1,
            width=417,
            height=500,

        },
        {
            -- K6
            x=839,
            y=503,
            width=417,
            height=500,

        },
        {
            -- K7
            x=1258,
            y=1,
            width=417,
            height=500,

        },
        {
            -- K8
            x=1258,
            y=503,
            width=417,
            height=500,

        },
    },

    sheetContentWidth = 1676,
    sheetContentHeight = 1004
}


local sheetOptionsIsaac =
{
    frames = 
    {
    
        {
            -- I1
            x=1,
            y=1,
            width=406,
            height=500,

        },
        {
            -- I2
            x=409,
            y=1,
            width=406,
            height=500,

        },
        {
            -- I3
            x=817,
            y=1,
            width=406,
            height=500,

        },
    },

    sheetContentWidth = 1224,
    sheetContentHeight = 502
}

local objectSheet = graphics.newImageSheet( "Scene5Assets/KamaliSpriteSheet.png", sheetOptionsKamali )

local objectSheet2 = graphics.newImageSheet( "Scene5Assets/IsaacSpriteSheet.png", sheetOptionsIsaac )

local TapClickSound = audio.loadStream( "Scene3Assets/click1.wav" )
local IsaacFootSteps = audio.loadStream( "Scene6Assets/IsaacFootSteps.mp3" )
local KamaliFootSteps = audio.loadStream( "Scene6Assets/KamaliFootSteps.mp3" )
local HallwayBackgroundNextScene = audio.loadStream( "Scene6Assets/HallwayBackground.mp3" )


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
      transition.to( button,{time = 1 ,alpha = 0} )
     --Button Reappear Transition
      transition.to( button,{time = 1 , delay = 3000 ,alpha = 1} )
end

function outerRotate()
    --Method 2
    transition.to( buttonOuter,{rotation = 360, time = 400} )
    transition.to( buttonOuter,{rotation = 720, time = 400, delay = 800} )
    transition.to( buttonOuter,{rotation = 1080, time = 400, delay = 1600} )
    transition.to( buttonOuter,{rotation = 1440, time = 400, delay = 2400} )
end

local function changeScenes()
    display.remove(nextButton)
    composer.gotoScene("Scene6", {effect="slideLeft", time = 800})
    audio.play(SceneChangeAudio)
end

function ClickSound(event)
    audio.play(TapClickSound)
end

--PLAY HALLWAY AUDIO (SCENE 6)
function PlayNextSceneAudio(event)
    audio.play(HallwayBackgroundNextScene)
    audio.play(IsaacFootSteps)
    audio.play(KamaliFootSteps)
 end

--Function for Location Text And Location Divider Transitions.
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

--Declaring functions for recursive element Time Clock
function clock_glow(event)
    transition.to( Colon,{ time= 1, alpha=0.80, delay = 400,x=Colon.x, y=Colon.y, onComplete=clock_glow_repeat } )
end

function clock_glow_repeat(event)
    transition.to( Colon,{ time= 1, alpha=0, delay = 400,x=Colon.x, y=Colon.y, onComplete=clock_glow } )
end

function dialogFunction(event)
   --Previous Dialogues Disappear
   transition.to(DialogText1,{alpha = 0, time = 400, delay = 400})
   transition.to(DialogText2,{alpha = 0, time = 400, delay = 400})
   transition.to(DialogText3,{alpha = 0, time = 400, delay = 400})
   transition.to(DialogText4,{alpha = 0, time = 400, delay = 400})
     --Dialogue Strings
     DialogText1 = display.newText(Dialogue.Scene5[start]  , 240, 235, "UI_Elements/OpenSans-Light", 12)
     DialogText1:setFillColor( 0, 0, 0 )
     DialogText1.alpha = 0
     DialogText2 = display.newText(Dialogue.Scene5[mid1]  , 240, 255, "UI_Elements/OpenSans-Light", 12)
     DialogText2:setFillColor( 0, 0, 0 )
     DialogText2.alpha = 0
     DialogText3 = display.newText(Dialogue.Scene5[mid2]  , 240, 275, "UI_Elements/OpenSans-Light", 12)
     DialogText3:setFillColor( 0, 0, 0 )
     DialogText3.alpha = 0
     DialogText4 = display.newText(Dialogue.Scene5[finish]  , 240, 295, "UI_Elements/OpenSans-Light", 12)
     DialogText4:setFillColor( 0, 0, 0 )
     DialogText4.alpha = 0
   --New Dialogues Appear
   transition.to(DialogText1,{alpha = 1, time = 800, delay = 1000})
   transition.to(DialogText2,{alpha = 1, time = 800, delay = 1500})
   transition.to(DialogText3,{alpha = 1, time = 800, delay = 2000})
   transition.to(DialogText4,{alpha = 1, time = 800, delay = 2500})
    --Increment values
    start = start + 4
    mid1 = mid1 + 4
    mid2 = mid2 + 4
    finish = finish + 4
end

function CharControl()
    tapCount = tapCount + 1
    print(tapCount)
    if(tapCount == 1) then
        transition.to( KamaliName,{time = 800, delay = 1200, alpha = 1})
        transition.to( dialogBox,{time = 800, delay = 1200, alpha = 1})
        transition.to( K1,{time = 1000, delay = 1000, alpha = 1})
        transition.to( Pie1,{time = 2000, delay = 2000,rotation = 1440})
        transition.to(Pie2,{time = 1, alpha = 0.75})
        transition.to( Pie2,{time = 800, delay = 3500,x =  275, y = 140})
        transition.scaleTo(Pie2,{time = 800, delay = 3500,xScale = 50, yScale = 50})
        transition.to(Pie3,{time = 1, alpha = 0.75})
        transition.to( Pie3,{time = 800, delay = 4500, x =  350, y = 140})
        transition.scaleTo(Pie3,{time = 800, delay = 4500, xScale = 10, yScale = 10})
    elseif(tapCount == 2) then
        transition.to( KamaliName,{time = 600, delay = 400, alpha = 0})
        transition.to( IsaacName,{time = 800, delay = 1200, alpha = 1})
        transition.to( K1,{time = 1000, delay = 1000, alpha = 0.7})
        transition.to( I2,{time = 1000, delay = 1000, alpha = 1})
    elseif(tapCount == 3) then
        transition.to( KamaliName,{time = 800, delay = 1200, alpha = 1})
        transition.to( IsaacName,{time = 600, delay = 400, alpha = 0})
        transition.to( TimeText,{time = 300, alpha = 0})
        transition.to( TimeText1,{time = 300, alpha = 1})
        transition.to( I2,{time = 1000, delay = 1000, alpha = 0.7})
        transition.to( K1,{time = 1000, delay = 1000, alpha = 1})
    elseif(tapCount == 4) then --SAME CHARACTER
        transition.to( IsaacName,{time = 800, delay = 1200, alpha = 1})
        transition.to( KamaliName,{time = 600, delay = 400, alpha = 0})
        transition.to( K1,{time = 1000, delay = 1000, alpha = 0.7})
        transition.to( I1,{time = 1000, delay = 1000, alpha = 0})
        transition.to( I2,{time = 1000, delay = 500, alpha = 1})
    elseif(tapCount == 5) then 
        transition.to( IsaacName,{time = 600, delay = 400, alpha = 0})
        transition.to( KamaliName,{time = 800, delay = 1200, alpha = 1})
        transition.to( I2,{time = 1000, delay = 500, alpha = 0.7})
        transition.to( K1,{time = 1000, delay = 1000, alpha = 0})
        transition.to( K2,{time = 1000, delay = 1000, alpha = 1})
    elseif(tapCount == 6) then 
        transition.to( KamaliName,{time = 600, delay = 400, alpha = 0})
        transition.to( IsaacName,{time = 800, delay = 1200, alpha = 1})
        transition.to( TimeText1,{time = 300, alpha = 0})
        transition.to( TimeText2,{time = 300, alpha = 1})
        transition.to( K2,{time = 1000, delay = 1000, alpha = 0.7})
        transition.to( I2,{time = 1000, delay = 1000, alpha = 1})
    elseif(tapCount == 7) then 
        transition.to( KamaliName,{time = 800, delay = 1200, alpha = 1})
        transition.to( IsaacName,{time = 600, delay = 400, alpha = 0})
        transition.to( I2,{time = 1000, delay = 1000, alpha = 0.7})
        transition.to( K2,{time = 1000, delay = 1000, alpha = 0})
        transition.to( K3,{time = 1000, delay = 1000, alpha = 1})
        transition.to( K3,{time = 2000, delay = 1500, alpha = 0})
        transition.to( K6,{time = 1000, delay = 1600, alpha = 1})
    elseif(tapCount == 9) then 
        transition.to( KamaliName,{time = 600, delay = 400, alpha = 0})
        transition.to( IsaacName,{time = 800, delay = 1200, alpha = 1})
        transition.to( K6,{time = 1000, delay = 1000, alpha = 0.7})
        transition.to( I2,{time = 1000, delay = 1000, alpha = 0})
        transition.to( I3,{time = 1000, delay = 1000, alpha = 1})
    elseif(tapCount == 10) then --SAME CHARACTER
        transition.to( IsaacName,{time = 600, delay = 400, alpha = 0})
        transition.to( KamaliName,{time = 800, delay = 1200, alpha = 1})
        transition.to( TimeText2,{time = 300, alpha = 0})
        transition.to( TimeText3,{time = 300, alpha = 1})
        transition.to( I3,{time = 1000, delay = 1000, alpha = 0.7})
        transition.to( K6,{time = 1000, delay = 1000, alpha = 1})
    elseif(tapCount == 11) then
        transition.to( IsaacName,{time = 800, delay = 1200, alpha = 1})
        transition.to( KamaliName,{time = 600, delay = 400, alpha = 0})
        transition.to( K6,{time = 2000, delay = 1500, alpha = 0.7})
        transition.to( I3,{time = 1000, delay = 1000, alpha = 0})
        transition.to( I2,{time = 1000, delay = 1000, alpha = 1})
     elseif(tapCount == 12) then 
        transition.to( KamaliName,{time = 800, delay = 1200, alpha = 1})
        transition.to( IsaacName,{time = 600, delay = 400, alpha = 0})
        transition.to( I2,{time = 1000, delay = 1000, alpha = 0.7})
        transition.to( K6,{time = 2000, delay = 1000, alpha = 0})
        transition.to( K5,{time = 2000, delay = 1000, alpha = 1})
    elseif(tapCount == 13) then
        transition.to( KamaliName,{time = 600, delay = 400, alpha = 0})
        transition.to( IsaacName,{time = 800, delay = 1200, alpha = 1})
        transition.to( TimeText3,{time = 300, alpha = 0})
        transition.to( TimeText4,{time = 300, alpha = 1})
        transition.to( K5,{time = 2000, delay = 1000, alpha = 0.7})
        transition.to( I2,{time = 1000, delay = 1000, alpha = 0})
        transition.to( I1,{time = 1000, delay = 1000, alpha = 1})
    elseif(tapCount == 14) then -- SAME CHARACTER
        transition.to( I1,{time = 1000, delay = 1000, alpha = 0})
        transition.to( K5,{time = 2000, delay = 1000, alpha = 1})
        transition.to( K5,{time = 2000, delay = 1500, alpha = 0})
        transition.to( K3,{time = 1000, delay = 1600, alpha = 1})
        transition.to( K3,{time = 2000, delay = 2100, alpha = 0})
        transition.to( K8,{time = 1000, delay = 2200, alpha = 1})
        transition.to(dialogBox,{time = 600, delay = 400, alpha = 0})
        transition.to( IsaacName,{time = 600, delay = 400, alpha = 0})
        display.remove(button)
        display.remove(buttonOuter)
        transition.to( nextButton,{time = 400 , delay = 2000 ,alpha = 1} )
    end
end

function bringToFront()
    dialogBox:toFront()
    button:toFront()
    buttonOuter:toFront()
    nextButton:toFront()
    Pie1:toFront()
end
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    --Scene Background
    background = display.newImageRect( sceneGroup, "Scene5Assets/5_bg.png", 565, 350)
    background.x = display.contentCenterX 
    background.y = display.contentCenterY
    background.alpha = 0
    
    --Dialog Box PNG 
    dialogBox = display.newImageRect( sceneGroup, "Scene3Assets/textbox.png", 530, 120)
    dialogBox.x = display.contentCenterX 
    dialogBox.y = display.contentCenterY + 98
    dialogBox.alpha = 0

    --Dialogue Strings
    DialogText1 = display.newText( sceneGroup, Dialogue.Scene5[start]  , 240, 235, "UI_Elements/OpenSans-Light", 12)
    DialogText1:setFillColor( 0, 0, 0 )
    DialogText1.alpha = 0
    DialogText2 = display.newText( sceneGroup, Dialogue.Scene5[mid1]  , 240, 255, "UI_Elements/OpenSans-Light", 12)
    DialogText2:setFillColor( 0, 0, 0 )
    DialogText2.alpha = 0
    DialogText3 = display.newText( sceneGroup, Dialogue.Scene5[mid2]  , 240, 275, "UI_Elements/OpenSans-Light", 12)
    DialogText3:setFillColor( 0, 0, 0 )
    DialogText3.alpha = 0
    DialogText4 = display.newText( sceneGroup, Dialogue.Scene5[finish]  , 240, 295, "UI_Elements/OpenSans-Light", 12)
    DialogText4:setFillColor( 0, 0, 0 )
    DialogText4.alpha = 0
    
    --Button
    button = display.newImageRect( sceneGroup, "Scene3Assets/blue.png", 20, 20 )
    button.x = display.contentCenterX + 250
    button.y = display.contentCenterY + 100
    button.alpha = 0

    --Button Outer
    buttonOuter = display.newImageRect( sceneGroup, "Scene3Assets/blueOuter.png", 30, 30 )
    buttonOuter.x = display.contentCenterX + 250
    buttonOuter.y = display.contentCenterY + 100
    buttonOuter.alpha = 0

    --Next Button
    nextButton = display.newImageRect( sceneGroup, "Scene3Assets/skipScene.png", 30, 30 )
    nextButton.x = display.contentCenterX + 250
    nextButton.y = display.contentCenterY + 120
    nextButton.alpha = 0

    IsaacName = display.newText("Isaac", 25, 230, "UI_Elements/Ceria-Lebaran", 20)
    IsaacName:setFillColor(0,0,0)
    IsaacName.alpha = 0

    KamaliName = display.newText("Kamali", 25, 230, "UI_Elements/Ceria-Lebaran", 20)
    KamaliName:setFillColor(0,0,0)
    KamaliName.alpha = 0

    TimeText = display.newText(sceneGroup,"9 02", 112, 80, "UI_Elements/Digital-Clock", 14)
    TimeText:setFillColor(1,0,0)
    TimeText.rotation = 12
    TimeText.alpha = 0

    TimeText1 = display.newText(sceneGroup,"9 05", 112, 80, "UI_Elements/Digital-Clock", 14)
    TimeText1:setFillColor(1,0,0)
    TimeText1.rotation = 12
    TimeText1.alpha = 0

    TimeText2 = display.newText(sceneGroup,"9 09", 112, 80, "UI_Elements/Digital-Clock", 14)
    TimeText2:setFillColor(1,0,0)
    TimeText2.rotation = 12
    TimeText2.alpha = 0

    TimeText3 = display.newText(sceneGroup,"9 14", 112, 80, "UI_Elements/Digital-Clock", 14)
    TimeText3:setFillColor(1,0,0)
    TimeText3.rotation = 12
    TimeText3.alpha = 0

    TimeText4 = display.newText(sceneGroup,"9 20", 112, 80, "UI_Elements/Digital-Clock", 14)
    TimeText4:setFillColor(1,0,0)
    TimeText4.rotation = 12
    TimeText4.alpha = 0

    Colon = display.newText(sceneGroup,":", 109, 80, "UI_Elements/Digital-Clock", 23)
    Colon:setFillColor(1,0,0)
    Colon.rotation = 12
    Colon.alpha = 0

    --Pie chart 1
    Pie1 = display.newImageRect( sceneGroup, "Scene5Assets/pie1.png", 10, 10 )
    Pie1.x = display.contentCenterX - 5
    Pie1.y = display.contentCenterY - 50
    Pie1.alpha = 0

    --Pie chart 2
    Pie2 = display.newImageRect( sceneGroup, "Scene5Assets/pie2.png", 1, 1 )
    Pie2.x = display.contentCenterX - 5
    Pie2.y = display.contentCenterY - 50
    Pie2.alpha = 0

    --Pie chart 3
    Pie3 = display.newImageRect( sceneGroup, "Scene5Assets/pie3.jpg", 5, 5 )
    Pie3.x = display.contentCenterX - 5
    Pie3.y = display.contentCenterY - 50
    Pie3.alpha = 0

    --Scene Location Text
    LocationTextUpper = display.newText( sceneGroup,"Briefing Room - Military Headquarters", 135, 250, "Scene3Assets/Fox", 12)
    LocationTextUpper.alpha = 0
    LocationTextLower = display.newText( sceneGroup,"9:02 AM", 110, 272,"UI_Elements/Digital-Clock", 16 )
    LocationTextLower.alpha = 0

    --Divider PNG Image
    LocationDivider = display.newImageRect( sceneGroup, "Scene3Assets/divider.png", 150, 8)
    LocationDivider.x =  600
    LocationDivider.y =  259

    --Kamali Poses
    K1 = display.newImageRect( sceneGroup, objectSheet, 1, 200, 250 )
	K1.x = display.contentCenterX + 180
	K1.y = display.contentCenterY + 40
	K1.myName = "K1"
	K1.alpha = 0

	K2 = display.newImageRect( sceneGroup, objectSheet, 2, 200, 250 )
	K2.x = display.contentCenterX + 180
	K2.y = display.contentCenterY + 40
	K2.myName = "K2"
	K2.alpha = 0

	K3 = display.newImageRect( sceneGroup, objectSheet, 3, 200, 250 )
	K3.x = display.contentCenterX + 180
	K3.y = display.contentCenterY + 40
	K3.myName = "K3"
    K3.alpha = 0
    
    K4 = display.newImageRect( sceneGroup, objectSheet, 4, 200, 250 )
	K4.x = display.contentCenterX + 180
	K4.y = display.contentCenterY + 40
	K4.myName = "K4"
    K4.alpha = 0
    
    K5 = display.newImageRect( sceneGroup, objectSheet, 5, 200, 250 )
	K5.x = display.contentCenterX + 180
	K5.y = display.contentCenterY + 40
	K5.myName = "K5"
    K5.alpha = 0
    
    K6 = display.newImageRect( sceneGroup, objectSheet, 6, 200, 250 )
	K6.x = display.contentCenterX + 180
	K6.y = display.contentCenterY + 40
	K6.myName = "K6"
    K6.alpha = 0
    
    K7 = display.newImageRect( sceneGroup, objectSheet, 7, 200, 250 )
	K7.x = display.contentCenterX + 180
	K7.y = display.contentCenterY + 40
	K7.myName = "K7"
    K7.alpha = 0
    
    K8 = display.newImageRect( sceneGroup, objectSheet, 8, 200, 250 )
	K8.x = display.contentCenterX + 180
	K8.y = display.contentCenterY + 40
	K8.myName = "K8"
    K8.alpha = 0

    --Isaac Poses
    I1 = display.newImageRect( sceneGroup, objectSheet2, 1, 200, 250 )
	I1.x = display.contentCenterX - 180
	I1.y = display.contentCenterY + 40
	I1.myName = "I1"
	I1.alpha = 0

	I2 = display.newImageRect( sceneGroup, objectSheet2, 2, 200, 250 )
	I2.x = display.contentCenterX - 180
	I2.y = display.contentCenterY + 40
	I2.myName = "I2"
	I2.alpha = 0

	I3 = display.newImageRect( sceneGroup, objectSheet2, 3, 200, 250 )
	I3.x = display.contentCenterX - 180
	I3.y = display.contentCenterY + 40
	I3.myName = "I3"
    I3.alpha = 0

    bringToFront()

    --Location Text Appears Function Call
    LocationTextAppear()

    timer.performWithDelay(6000, clock_glow)

    transition.to( Pie1,{ time = 10000, delay = 3500, alpha = 0.75})

    --Transition to timetext
    transition.to( TimeText,{ time = 10000, delay = 3500 ,alpha = 1} )

    --Transitiion background into the scene
    transition.to( background,{ time = 10000, delay = 3500 ,alpha = 1} )

    --Button Appears
    timer.performWithDelay(7000, buttonReappear)
    transition.to( buttonOuter,{ time = 1, delay = 10000 ,alpha = 1} )

    button:addEventListener( "tap", buttonReappear)
    button:addEventListener( "tap", dialogFunction )
    button:addEventListener( "tap", ClickSound)
    button:addEventListener( "tap", CharControl)
    button:addEventListener( "tap", outerRotate)

    nextButton:addEventListener( "tap", changeScenes )
    nextButton:addEventListener( "tap", PlayNextSceneAudio )
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
    display.remove(objectSheet)
    display.remove(objectSheet2)
    display.remove(TimeText)
    display.remove(TimeText1)
    display.remove(TimeText2)
    display.remove(TimeText3)
    display.remove(TimeText4)
    display.remove(DialogText1)
    display.remove(DialogText2)
    display.remove(DialogText3)
    display.remove(DialogText4)
    display.remove(dialogBox)
    display.remove(Pie1)
    display.remove(Pie2)
    display.remove(Pie3)
    display.remove(background)
    display.remove(button)
    display.remove(nextButton)
    display.remove(LocationDivider)
    display.remove(LocationTextUpper)
    display.remove(LocationTextLower)
    display.remove(Colon)
    display.remove(IsaacName)
    display.remove(KamaliName)
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