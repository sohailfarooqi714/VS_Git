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
local sheetOptionsVenus =
{
    frames = 
    {
    
        {
            -- V1
            x=1,
            y=1573,
            width=528,
            height=378,

            sourceX = 19,
            sourceY = 22,
            sourceWidth = 614,
            sourceHeight = 400
        },
        {
            -- V2
            x=1,
            y=1,
            width=549,
            height=842,

            sourceX = 87,
            sourceY = 58,
            sourceWidth = 655,
            sourceHeight = 900
        },
        {
            -- V3
            x=1,
            y=845,
            width=421,
            height=726,

            sourceX = 82,
            sourceY = 74,
            sourceWidth = 581,
            sourceHeight = 800
        },
    },

    sheetContentWidth = 551,
    sheetContentHeight = 1952
}

-- MAIN FRAME EFFECT TEXT--------------------------------------------------------------------------------------  
---------------------------------------------------------------------------------------------------------------
local text = {letters="Boot sequence finalized . . . \n\nA.I. configuration validated . . .\n\nLoading Language Pack V7 SP1\n\nInitializing . . . ", index = 1} --FOR MAIN FRAME EFFECT
local text1 = {letters1= "Configuration Updated....", index1 = 1}
--Mainframe text holder for "Start up Mainframe text"
local MainframeTextBox = display.newText("", 0, 0, "UI_Elements/Digital-System", 17) -- FOR MAINFRAME EFFECT
MainframeTextBox.x = display.contentCenterX + 20
MainframeTextBox.y = display.contentCenterY - 20
MainframeTextBox.alpha = 1
MainframeTextBox:setFillColor(0 , 1, 0.5)
--Mainframe text holder for "Configuration Updated"
local MainframeTextBox1 = display.newText("", 0, 0, "UI_Elements/Digital-System", 20) -- FOR MAINFRAME1 EFFECT
MainframeTextBox1.x = display.contentCenterX + 20
MainframeTextBox1.y = display.contentCenterY - 20
MainframeTextBox1.alpha = 1
MainframeTextBox1:setFillColor(0 , 1, 0.5)
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

local objectSheet = graphics.newImageSheet( "Scene1Assets/VenusSpriteSheet.png", sheetOptionsVenus )

local BackgroundMusic = audio.loadStream( "Scene1Assets/VenusMusic.mp3" ) 
local TapClickSound = audio.loadStream( "Scene3Assets/click1.wav" )

local dataTable = {}
 
local filePath = system.pathForFile( "dialog1.json", system.ResourceDirectory ) 	--Specify path of interaction

local contents

local Scene1

local dialogBox, button, background

local BackGroundMusicChannel

local DialogText1, DialogText2, DialogText3

local tapCount = 0

local start = 1
local mid = 2
local finish = 3
 
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

local function mainframeText1()
    local d = string.sub(text1.letters1, 1, text1.index1)
    MainframeTextBox1.text = d
    text1.index1 = text1.index1 + 1
end

local function DisplayMainFrame()
    timer.performWithDelay(50, mainframeText, string.len(text.letters))
        transition.to(FinalDot,{time = 500, delay = 7000, alpha = 0})
        transition.to(FinalDot,{time = 500, delay = 7500, alpha = 1})
        transition.to(FinalDot,{time = 500, delay = 8000, alpha = 0})
        transition.to(FinalDot,{time = 500, delay = 8500, alpha = 1})
        transition.to(FinalDot,{time = 500, delay = 9000, alpha = 0})
        transition.to(FinalDot,{time = 500, delay = 9500, alpha = 1})
        transition.to(FinalDot,{time = 500, delay = 10000, alpha = 0})
        transition.to(FinalDot,{time = 500, delay = 10500, alpha = 1}) 
end

local function DisplayMainFrame1()
    timer.performWithDelay(50, mainframeText1, string.len(text1.letters1))
        transition.to(MainframeTextBox1,{time = 1000, delay = 1800, alpha = 0})
        transition.to(MainframeTextBox1,{time = 1000, delay = 2800, alpha = 1})
        transition.to(MainframeTextBox1,{time = 1000, delay = 3800, alpha = 0})
        transition.to(MainframeTextBox1,{time = 1000, delay = 4800, alpha = 1})        
end

local function buttonReappear()
	--Button Disappear Transition
      transition.to( button,{time = 1 , alpha = 0} )
     --Button Reappear Transition
      transition.to( button,{time = 1 , delay = 3500 , alpha = 0.8} )
end

function outerRotate()
    --Method 2
    transition.to( buttonOuter,{rotation = 360, time = 400} )
    transition.to( buttonOuter,{rotation = 720, time = 400, delay = 800} )
    transition.to( buttonOuter,{rotation = 1080, time = 400, delay = 1600} )
    transition.to( buttonOuter,{rotation = 1440, time = 400, delay = 2400} )
end

function ClickSound(event)
    audio.play(TapClickSound)
end

