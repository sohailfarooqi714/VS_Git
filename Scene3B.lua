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
            width=779,
            height=1200,

        },
        {
            -- K2
            x=782,
            y=1,
            width=600,
            height=1161,

            sourceX = 185,
            sourceY = 214,
            sourceWidth = 1000,
            sourceHeight = 1375
        },
        {
            -- K3
            x=1384,
            y=1,
            width=526,
            height=1161,

            sourceX = 257,
            sourceY = 214,
            sourceWidth = 1000,
            sourceHeight = 1375
        },
    },

    sheetContentWidth = 1911,
    sheetContentHeight = 1202
}

local sheetOptionsSarah =
{
    frames = 
    {
    
        {
            -- S1
            x=928,
            y=1,
            width=274,
            height=1135,

            sourceX = 423,
            sourceY = 240,
            sourceWidth = 1000,
            sourceHeight = 1375
        },
        {
            -- S2
            x=1204,
            y=1,
            width=378,
            height=1145,

            sourceX = 381,
            sourceY = 230,
            sourceWidth = 1000,
            sourceHeight = 1375
        },
        {
            -- S3
            x=1,
            y=1,
            width=238,
            height=1000,

        },
        {
            -- S4
            x=241,
            y=1,
            width=329,
            height=1000,

        },
        {
            -- S5
            x=572,
            y=1,
            width=354,
            height=1000,

        },
    },

    sheetContentWidth = 1583,
    sheetContentHeight = 1147
}

local objectSheet = graphics.newImageSheet( "Scene3BAssets/KamaliSpriteSheet.png", sheetOptionsKamali )

local objectSheet2 = graphics.newImageSheet("Scene3BAssets/SarahSpriteSheet.png", sheetOptionsSarah)

local TapClickSound = audio.loadStream( "Scene3Assets/click1.wav" )

local dataTable = {}
 
local filePath = system.pathForFile( "dialog1.json", system.ResourceDirectory ) 	--Specify path of interaction

local contents
 
local tapCount = 0

start = 1
finish = 2 
 
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

function ClickSound(event)
    audio.play(TapClickSound)
end

--Declaring functions for recursive element illuminating light
function server_glow(event)
    transition.to( BlinkingRedLight,{ time=1500, alpha=0.80, x=BlinkingRedLight.x, y=BlinkingRedLight.y, onComplete=server_glow_repeat } )
end

function server_glow_repeat(event)
    transition.to( BlinkingRedLight,{ time=1500, alpha=0, x=BlinkingRedLight.x, y=BlinkingRedLight.y, onComplete=server_glow } )
end

function dialogFunction(event)  
	--Previous Dialogues Disappear
    transition.to(DialogText1,{alpha = 0, time = 400, delay = 400})
    transition.to(DialogText2,{alpha = 0, time = 400, delay = 400})
      --Dialogue Strings
      DialogText1 = display.newText(Dialogue.Scene3B[start]  , 240, 250, "UI_Elements/OpenSans-Light", 12)
      DialogText1:setFillColor( 0, 0, 0 )
      DialogText1.alpha = 0
      DialogText2 = display.newText(Dialogue.Scene3B[finish]  , 240, 270, "UI_Elements/OpenSans-Light", 12)
      DialogText2:setFillColor( 0, 0, 0 )
      DialogText2.alpha = 0
    --New Dialogues Appear
    transition.to(DialogText1,{alpha = 0.90, time = 800, delay = 2000})
    transition.to(DialogText2,{alpha = 0.90, time = 800, delay = 3000})
     --Increment values
     start = start + 2
     finish = finish + 2
end

function CharControl()
    tapCount = tapCount + 1
    print(tapCount)
     if(tapCount == 1) then
        transition.to( dialogBox,{alpha = 0.90, time = 800, delay = 1500})
        transition.to( Sarah_Name,{alpha = 0.90, time = 800, delay = 1500})
        transition.to( K1,{time = 600, delay = 1000, alpha = 0.70})
    elseif(tapCount == 2) then
        transition.to( Sarah_Name,{ time = 600, delay = 600, alpha = 0 })
        transition.to( Kamali_Name,{ time = 600, delay = 600, alpha = 1 })
        transition.to( S4,{time = 600, delay = 1000, alpha = 0.70})
        transition.to( K1,{time = 600, delay = 400, alpha = 0})
        transition.to( K2,{time = 600, delay = 400, alpha = 1})
    elseif(tapCount == 3) then
        transition.to( Sarah_Name,{ time = 600, delay = 600, alpha = 1 })
        transition.to( Kamali_Name,{ time = 600, delay = 600, alpha = 0 })
        transition.to( K2,{time = 600, delay = 400, alpha = 0.7})
        transition.to( S4,{time = 600, delay = 400, alpha = 0})
        transition.to( S5,{time = 600, delay = 400, alpha = 1})
    elseif(tapCount == 4) then
        transition.to( Sarah_Name,{ time = 600, delay = 600, alpha = 0 })
        transition.to( Kamali_Name,{ time = 600, delay = 600, alpha = 1 })
        transition.to( S5,{time = 600, delay = 400, alpha = 0.7})
        transition.to( K2,{time = 600, delay = 400, alpha = 0})
        transition.to( K3,{time = 600, delay = 400, alpha = 1})
   elseif(tapCount == 5) then
        transition.to( dialogBox,{ time = 600, delay = 600, alpha = 0 })
        transition.to( Kamali_Name,{ time = 600, delay = 600, alpha = 0 })
        transition.to( K3,{time = 1000, delay = 600, alpha = 0})
        transition.to( K1,{time = 1000, delay = 600, alpha = 1})
        transition.to( S5,{time = 1000, delay = 600, alpha = 0})
        transition.to( nextButton,{time = 1000, delay = 3000, alpha = 1})
        display.remove(button)
        display.remove(buttonOuter)
    end
