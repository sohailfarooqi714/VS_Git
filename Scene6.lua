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
            y=803,
            width=561,
            height=800,

        },
        {
            -- K2
            x=564,
            y=803,
            width=508,
            height=800,

        },
        {
            -- K3
            x=1,
            y=1,
            width=614,
            height=800,

        },
        {
            -- K4
            x=617,
            y=1,
            width=614,
            height=800,

        },
        {
            -- K5
            x=1074,
            y=803,
            width=349,
            height=800,

        },
    },

    sheetContentWidth = 1424,
    sheetContentHeight = 1604
}

-- Configure image sheet
local sheetOptionsIsaac =
{
    frames = 
    {
    
        {
            -- I1
            x=1,
            y=1,
            width=465,
            height=800,

        },
        {
            -- I2
            x=1366,
            y=1,
            width=415,
            height=800,

        },
        {
            -- I3
            x=468,
            y=1,
            width=447,
            height=800,

        },
        {
            -- I4
            x=917,
            y=1,
            width=447,
            height=800,

        },
    },

    sheetContentWidth = 1782,
    sheetContentHeight = 802
}

local objectSheet = graphics.newImageSheet( "Scene6Assets/KamaliSpriteSheet.png", sheetOptionsKamali )

local objectSheet2 = graphics.newImageSheet( "Scene6Assets/IsaacSpriteSheet.png", sheetOptionsIsaac )

local TapClickSound = audio.loadStream( "Scene3Assets/click1.wav" )

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
    composer.gotoScene("Scene7", {effect="fade", time = 4000})
end

function ClickSound(event)
    audio.play(TapClickSound)
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
      DialogText1 = display.newText(Dialogue.Scene6[start]  , 240, 235, "UI_Elements/OpenSans-Light", 12)
      DialogText1:setFillColor( 0, 0, 0 )
      DialogText1.alpha = 0
      DialogText2 = display.newText(Dialogue.Scene6[mid1]  , 240, 255, "UI_Elements/OpenSans-Light", 12)
      DialogText2:setFillColor( 0, 0, 0 )
      DialogText2.alpha = 0
      DialogText3 = display.newText(Dialogue.Scene6[mid2]  , 240, 275, "UI_Elements/OpenSans-Light", 12)
      DialogText3:setFillColor( 0, 0, 0 )
      DialogText3.alpha = 0
      DialogText4 = display.newText(Dialogue.Scene6[finish]  , 240, 295, "UI_Elements/OpenSans-Light", 12)
      DialogText4:setFillColor( 0, 0, 0 )
      DialogText4.alpha = 0
    --New Dialogues Appear
    transition.to(DialogText1,{alpha = 0.90, time = 800, delay = 1000})
    transition.to(DialogText2,{alpha = 0.90, time = 800, delay = 1500})
    transition.to(DialogText3,{alpha = 0.90, time = 800, delay = 2000})
    transition.to(DialogText4,{alpha = 0.90, time = 800, delay = 2500})
end
 