function PlayBackgroundSound(event)
    BackGroundMusicChannel = audio.play(BackgroundMusic, { channel=1, loops=-1} )
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

function cameraMove()
    transition.to( orb,{ x = 140 ,time = 30000})
    transition.to( orb,{ y = 250 ,time = 12000, delay = 14000})
    transition.to( background,{ x = 280, y = 150 ,time = 30000})
    transition.to( background,{ x = 270, y = 180 ,time = 12000, delay = 14000, onComplete=cameraMove_repeat })
end

function cameraMove_repeat()
    transition.to( orb,{ x = 100 ,y = 220 ,time = 12000})
    transition.to( background,{ x = 240, y = 150 ,time = 12000})
    transition.to( background,{ x = 245, y = 145 ,time = 6000, delay = 12000, onComplete=cameraMove})
end

function orb_glow(event)
    transition.to( orb,{ time=1500, alpha=0.65, onComplete=orb_glow_repeat } )
end

function orb_glow_repeat(event)
    transition.to( orb,{ time=1500, alpha=0, onComplete=orb_glow } )
end

function dialogFunction(event)
    --Previous Dialogues Disappear
    transition.to(DialogText1,{alpha = 0, time = 400})
    transition.to(DialogText2,{alpha = 0, time = 400})
    transition.to(DialogText3,{alpha = 0, time = 400})
      --Dialogue Strings
      DialogText1 = display.newText( Dialogue.Scene1[start]  , 240, 255, "UI_Elements/OpenSans-Light", 12)
      DialogText1:setFillColor( 0, 0, 0 )
      DialogText1.alpha = 0
  
      DialogText2 = display.newText( Dialogue.Scene1[mid]  , 240, 275, "UI_Elements/OpenSans-Light", 12)
      DialogText2:setFillColor( 0, 0, 0 )
      DialogText2.alpha = 0
  
      DialogText3 = display.newText( Dialogue.Scene1[finish]  , 240, 295, "UI_Elements/OpenSans-Light", 12)
      DialogText3:setFillColor( 0, 0, 0 )
      DialogText3.alpha = 0
    --New Dialogues Appear
    transition.to(DialogText1,{alpha = 0.90, time = 800, delay = 1000})
    transition.to(DialogText2,{alpha = 0.90, time = 800, delay = 2000})
    transition.to(DialogText3,{alpha = 0.90, time = 800, delay = 3000})
    --Dialogue Box Appears
    transition.to(dialogBox,{alpha = 0.90, time = 800, delay = 1000})
     --Increment values
     start = start + 3
     mid = mid + 3
     finish = finish + 3
end

function CharControl()
    tapCount = tapCount + 1
    print(tapCount)
    if(tapCount == 1)then
        transition.to(background,{alpha = 1 , time = 4000})
        transition.to(MainframeTextBox,{alpha = 0, time = 800, delay = 400})
        transition.to(FinalDot,{alpha = 0, time = 800, delay = 400})
        transition.to(UnknownName,{alpha = 1, time = 800, delay = 2000})
    elseif(tapCount == 2) then
        transition.to(V1,{time = 3000, delay = 3500, alpha = 1})
        transition.to(UnknownName,{alpha = 0, time = 800, delay = 4500})
        transition.to(VenusName,{alpha = 1, time = 800, delay = 5500})
    elseif(tapCount == 5) then
        transition.to(V1,{time = 3000, alpha = 0})
        transition.to(V2,{alpha = 1, time = 3000, delay = 3500})
    elseif(tapCount == 7) then
        transition.to(V2,{time = 3000, alpha = 0})
        transition.to(dialogBox,{time = 3000, alpha = 0})
        transition.to(VenusName,{time = 3000, alpha = 0})
        transition.to(background,{time = 5000, alpha = 0})
        timer.performWithDelay(5500, DisplayMainFrame1)
        display.remove(button)
        display.remove(buttonOuter)
        display.remove(orb)
        transition.to( nextButton,{time = 1 , delay = 12000 , alpha = 0.8} )
    end
end

function bringToFront()
    dialogBox:toFront()
    VenusName:toFront()
    UnknownName:toFront()
    button:toFront()
    buttonOuter:toFront()
end

local function changeScenes()
    composer.gotoScene("Scene1B", {effect="fade", time = 500})
    transition.to(MainframeTextBox1,{time = 1000, alpha = 0})
    ClickSound()
