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
local sheetOptionsKamali =
{
    frames =
    {
        {
        -- K1
        x=1,
        y=1,
        width=942,
        height=1145,

        sourceX = 36,
        sourceY = 230,
        sourceWidth = 1000,
        sourceHeight = 1375
    },
    {
        -- K2
        x=945,
        y=1,
        width=942,
        height=1145,

        sourceX = 36,
        sourceY = 230,
        sourceWidth = 1000,
        sourceHeight = 1375
    },
},

sheetContentWidth = 1888,
sheetContentHeight = 1147
}

local objectSheet = graphics.newImageSheet( "Scene2Assets/KamaliSpriteSheet.png", sheetOptionsKamali )

local TapClickSound = audio.loadStream( "Scene3Assets/click1.wav" )
local KeyboardTypeSound = audio.loadStream( "Scene3Assets/keyboard.mp3" )

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
      transition.to( button,{ time = 1 ,delay = 11000 ,alpha = 1} )
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

function KamaliAnimate()
    tapCount = tapCount + 1
    print(tapCount)
    transition.to( K2,{time = 2000 ,alpha = 0})
    transition.to( K1,{time = 1000, alpha = 1})
    transition.to( K1,{time = 2000, delay = 9500 ,alpha = 0})
    transition.to( K2,{time = 500, delay = 9500, alpha = 1})
    audio.play(KeyboardTypeSound)
    if(tapCount == 2)then
        background_animate()
elseif(tapCount == 9)then
        display.remove(button)
        display.remove(buttonOuter)
        transition.to( nextButton,{time = 1 , delay = 5000 , alpha = 0.8} )
    end
end

function background_animate(event)
    transition.to(background2,{time=10000, alpha=1, x=background2.x, y=background2.y })
    transition.to(background2,{x = 200, time = 12000, onComplete=background_animate_repeat})
end

function background_animate_repeat(event)
    transition.to(background2,{time=10000, alpha=0, x=background2.x, y=background2.y})
    transition.to(background2,{x = 355, time = 12000, onComplete=background_animate})
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

function dialogFunction()
	--Previous Dialogues Disappear
    transition.to(DialogText1,{alpha = 0, time = 800, delay = 400})
    transition.to(DialogText2,{alpha = 0, time = 800, delay = 400})
    transition.to(DialogText3,{alpha = 0, time = 800, delay = 400})
    transition.to(DialogText4,{alpha = 0, time = 800, delay = 400})
      --Dialogue Strings
      DialogText1 = display.newText(Dialogue.Scene2[start]  , 165, 60, "UI_Elements/Digital-Clock", 14)
      DialogText1:setFillColor( 1, 1, 1 )
      DialogText1.alpha = 0
      DialogText2 = display.newText(Dialogue.Scene2[mid1]  , 165, 90, "UI_Elements/Digital-Clock", 14)
      DialogText2:setFillColor( 1, 1, 1 )
      DialogText2.alpha = 0
      DialogText3 = display.newText(Dialogue.Scene2[mid2]  , 165, 120, "UI_Elements/Digital-Clock", 14)
      DialogText3:setFillColor( 1, 1, 1 )
      DialogText3.alpha = 0
      DialogText4 = display.newText(Dialogue.Scene2[finish]  , 165, 150, "UI_Elements/Digital-Clock", 14)
      DialogText4:setFillColor( 1, 1, 1 )
      DialogText4.alpha = 0
    --New Dialogues Appear
    transition.to(DialogText1,{alpha = 0.90, time = 800, delay = 2000})
    transition.to(DialogText2,{alpha = 0.90, time = 800, delay = 3500})
    transition.to(DialogText3,{alpha = 0.90, time = 800, delay = 5000})
    transition.to(DialogText4,{alpha = 0.90, time = 800, delay = 6500})
    --Dialogue Box Appears
    --transition.to(dialogBox,{alpha = 0.90, time = 800, delay = 1000})
    --Kamali Name Appears
    --transition.to(KamaliName,{alpha = 1, time = 800, delay = 2000})
     --Increment values
     start = start + 4
     mid1 = mid1 + 4
     mid2 = mid2 + 4
     finish = finish + 4
end

function bringToFront()
    dialogBox:toFront()
    KamaliName:toFront()
    button:toFront()
    buttonOuter:toFront()
    nextButton:toFront()
end

