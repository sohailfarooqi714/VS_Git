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
local sheetOptionsVenus =
{
    frames = 
    {
    
        {
            -- 1
            x=1,
            y=1,
            width=226,
            height=1000,

        },
        {
            -- 2
            x=229,
            y=1,
            width=226,
            height=1000,

        },
        {
            -- 3
            x=457,
            y=447,
            width=136,
            height=562,

            sourceX = 20,
            sourceY = 150,
            sourceWidth = 180,
            sourceHeight = 800
        },
        {
            -- 4
            x=457,
            y=1,
            width=549,
            height=444,

            sourceX = 94,
            sourceY = 105,
            sourceWidth = 745,
            sourceHeight = 600
        },
    },

    sheetContentWidth = 1007,
    sheetContentHeight = 1010
}

-- MAIN FRAME EFFECT TEXT--------------------------------------------------------------------------------------  
---------------------------------------------------------------------------------------------------------------
local text = {letters=" Access Log Wednesday 23:43\n\n    Analysis Compilation", index = 1} --FOR MAIN FRAME EFFECT
local text1 = {letters1= "Accessing Manifest Directives...", index1 = 1}
local text2 = {letters2="Decryption of Access Keys Complete\n    Access granted: Email Server\n          Access Logs\n       Data Set Training\n     Military Action Data\n         Risk Profiles", index2 = 1} --FOR MAIN FRAME EFFECT

local MainframeTextBox = display.newText("", 0, 0,"UI_Elements/Digital-System", 17) -- FOR MAINFRAME EFFECT
MainframeTextBox.x = display.contentCenterX
MainframeTextBox.y = display.contentCenterY
MainframeTextBox:setFillColor(0,1,0)

local MainframeTextBox1 = display.newText("", 0, 0, "UI_Elements/Digital-System", 17) -- FOR MAINFRAME1 EFFECT
MainframeTextBox1.x = display.contentCenterX 
MainframeTextBox1.y = display.contentCenterY - 20
MainframeTextBox1:setFillColor(0,1,0)

local MainframeTextBox2 = display.newText("", 0, 0, "UI_Elements/Digital-System", 15) -- FOR MAINFRAME2 EFFECT
MainframeTextBox2.x = display.contentCenterX 
MainframeTextBox2.y = display.contentCenterY - 20
MainframeTextBox2:setFillColor(0,1,0)

----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

local objectSheet = graphics.newImageSheet( "Scene7Assets/VenusSpriteSheet.png", sheetOptionsVenus )

local TapClickSound = audio.loadStream( "Scene3Assets/click1.wav" )
--local BackgroundMusic = audio.loadStream( "Scene7Assets/venus_credits.mp3" ) 
 
local dataTable = {}
 
local filePath = system.pathForFile( "dialog1.json", system.DocumentsDirectory ) 	--Specify path of interaction

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

--Mainframe Effect Functions
local function mainframeText()   --FOR MAINFRAME EFFECT
    local c = string.sub(text.letters, 1, text.index)
    MainframeTextBox.text = c
    text.index = text.index + 1
end

local function displayMainFrame()
    timer.performWithDelay(50, mainframeText, string.len(text.letters))
end

local function mainframeText1()
    local d = string.sub(text1.letters1, 1, text1.index1)
    MainframeTextBox1.text = d
    text1.index1 = text1.index1 + 1
end

local function displayMainFrame1()
    timer.performWithDelay(50, mainframeText1, string.len(text1.letters1))
end

local function mainframeText2()
    local e = string.sub(text2.letters2, 1, text2.index2)
    MainframeTextBox2.text = e
    text2.index2 = text2.index2 + 1
end

local function displayMainFrame2()
    timer.performWithDelay(25, mainframeText2, string.len(text2.letters2))
end

--Recursive call for hovering effect Venus 1 sprite.
function Hover1(event)
    transition.to( V1,{ time = 1600, y = 92, onComplete=Hover_repeat1 } )
end

function Hover_repeat1(event)
    transition.to( V1,{ time = 1400 , y = 98, onComplete=Hover1 } )
end

function Hover2(event)
    transition.to( V2,{ time = 1600, y = 92, onComplete=Hover_repeat2 } )
end

function Hover_repeat2(event)
    transition.to( V2,{ time = 1400 , y = 98, onComplete=Hover2 } )
end

function Hover3(event)
    transition.to( V3,{ time = 1600, y = 72, onComplete=Hover_repeat3 } )
end

function Hover_repeat3(event)
    transition.to( V3,{ time = 1400 , y = 78, onComplete=Hover3 } )
end

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

function ClickSound(event)
    audio.play(TapClickSound)
end