function CharControl()
    tapCount = tapCount + 1
    print(tapCount)
    --[[if (tapCount == 1) then -- Kamali Speaks
        transition.to( dialogBox,{time = 800, delay = 1200, alpha = 1})
        transition.to( KamaliName,{time = 800, delay = 1200, alpha = 1})
    elseif (tapCount == 4) then
        transition.to( KamaliName,{time = 600, delay = 400, alpha = 0})
        transition.to( IsaacName,{time = 800, delay = 1200, alpha = 1})
        transition.to( I1,{time = 1000, delay = 1000, alpha = 0})
        transition.to( I2,{time = 1000, delay = 1000, alpha = 1})
    elseif (tapCount == 6) then
        transition.to( KamaliName,{time = 800, delay = 1200, alpha = 1})
        transition.to( IsaacName,{time = 600, delay = 400, alpha = 0})
        transition.to( K1,{time = 1000, delay = 1000, alpha = 0})
        transition.to( K5,{time = 1000, delay = 1000, alpha = 1})
    elseif (tapCount == 8) then
        transition.to( KamaliName,{time = 600, delay = 400, alpha = 0})
        transition.to( IsaacName,{time = 800, delay = 1200, alpha = 1})
        transition.to( I2,{time = 1000, delay = 1000, alpha = 0})
        transition.to( I3,{time = 1000, delay = 1000, alpha = 1})
    elseif (tapCount == 10) then
        transition.to( KamaliName,{time = 800, delay = 1200, alpha = 1})
        transition.to( IsaacName,{time = 600, delay = 400, alpha = 0})
    elseif (tapCount == 11) then
        transition.to( KamaliName,{time = 600, delay = 400, alpha = 0})
        transition.to( IsaacName,{time = 800, delay = 1200, alpha = 1})
        transition.to( I2,{time = 1000, delay = 1000, alpha = 1})
        transition.to( I3,{time = 1000, delay = 1000, alpha = 0})
    elseif (tapCount == 16) then
        transition.to( KamaliName,{time = 800, delay = 1200, alpha = 1})
        transition.to( IsaacName,{time = 600, delay = 400, alpha = 0})
        transition.to( K5,{time = 1000, delay = 1000, alpha = 0})
        transition.to( K2,{time = 1000, delay = 1000, alpha = 1})
    elseif (tapCount == 20) then
        transition.to( KamaliName,{time = 600, delay = 400, alpha = 0})
        transition.to( IsaacName,{time = 800, delay = 1200, alpha = 1})
        transition.to( I3,{time = 1000, delay = 1000, alpha = 0})
        transition.to( I2,{time = 1000, delay = 1000, alpha = 1})
    elseif (tapCount == 23) then
        transition.to( KamaliName,{time = 800, delay = 1200, alpha = 1})
        transition.to( IsaacName,{time = 600, delay = 400, alpha = 0})
        transition.to( K2,{time = 1000, delay = 1000, alpha = 0})
        transition.to( K5,{time = 1000, delay = 1000, alpha = 1})
    elseif (tapCount == 26) then
        transition.to( KamaliName,{time = 600, delay = 400, alpha = 0})
        transition.to( IsaacName,{time = 800, delay = 1200, alpha = 1})
    elseif (tapCount == 30) then
        transition.to( KamaliName,{time = 800, delay = 1200, alpha = 1})
        transition.to( IsaacName,{time = 600, delay = 400, alpha = 0})
        transition.to( K5,{time = 1000, delay = 1000, alpha = 0})
        transition.to( K3,{time = 1000, delay = 1000, alpha = 1})
    elseif (tapCount == 32) then
        transition.to( KamaliName,{time = 600, delay = 400, alpha = 0})
        transition.to( IsaacName,{time = 800, delay = 1200, alpha = 1})
        transition.to( I2,{time = 1000, delay = 1000, alpha = 0})
        transition.to( I3,{time = 1000, delay = 1000, alpha = 1})
        transition.to( K3,{time = 1000, delay = 1000, alpha = 0})
        transition.to( K5,{time = 1000, delay = 1000, alpha = 1})
    elseif (tapCount == 36) then
        transition.to( I3,{time = 600, delay = 400, alpha = 0})
        transition.to( I1,{time = 1000, delay = 1000, alpha = 1})
        transition.to( I1,{x = 500, time = 1400, delay = 1500})
        transition.to( dialogBox,{time = 800, delay = 1200, alpha = 0})
        transition.to( IsaacName,{time = 800, delay = 1200, alpha = 0})
        transition.to( nextButton,{time = 400 , delay = 2000 ,alpha = 1} )
        display.remove(button)
        display.remove(buttonOuter)
    end]]
end

function bringToFront()
    dialogBox:toFront()
    DialogText1:toFront()
    DialogText2:toFront()
    DialogText3:toFront()
    DialogText4:toFront()
    KamaliName:toFront()
    IsaacName:toFront()
    button:toFront()
    buttonOuter:toFront()
    nextButton:toFront()
