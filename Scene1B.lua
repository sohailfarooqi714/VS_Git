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
local objectSheet = graphics.newImageSheet( "Scene1Assets/VenusSpriteSheet.png", sheetOptionsVenus )

local TapClickSound = audio.loadStream( "Scene3Assets/click1.wav" )

local dataTable = {}
 
local filePath = system.pathForFile( "dialog1.json", system.ResourceDirectory ) 	--Specify path of interaction

local contents

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

function dialogFunction(event)
    --Previous Dialogues Disappear
    transition.to(DialogText1,{alpha = 0, time = 400})
    transition.to(DialogText2,{alpha = 0, time = 400})
    transition.to(DialogText3,{alpha = 0, time = 400})
      --Dialogue Strings
      DialogText1 = display.newText( Dialogue.Scene1B[start]  , 240, 255, "UI_Elements/OpenSans-Light", 12)
      DialogText1:setFillColor( 0, 0, 0 )
      DialogText1.alpha = 0
  
      DialogText2 = display.newText( Dialogue.Scene1B[mid]  , 240, 275, "UI_Elements/OpenSans-Light", 12)
      DialogText2:setFillColor( 0, 0, 0 )
      DialogText2.alpha = 0
  
      DialogText3 = display.newText( Dialogue.Scene1B[finish]  , 240, 295, "UI_Elements/OpenSans-Light", 12)
      DialogText3:setFillColor( 0, 0, 0 )
      DialogText3.alpha = 0  
    --New Dialogues Appear
    transition.to(DialogText1,{alpha = 1, time = 800, delay = 1000})
    transition.to(DialogText2,{alpha = 1, time = 800, delay = 2000})
    transition.to(DialogText3,{alpha = 1, time = 800, delay = 3000})
     --Increment values
     start = start + 3
     mid = mid + 3
     finish = finish + 3
end

function CharControl()
    tapCount = tapCount + 1
    print(tapCount)
    if(tapCount == 1)then
        transition.to(VenusName,{alpha = 1, time = 800, delay = 2000})
        --Dialogue Box Appears
        transition.to(dialogBox,{alpha = 0.90, time = 800, delay = 1000})        
    elseif(tapCount == 3)then
        display.remove(button)
        display.remove(buttonOuter)
        --Dialogue Box Disappears
        transition.to(dialogBox,{alpha = 0, time = 800, delay = 1000})
        transition.to(VenusName,{alpha = 0, time = 800, delay = 1000})
        transition.to( nextButton,{time = 1 , delay = 6000 , alpha = 0.8} )
        transition.to(V3,{alpha = 0, time = 3000, delay = 3000})
    end
end

function bringToFront()
    dialogBox:toFront()
    VenusName:toFront()
    button:toFront()
    buttonOuter:toFront()
    nextButton:toFront()
end

local function changeScenes()
    display.remove(nextButton)
    composer.gotoScene("Scene2", {effect="fade", time = 4000})
    --Fade out previous audio channel
    audio.fadeOut({channel = 1, time = 4000})
    ClickSound()
end
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    --Scene Background2
    background = display.newImageRect( sceneGroup, "Scene1Assets/1B_bg.png", 640, 400)
    background.x = display.contentCenterX 
    background.y = display.contentCenterY
    background.alpha = 0

    --Dialog Box PNG 
    dialogBox = display.newImageRect( sceneGroup, "Scene3Assets/textbox.png", 500, 110)
    dialogBox.x = display.contentCenterX 
    dialogBox.y = display.contentCenterY + 100
    dialogBox.alpha = 0

    --Dialogue Strings
    DialogText1 = display.newText( Dialogue.Scene1B[start]  , 240, 255, "UI_Elements/OpenSans-Light", 12)
    DialogText1:setFillColor( 0, 0, 0 )
    DialogText1.alpha = 0

    DialogText2 = display.newText( Dialogue.Scene1B[mid]  , 240, 275, "UI_Elements/OpenSans-Light", 12)
    DialogText2:setFillColor( 0, 0, 0 )
    DialogText2.alpha = 0

    DialogText3 = display.newText( Dialogue.Scene1B[finish]  , 240, 295, "UI_Elements/OpenSans-Light", 12)
    DialogText3:setFillColor( 0, 0, 0 )
    DialogText3.alpha = 0  

    --Button
    button = display.newImageRect( sceneGroup, "Scene3Assets/blue.png", 20, 20 )
    button.x = display.contentCenterX + 220
    button.y = display.contentCenterY + 106
    button.alpha = 0

    --Button Outer
    buttonOuter = display.newImageRect( sceneGroup, "Scene3Assets/blueOuter.png", 30, 30 )
    buttonOuter.x = display.contentCenterX + 220
    buttonOuter.y = display.contentCenterY + 106
    buttonOuter.alpha = 0

    --Next Button
    nextButton = display.newImageRect( sceneGroup, "Scene3Assets/skipScene.png", 30, 30 )
    nextButton.x = display.contentCenterX + 250
    nextButton.y = display.contentCenterY + 120
    nextButton.alpha = 0

    --Venus Name
    VenusName = display.newText(sceneGroup,"Venus", 40, 240, "UI_Elements/Ceria-Lebaran", 20)
    VenusName:setFillColor(0, 0, 0)
    VenusName.alpha = 0

    V3 = display.newImageRect( sceneGroup, objectSheet, 3, 200, 350 )
    V3.x = display.contentCenterX 
    V3.y = display.contentCenterY - 20
    V3.myName = "V3"
    V3.alpha = 0

    bringToFront()

    --Background fades in transition
    transition.to( background,{ time = 5000, delay = 2500 ,alpha = 1} )
    transition.scaleTo( background,{ xScale=0.90, yScale=0.90, time=12000, delay = 2500 })
    --Venus Appears
    transition.to(V3,{alpha = 1, time = 3000, delay = 6500})

    --Button appears with delay
    timer.performWithDelay( 3000, buttonReappear)
    transition.to(buttonOuter,{time = 1, delay = 6500, alpha = 1})

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
    composer.removeScene("Scene1B", false);
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