end

function bringToFront()
    dialogBox:toFront()
    button:toFront()
    buttonOuter:toFront()
    nextButton:toFront()
    Kamali_Name:toFront()
    Sarah_Name:toFront()
end

local function changeScenes()
    display.remove(nextButton)
    composer.gotoScene("Scene4", {effect="fade", time = 4000})
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
    background = display.newImageRect( sceneGroup, "Scene3BAssets/Lab_bg1.png", 565, 350)
    background.x = display.contentCenterX 
    background.y = display.contentCenterY
    background.alpha = 1

    --Blinking Red Light Emission Sprite
    BlinkingRedLight = display.newImageRect( sceneGroup,"Scene3Assets/red1.png", 60, 60)
    BlinkingRedLight.x = display.contentCenterX + 127
    BlinkingRedLight.y = display.contentCenterY - 80
    BlinkingRedLight.alpha = 0
    
    --Dialog Box PNG 
    dialogBox = display.newImageRect( sceneGroup, "Scene3Assets/textbox.png", 550, 110)
    dialogBox.x = display.contentCenterX 
    dialogBox.y = display.contentCenterY + 102
    dialogBox.alpha = 0

    --Dialogue Strings
    DialogText1 = display.newText(Dialogue.Scene3B[start]  , 240, 240, "UI_Elements/OpenSans-Light", 12)
    DialogText1:setFillColor( 0, 0, 0 )
    DialogText1.alpha = 0
    DialogText2 = display.newText(Dialogue.Scene3B[finish]  , 240, 260, "UI_Elements/OpenSans-Light", 12)
    DialogText2:setFillColor( 0, 0, 0 )
    DialogText2.alpha = 0

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

    --Sarah Name
    Sarah_Name = display.newText(sceneGroup,"Sarah", 10, 235, "UI_Elements/Ceria-Lebaran", 20)
    Sarah_Name:setFillColor( 0, 0, 0)
    Sarah_Name.alpha = 0

    --Kamali Name
    Kamali_Name = display.newText(sceneGroup,"Kamali", 10, 235, "UI_Elements/Ceria-Lebaran", 20)
    Kamali_Name:setFillColor( 0, 0, 0)
    Kamali_Name.alpha = 0

    --Kamali Poses
    K1 = display.newImageRect( sceneGroup, objectSheet, 1, 240, 360 )
	K1.x = display.contentCenterX + 220
	K1.y = display.contentCenterY - 20
	K1.myName = "K1"
    K1.alpha = 1

    K2 = display.newImageRect( sceneGroup, objectSheet, 2, 160, 300 )
	K2.x = display.contentCenterX + 160
	K2.y = display.contentCenterY - 100
	K2.myName = "K2"
    K2.alpha = 0

    K3 = display.newImageRect( sceneGroup, objectSheet, 3, 140, 300 )
	K3.x = display.contentCenterX + 135
	K3.y = display.contentCenterY - 100
	K3.myName = "K3"
    K3.alpha = 0
    
    --Sarah Poses
    S1 = display.newImageRect( sceneGroup, objectSheet2, 1, 80, 280 )
	S1.x = display.contentCenterX - 40
	S1.y = display.contentCenterY - 100
	S1.myName = "S1"
    S1.alpha = 1

    S2 = display.newImageRect( sceneGroup, objectSheet2, 2, 100, 280 )
	S2.x = display.contentCenterX - 120
	S2.y = display.contentCenterY - 95
	S2.myName = "S2"
    S2.alpha = 0

    S3 = display.newImageRect( sceneGroup, objectSheet2, 3, 80, 280 )
	S3.x = display.contentCenterX - 118
	S3.y = display.contentCenterY + 20
	S3.myName = "S3"
    S3.alpha = 0

    S4 = display.newImageRect( sceneGroup, objectSheet2, 4, 100, 280 )
	S4.x = display.contentCenterX - 180
	S4.y = display.contentCenterY + 18
	S4.myName = "S4"
    S4.alpha = 0

    S5 = display.newImageRect( sceneGroup, objectSheet2, 5, 101, 280 )
	S5.x = display.contentCenterX - 184
	S5.y = display.contentCenterY + 18
	S5.myName = "S5"
    S5.alpha = 0

    -- Sarah walks across the room
    transition.to( S1,{ delay = 3000, time = 1000, alpha = 0})
    transition.to( S2,{ delay = 3000, time = 1000, alpha = 1})
    transition.to( S2,{ delay = 3500, time = 1000, alpha = 0})
    transition.to( S3,{ delay = 3500, time = 1000, alpha = 1})
    transition.to( S3,{ delay = 4000, time = 1000, alpha = 0})
    transition.to( S4,{ delay = 4000, time = 1000, alpha = 1})

    --Button Appears
    transition.to( button,{time = 400 , delay = 3000 ,alpha = 1} )
    transition.to( buttonOuter,{time = 400 , delay = 3000 ,alpha = 1} )

    server_glow()
    bringToFront()

    button:addEventListener( "tap", buttonReappear)
    button:addEventListener( "tap", outerRotate)
    button:addEventListener( "tap", dialogFunction )
    button:addEventListener( "tap", CharControl )
    button:addEventListener( "tap", ClickSound)
    nextButton:addEventListener( "tap", changeScenes ) 
    nextButton:addEventListener( "tap", ClickSound ) 
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