end
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    --Scene Background
    background = display.newImageRect( sceneGroup, "Scene6Assets/6_bg.png", 565, 350)
    background.x = display.contentCenterX 
    background.y = display.contentCenterY
    background.alpha = 1
    
    --Dialog Box PNG 
    dialogBox = display.newImageRect( sceneGroup, "Scene3Assets/textbox.png", 500, 125)
    dialogBox.x = display.contentCenterX 
    dialogBox.y = display.contentCenterY + 98
    dialogBox.alpha = 1

    --Dialogue Strings
    DialogText1 = display.newText(sceneGroup ,Dialogue.Scene6[start]  , 240, 232, "UI_Elements/OpenSans-Light", 13)
    DialogText1:setFillColor( 0, 0, 0 )
    DialogText1.alpha = 0
    DialogText2 = display.newText(sceneGroup ,Dialogue.Scene6[mid1]  , 240, 252, "UI_Elements/OpenSans-Light", 13)
    DialogText2:setFillColor( 0, 0, 0 )
    DialogText2.alpha = 0
    DialogText3 = display.newText(sceneGroup ,Dialogue.Scene6[mid2]  , 240, 272, "UI_Elements/OpenSans-Light", 13)
    DialogText3:setFillColor( 0, 0, 0 )
    DialogText3.alpha = 0
    DialogText4 = display.newText(sceneGroup ,Dialogue.Scene6[finish]  , 240, 292, "UI_Elements/OpenSans-Light", 13)
    DialogText4:setFillColor( 0, 0, 0 )
    DialogText4.alpha = 0

    --Button
    button = display.newImageRect( sceneGroup, "Scene3Assets/blue.png", 20, 20 )
    button.x = display.contentCenterX + 250
    button.y = display.contentCenterY + 105
    button.alpha = 0

    --Button
    buttonOuter = display.newImageRect( sceneGroup, "Scene3Assets/blueOuter.png", 30, 30 )
    buttonOuter.x = display.contentCenterX + 250
    buttonOuter.y = display.contentCenterY + 105
    buttonOuter.alpha = 0

    --Next Button
    nextButton = display.newImageRect( sceneGroup, "Scene3Assets/skipScene.png", 30, 30 )
    nextButton.x = display.contentCenterX + 250
    nextButton.y = display.contentCenterY + 120
    nextButton.alpha = 0

    IsaacName = display.newText(sceneGroup, "Isaac", 29, 230, "UI_Elements/Ceria-Lebaran", 20)
    IsaacName:setFillColor(0,0,0)
    IsaacName.alpha = 0

    KamaliName = display.newText(sceneGroup, "Kamali", 30, 230, "UI_Elements/Ceria-Lebaran", 20)
    KamaliName:setFillColor(0,0,0)
    KamaliName.alpha = 0

    --Kamali Poses
    K1 = display.newImageRect( sceneGroup, objectSheet, 1, 190, 300 ) -- Walking
	K1.x = display.contentCenterX - 300
	K1.y = display.contentCenterY + 20
	K1.myName = "K1"
	K1.alpha = 0

	K2 = display.newImageRect( sceneGroup, objectSheet, 2, 190, 300 ) -- Rant single handedly
	K2.x = display.contentCenterX - 130
	K2.y = display.contentCenterY + 10
	K2.myName = "K2"
	K2.alpha = 0

	K3 = display.newImageRect( sceneGroup, objectSheet, 3, 240, 300 ) -- Dual wielding rant
	K3.x = display.contentCenterX - 145
	K3.y = display.contentCenterY + 10
	K3.myName = "K3"
    K3.alpha = 0
    
    K4 = display.newImageRect( sceneGroup, objectSheet, 4, 240, 300 ) -- Dual wield angry rant
	K4.x = display.contentCenterX - 145
	K4.y = display.contentCenterY + 10
	K4.myName = "K4"
    K4.alpha = 0
    
    K5 = display.newImageRect( sceneGroup, objectSheet, 5, 130, 300 ) -- Looser
	K5.x = display.contentCenterX - 145
	K5.y = display.contentCenterY + 10
	K5.myName = "K5"
    K5.alpha = 0

    --Isaac Poses
    I1 = display.newImageRect( sceneGroup, objectSheet2, 1, 190, 300 ) -- Walking
	I1.x = display.contentCenterX + 80
	I1.y = display.contentCenterY + 10
	I1.myName = "I1"
	I1.alpha = 0

	I2 = display.newImageRect( sceneGroup, objectSheet2, 2, 180, 310 ) --Uptight
	I2.x = display.contentCenterX + 180
	I2.y = display.contentCenterY + 15
	I2.myName = "I2"
	I2.alpha = 0

	I3 = display.newImageRect( sceneGroup, objectSheet2, 3, 195, 310 ) --Normal
	I3.x = display.contentCenterX + 180
	I3.y = display.contentCenterY + 15
	I3.myName = "I3"
    I3.alpha = 0

    I4 = display.newImageRect( sceneGroup, objectSheet2, 4, 185, 310 ) --Pissed
	I4.x = display.contentCenterX + 180
	I4.y = display.contentCenterY + 15
	I4.myName = "I4"
    I4.alpha = 0

    transition.to(DialogText2,{alpha = 1, time = 800, delay = 1000})
    transition.to(DialogText3,{alpha = 1, time = 800, delay = 2000})
    transition.to(KamaliName,{alpha = 1, time = 800, delay = 1200})
    transition.to(dialogBox,{alpha = 1, time = 800, delay = 1200})
    
    --Kamali Walk Sprite Appears
    transition.to( K1,{alpha = 1, time = 800})
    --Kamali walk movement
    transition.to( K1,{x = 80, time = 1200, delay = 500})

    --Isaac Walk Sprite Appears
    transition.to( I1,{alpha = 1, time = 800})
    --Isaac walk movement
    transition.to( I1,{x = 440, time = 1400, delay = 500})

    --Button Appears
    transition.to( nextButton,{time = 400 , delay = 3000 ,alpha = 1} )
    --transition.to( buttonOuter,{time = 400 , delay = 3000 ,alpha = 1} )

    bringToFront()

    button:addEventListener( "tap", buttonReappear)
    button:addEventListener( "tap", dialogFunction )
    button:addEventListener( "tap", ClickSound)
    button:addEventListener( "tap", CharControl)
    button:addEventListener( "tap", outerRotate)

    nextButton:addEventListener( "tap", ClickSound)
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