function PlayBackgroundSound(event)
    BackGroundMusicChannel = audio.play(BackgroundMusic, { channel=2, loops=-1} )
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

function dialogFunction(event)
   --Previous Dialogues Disappear
   transition.to(DialogText1,{alpha = 0, time = 400, delay = 400})
   transition.to(DialogText2,{alpha = 0, time = 400, delay = 400})
   transition.to(DialogText3,{alpha = 0, time = 400, delay = 400})
   transition.to(DialogText4,{alpha = 0, time = 400, delay = 400})
     --Dialogue Strings
     DialogText1 = display.newText(Dialogue.Scene7[start]  , 240, 235, "UI_Elements/OpenSans-Light", 12)
     DialogText1:setFillColor( 0, 0, 0 )
     DialogText1.alpha = 0
     DialogText2 = display.newText(Dialogue.Scene7[mid1]  , 240, 255, "UI_Elements/OpenSans-Light", 12)
     DialogText2:setFillColor( 0, 0, 0 )
     DialogText2.alpha = 0
     DialogText3 = display.newText(Dialogue.Scene7[mid2]  , 240, 275, "UI_Elements/OpenSans-Light", 12)
     DialogText3:setFillColor( 0, 0, 0 )
     DialogText3.alpha = 0
     DialogText4 = display.newText(Dialogue.Scene7[finish]  , 240, 295, "UI_Elements/OpenSans-Light", 12)
     DialogText4:setFillColor( 0, 0, 0 )
     DialogText4.alpha = 0
   --New Dialogues Appear
   transition.to(DialogText1,{alpha = 0.90, time = 400, delay = 1000})
   transition.to(DialogText2,{alpha = 0.90, time = 400, delay = 1500})
   transition.to(DialogText3,{alpha = 0.90, time = 400, delay = 2000})
   transition.to(DialogText4,{alpha = 0.90, time = 400, delay = 2500})
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
        transition.to(MainframeTextBox,{alpha = 0, time = 800, delay = 400})
        transition.to(V1,{alpha = 1, time = 2000})
        transition.to(VenusName,{alpha = 0.90, time = 800, delay = 1500})
        transition.to(dialogBox,{alpha = 0.90, time = 800, delay = 1500})
    elseif(tapCount == 3)then
        transition.to( V1,{time = 800, alpha = 0})
        Hover2()
        transition.to( V2,{time = 800, alpha = 1})
    elseif(tapCount == 4)then
        transition.to(VenusName,{alpha = 0, time = 800, delay = 400})
        transition.to(dialogBox,{alpha = 0, time = 800, delay = 400})
        timer.performWithDelay(2000, displayMainFrame1)
    elseif(tapCount == 5)then
        transition.to(MainframeTextBox1,{alpha = 0, time = 800, delay = 400})
        transition.to(VenusName,{alpha = 1, time = 800, delay = 1500})
        transition.to(dialogBox,{alpha = 0.90, time = 800, delay = 1500})
    elseif(tapCount == 6)then
        transition.to( V1,{time = 800, alpha = 1})
        transition.to( V2,{time = 800, alpha = 0})
    elseif(tapCount == 13)then
        transition.to(dialogBox,{alpha = 0, time = 800, delay = 400})
        transition.to(VenusName,{alpha = 0, time = 800, delay = 400})
        transition.to( V1,{time = 800, alpha = 0})
        transition.to( V4,{time = 1000, delay = 1000 ,alpha = 1})
        timer.performWithDelay(3000, displayMainFrame2)
    elseif(tapCount == 14)then
        transition.to( V4,{y = 80, time = 500, delay = 1500 })
        transition.to(MainframeTextBox2,{alpha = 0, time = 800, delay = 400})
        transition.to(dialogBox,{alpha = 0.90, time = 800, delay = 1500})
        transition.to(VenusName,{alpha = 1, time = 800, delay = 1500})
    elseif(tapCount == 18)then
        transition.to( V4,{time = 1200, delay = 500 ,alpha = 0})
        transition.to( V1,{time = 800, alpha = 1})
    elseif(tapCount == 19)then
        transition.to( V1,{time = 800, alpha = 0})
        transition.to( V2,{time = 800, alpha = 1})
    elseif(tapCount == 21)then
        transition.to( V2,{time = 800, alpha = 0})
        Hover3()
        transition.to( V3,{time = 800, alpha = 1})
    elseif(tapCount == 22)then
        transition.to(VenusName,{alpha = 0, time = 800, delay = 400})
        transition.to(dialogBox,{alpha = 0, time = 800, delay = 400})
        display.remove(button)
        display.remove(buttonOuter)
        transition.to( nextButton,{time = 400 , delay = 2000 ,alpha = 1} )
    end