local function changeScenes()
    --Previous Dialogues Disappear
    transition.to(DialogText1,{alpha = 0, time = 800, delay = 400})
    transition.to(DialogText2,{alpha = 0, time = 800, delay = 400})
    transition.to(DialogText3,{alpha = 0, time = 800, delay = 400})
    transition.to(DialogText4,{alpha = 0, time = 800, delay = 400})
    transition.to(dialogBox,{alpha = 0, time = 800, delay = 400})
    display.remove(nextButton)
    composer.gotoScene("Scene3", {effect="fade", time = 3000})
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
    background = display.newImageRect( sceneGroup, "Scene2Assets/2_bg.png", 565, 350)
    background.x = display.contentCenterX 
    background.y = display.contentCenterY
    background.alpha = 0

    background2 = display.newImageRect( sceneGroup, "Scene2Assets/Light_Travel.jpg", 800, 322)
    background2.x = display.contentCenterX + 118
    background2.y = display.contentCenterY
    background2.alpha = 0

    --Scene Location Text
    LocationTextUpper = display.newText( sceneGroup,"Military Research - Living Quarters", 115, 250, "Scene3Assets/Fox", 12 )
    LocationTextUpper.alpha = 0
    LocationTextLower = display.newText( sceneGroup,"A Few Months Ago", 115, 272 , "UI_Elements/Digital-Clock", 14 )
    LocationTextLower.alpha = 0

    --Divider PNG Image
    LocationDivider = display.newImageRect( sceneGroup, "Scene3Assets/divider.png", 150, 8)
    LocationDivider.x =  600
    LocationDivider.y =  259

    --Kamali Name
    KamaliName = display.newText(sceneGroup,"Kamali", 10, 220, "UI_Elements/Ceria-Lebaran", 20)
    KamaliName:setFillColor( 0, 0, 0)
    KamaliName.alpha = 0

    --Kamali Poses
    K1 = display.newImageRect( sceneGroup, objectSheet, 1, 250, 320 )
	K1.x = display.contentCenterX + 180
	K1.y = display.contentCenterY - 40
	K1.myName = "K1"
	K1.alpha = 0

	K2 = display.newImageRect( sceneGroup, objectSheet, 2, 250, 320 )
	K2.x = display.contentCenterX + 180
	K2.y = display.contentCenterY - 40
	K2.myName = "K2"
	K2.alpha = 0

      --Dialog Box PNG 
    dialogBox = display.newImageRect( sceneGroup, "Scene3Assets/textbox.png", 550, 140)
    dialogBox.x = display.contentCenterX 
    dialogBox.y = display.contentCenterY + 95
    dialogBox.alpha = 0

    --Dialogue Strings
    DialogText1 = display.newText(sceneGroup ,Dialogue.Scene2[start]  , 165, 60, "UI_Elements/Digital-Clock", 14)
    DialogText1:setFillColor( 1, 1, 1 )
    DialogText1.alpha = 0

    DialogText2 = display.newText(sceneGroup ,Dialogue.Scene2[mid1]  , 165, 90, "UI_Elements/Digital-Clock", 14)
    DialogText2:setFillColor( 1, 1, 1 )
    DialogText2.alpha = 0

    DialogText3 = display.newText(sceneGroup ,Dialogue.Scene2[mid2]  , 165, 120, "UI_Elements/Digital-Clock", 14)
    DialogText3:setFillColor( 1, 1, 1 )
    DialogText3.alpha = 0

    DialogText4 = display.newText(sceneGroup ,Dialogue.Scene2[finish]  , 165, 150, "UI_Elements/Digital-Clock", 14)
    DialogText4:setFillColor( 1, 1, 1 )
    DialogText4.alpha = 0

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

    --Background Fades In
    transition.to( background,{ time = 11000, delay = 4500 ,alpha = 1} )

    --Bring relevant object to front
    bringToFront()

    --Location Text Appears Function Call
    timer.performWithDelay(4000, LocationTextAppear)

    --Button Appears
    buttonReappear()
    transition.to(buttonOuter,{time = 1, delay = 11000, alpha = 1})

    button:addEventListener( "tap", buttonReappear)
    button:addEventListener( "tap", outerRotate)
    button:addEventListener( "tap", ClickSound)
    button:addEventListener( "tap", dialogFunction )
    button:addEventListener( "tap", KamaliAnimate)
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
    display.remove(DialogText1)
    display.remove(DialogText2)
    display.remove(DialogText3)
    display.remove(DialogText4)
 
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