end
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

     --Scene Background
    background = display.newImageRect( sceneGroup, "Scene1Assets/1A_bg.jpg", 640, 400)
    background.x = display.contentCenterX 
    background.y = display.contentCenterY
    background.alpha = 0

    --Scene Location Text
    LocationTextUpper = display.newText( sceneGroup,"SIA-CPIC Industries Shenzhen, China", 146, 250, "Scene3Assets/Fox", 12 )
    LocationTextUpper.alpha = 0
    LocationTextLower = display.newText( sceneGroup,"04:57 AM", 120, 272, "UI_Elements/Digital-Clock", 16 )
    LocationTextLower.alpha = 0

    --Divider PNG Image
    LocationDivider = display.newImageRect( sceneGroup, "Scene3Assets/divider.png", 150, 8)
    LocationDivider.x =  600
    LocationDivider.y =  259

    --Final Dot
    FinalDot = display.newText( sceneGroup,"_", 274, 200, "UI_Elements/Digital-System", 22)
    FinalDot.alpha = 0
    FinalDot:setFillColor(0, 1, 0.5)

    --Blue Orb Effect
    orb = display.newImageRect( sceneGroup, "Scene1Assets/orb.png", 60, 60 )
    orb.x = display.contentCenterX - 140
    orb.y = display.contentCenterY + 72
    orb.alpha = 0

    --Venus Name
    VenusName = display.newText(sceneGroup,"Venus", 40, 240, "UI_Elements/Ceria-Lebaran", 20)
    VenusName.alpha = 0
    VenusName:setFillColor( 0, 0, 0)
    UnknownName = display.newText(sceneGroup,"???", 40, 240, "UI_Elements/Ceria-Lebaran", 20)
    UnknownName.alpha = 0
    UnknownName:setFillColor( 0, 0, 0)

    --Dialog Box PNG 
    dialogBox = display.newImageRect( sceneGroup, "Scene3Assets/textbox.png", 500, 110)
    dialogBox.x = display.contentCenterX 
    dialogBox.y = display.contentCenterY + 100
    dialogBox.alpha = 0

    --Dialogue Strings
    DialogText1 = display.newText( Dialogue.Scene1[start]  , 240, 255, "UI_Elements/OpenSans-Light", 12)
    DialogText1:setFillColor( 0, 0, 0 )
    DialogText1.alpha = 0

    DialogText2 = display.newText( Dialogue.Scene1[mid]  , 240, 275, "UI_Elements/OpenSans-Light", 12)
    DialogText2:setFillColor( 0, 0, 0 )
    DialogText2.alpha = 0

    DialogText3 = display.newText( Dialogue.Scene1[finish]  , 240, 295, "UI_Elements/OpenSans-Light", 12)
    DialogText3:setFillColor( 0, 0, 0 )
    DialogText3.alpha = 0

    --Button
    button = display.newImageRect( sceneGroup, "Scene3Assets/blue.png", 20, 20 )
    button.x = display.contentCenterX + 220
    button.y = display.contentCenterY + 105
    button.alpha = 0

    --Button Outer
    buttonOuter = display.newImageRect( sceneGroup, "Scene3Assets/blueOuter.png", 30, 30 )
    buttonOuter.x = display.contentCenterX + 220
    buttonOuter.y = display.contentCenterY + 105
    buttonOuter.alpha = 0

    --Next Button
    nextButton = display.newImageRect( sceneGroup, "Scene3Assets/skipScene.png", 30, 30 )
    nextButton.x = display.contentCenterX + 250
    nextButton.y = display.contentCenterY + 120
    nextButton.alpha = 0

     --Venus Poses
    V1 = display.newImageRect( sceneGroup, objectSheet, 1, 250, 200 )
    V1.x = display.contentCenterX + 150
    V1.y = display.contentCenterY - 65
    V1.myName = "V1"
    V1.alpha = 0

    V2 = display.newImageRect( sceneGroup, objectSheet, 2, 250, 400 )
    V2.x = display.contentCenterX 
    V2.y = display.contentCenterY + 20
    V2.myName = "V2"
    V2.alpha = 0

    V3 = display.newImageRect( sceneGroup, objectSheet, 3, 200, 350 )
    V3.x = display.contentCenterX + 150
    V3.y = display.contentCenterY - 20
    V3.myName = "V3"
    V3.alpha = 0

    --Transitiion background into the scene
    transition.to( background,{ time = 12000, delay = 2500 ,alpha = 0.80} )
    transition.to( background,{ x = 200, time = 8000, delay = 3000 })
    transition.to( orb,{ x = 58, time = 8000, delay = 3000 })

    --Location Text Appears Function Call
    LocationTextAppear()

    --Call to blue emission effect
    timer.performWithDelay( 6000, orb_glow)

    --Call to camera panning effect
    timer.performWithDelay( 12000, cameraMove)

    --Button Appears
    timer.performWithDelay( 18500, buttonReappear)
    transition.to(buttonOuter,{time = 1, delay = 22000, alpha = 1})

    --Background Music Loop
    timer.performWithDelay( 500, PlayBackgroundSound)

    --Display Mainframe effect 
    timer.performWithDelay( 12000, DisplayMainFrame)

    bringToFront()

    --Event Listeners for Button Tap
    button:addEventListener( "tap", buttonReappear)
    button:addEventListener( "tap", outerRotate)
    button:addEventListener( "tap", ClickSound)
    button:addEventListener( "tap", dialogFunction )
    button:addEventListener( "tap", CharControl)
    nextButton:addEventListener( "tap", changeScenes)
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
    composer.removeScene("Scene1", false);
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