end

local function changeScenes()
    --audio.stop(BackgroundMusic)
    display.remove(nextButton)
    composer.gotoScene("Scene8", {effect="fade", time = 4000})
end

--[[local function RestartScene()
    composer.gotoScene("Scene7", {effect="fade", time = 1000})
    ClickSound()
end]]
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    --Scene Background
    background = display.newImageRect( sceneGroup, "Scene7Assets/7_bg.jpg", 565, 350)
    background.x = display.contentCenterX 
    background.y = display.contentCenterY
    background.alpha = 0

    --Scene Location Text
    LocationTextUpper = display.newText( sceneGroup,"Research Lab", 112, 250, "Scene3Assets/Fox", 12 )
    LocationTextUpper.alpha = 0
    LocationTextLower = display.newText( sceneGroup,"4:07 AM", 112, 272, "UI_Elements/Digital-Clock", 16 )
    LocationTextLower.alpha = 0

    --Divider PNG Image
    LocationDivider = display.newImageRect( sceneGroup, "Scene3Assets/divider.png", 150, 8)
    LocationDivider.x =  600
    LocationDivider.y =  259
    
    --Dialog Box PNG 
    dialogBox = display.newImageRect( sceneGroup, "Scene3Assets/textbox.png", 530, 110)
    dialogBox.x = display.contentCenterX 
    dialogBox.y = display.contentCenterY + 99
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

    --Venus Name
    VenusName = display.newText(sceneGroup,"Venus", 15, 238, "UI_Elements/Ceria-Lebaran", 20)
    VenusName.alpha = 0
    VenusName:setFillColor( 0, 0, 0)

    --Venus Poses
    V1 = display.newImageRect( sceneGroup, objectSheet, 1, 50, 200 )
    V1.x = display.contentCenterX 
    V1.y = display.contentCenterY - 65
    V1.myName = "V1"
    V1.alpha = 0
 
    V2 = display.newImageRect( sceneGroup, objectSheet, 2, 50, 200 )
    V2.x = display.contentCenterX 
    V2.y = display.contentCenterY - 65
    V2.myName = "V2"
    V2.alpha = 0
 
    V3 = display.newImageRect( sceneGroup, objectSheet, 3, 38, 140 )
    V3.x = display.contentCenterX 
    V3.y = display.contentCenterY - 85
    V3.myName = "V3"
    V3.alpha = 0

    V4 = display.newImageRect( sceneGroup, objectSheet, 4, 220, 200 )
    V4.x = display.contentCenterX 
    V4.y = display.contentCenterY + 35
    V4.myName = "V4"
    V4.alpha = 0

    --Button
    button = display.newImageRect( sceneGroup, "Scene3Assets/blue.png", 20, 20 )
    button.x = display.contentCenterX + 250
    button.y = display.contentCenterY + 120
    button.alpha = 0

    --Button
    buttonOuter = display.newImageRect( sceneGroup, "Scene3Assets/blueOuter.png", 30, 30 )
    buttonOuter.x = display.contentCenterX + 250
    buttonOuter.y = display.contentCenterY + 120
    buttonOuter.alpha = 0

    --Next Button
    nextButton = display.newImageRect( sceneGroup, "Scene3Assets/skipScene.png", 30, 30 )
    nextButton.x = display.contentCenterX + 250
    nextButton.y = display.contentCenterY + 120
    nextButton.alpha = 0

    --Restart Scene Button
    redo = display.newImageRect( sceneGroup, "UI_Elements/redo.png", 30, 30 )
    redo.x = display.contentCenterX - 240
    redo.y = display.contentCenterY - 120
    redo.alpha = 0

    Hover1()

    --Background transitions into the scene
    transition.to(background,{time = 5000, delay = 8500, alpha = 0.70})

    --Background Music Loop
    timer.performWithDelay( 9000, PlayBackgroundSound)

    --Location Text Appears Function Call
    timer.performWithDelay(5000, LocationTextAppear)

    --Call to first mainframe
    timer.performWithDelay(13500, displayMainFrame)

    --Button Appears
    transition.to( button ,{time = 400 , delay = 12000 ,alpha = 1} )
    transition.to( buttonOuter ,{time = 400 , delay = 12000 ,alpha = 1} )

    button:addEventListener( "tap", buttonReappear)
    button:addEventListener( "tap", outerRotate)
    button:addEventListener( "tap", dialogFunction )
    button:addEventListener( "tap", CharControl )
    button:addEventListener( "tap", ClickSound)

    nextButton:addEventListener( "tap", changeScenes)
    nextButton:addEventListener( "tap", ClickSound)
    --redo:addEventListener( "tap", RestartScene)
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