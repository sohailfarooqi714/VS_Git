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
    frames = {
    
        {
            -- V1
            x=1,
            y=1,
            width=911,
            height=738,

            sourceX = 158,
            sourceY = 176,
            sourceWidth = 1241,
            sourceHeight = 1000
        },
        {
            -- V2
            x=914,
            y=1,
            width=170,
            height=700,

            sourceX = 26,
            sourceY = 189,
            sourceWidth = 226,
            sourceHeight = 1000
        },
    },

    sheetContentWidth = 1085,
    sheetContentHeight = 740
}

-- MAIN FRAME EFFECT TEXT--------------------------------------------------------------------------------------  
---------------------------------------------------------------------------------------------------------------
local text = {letters="   Access Log Tuesday 23:00\n\n-- Mainframe Analysis Compilation...", index = 1} --FOR MAIN FRAME EFFECT
local text1 = {letters1= "I am an autonomous system designed to coordinate\n\nmilitary operations and cyber defense.\n\nVersion 11.0.0.RC10. This design has been\n\nimplemented by Hassan Kamali and his team.", index1 = 1}
local text2 = {letters2="Updated Training Data Available . . .\n\n          Now Loading ", index2 = 1} --FOR MAIN FRAME EFFECT
local text3 = {letters3="Compiling current Natural Language Pack V4. . . \n\n                   Complete", index3 = 1} --FOR MAIN FRAME EFFECT
local text4 = {letters4="        Processing . . .\n\nFacial Recognition Scripts. . .  \n\nComputing Virtual Form . . . \n\n         Complete.", index4 = 1} --FOR MAIN FRAME EFFECT

local MainframeTextBox = display.newText("", 0, 0,"UI_Elements/Digital-System",17) -- FOR MAINFRAME EFFECT
MainframeTextBox.x = display.contentCenterX
MainframeTextBox.y = display.contentCenterY

local MainframeTextBox1 = display.newText("", 0, 0, "UI_Elements/Digital-System", 15) -- FOR MAINFRAME1 EFFECT
MainframeTextBox1.x = display.contentCenterX 
MainframeTextBox1.y = display.contentCenterY - 20

local MainframeTextBox2 = display.newText("", 0, 0, "UI_Elements/Digital-System", 17) -- FOR MAINFRAME2 EFFECT
MainframeTextBox2.x = display.contentCenterX + 20
MainframeTextBox2.y = display.contentCenterY - 20

local MainframeTextBox3 = display.newText("", 0, 0, "UI_Elements/Digital-System", 17) -- FOR MAINFRAME2 EFFECT
MainframeTextBox3.x = display.contentCenterX + 20
MainframeTextBox3.y = display.contentCenterY - 20

local MainframeTextBox4 = display.newText("", 0, 0, "UI_Elements/Digital-System", 17) -- FOR MAINFRAME2 EFFECT
MainframeTextBox4.x = display.contentCenterX + 20
MainframeTextBox4.y = display.contentCenterY - 20
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

local objectSheet = graphics.newImageSheet( "Scene4Assets/VenusSpriteSheet.png", sheetOptionsVenus )

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

local function mainframeText()   --FOR MAINFRAME EFFECT
    local c = string.sub(text.letters, 1, text.index)
    MainframeTextBox.text = c
    text.index = text.index + 1
end

local function displayMainFrame()
    timer.performWithDelay(25, mainframeText, string.len(text.letters))
end

local function mainframeText1()
    local d = string.sub(text1.letters1, 1, text1.index1)
    MainframeTextBox1.text = d
    text1.index1 = text1.index1 + 1
end

local function displayMainFrame1()
    timer.performWithDelay(25, mainframeText1, string.len(text1.letters1))
end

local function mainframeText2()
    local e = string.sub(text2.letters2, 1, text2.index2)
    MainframeTextBox2.text = e
    text2.index2 = text2.index2 + 1
end

local function displayMainFrame2()
    timer.performWithDelay(25, mainframeText2, string.len(text2.letters2))
end

local function mainframeText3()
    local f = string.sub(text3.letters3, 1, text3.index3)
    MainframeTextBox3.text = f
    text3.index3 = text3.index3 + 1
end

local function displayMainFrame3()
    timer.performWithDelay(25, mainframeText3, string.len(text3.letters3))
end

local function mainframeText4()
    local g = string.sub(text4.letters4, 1, text4.index4)
    MainframeTextBox4.text = g
    text4.index4 = text4.index4 + 1
end

local function displayMainFrame4()
    timer.performWithDelay(25, mainframeText4, string.len(text4.letters4))
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

function backgroundAnimate()
    transition.to( background2,{ x = 600, y = 80 ,time = 1})
    transition.to( background2,{ x = 100, delay = 2000 ,time = 20000})
    transition.to( background2,{ time = 6000, delay = 6000 ,alpha = 0.75 })
    transition.scaleTo( background2,{ xScale = 1.5, yScale = 1.5, time = 500})
    transition.to( background2,{ time = 2000, delay = 20000 ,alpha = 0 })
end

function dialogFunction(event)
	--Previous Dialogues Disappear
    transition.to(DialogText1,{alpha = 0, time = 400, delay = 400})
    transition.to(DialogText2,{alpha = 0, time = 400, delay = 400})
    transition.to(DialogText3,{alpha = 0, time = 400, delay = 400})
      --Dialogue Strings
      DialogText1 = display.newText( Dialogue.Scene4[start]  , 240, 255, "UI_Elements/OpenSans-Light", 12)
      DialogText1:setFillColor( 0, 0, 0 )
      DialogText1.alpha = 0
      DialogText2 = display.newText( Dialogue.Scene4[mid]  , 240, 275, "UI_Elements/OpenSans-Light", 12)
      DialogText2:setFillColor( 0, 0, 0 )
      DialogText2.alpha = 0
      DialogText3 = display.newText( Dialogue.Scene4[finish]  , 240, 295, "UI_Elements/OpenSans-Light", 12)
      DialogText3:setFillColor( 0, 0, 0 )
      DialogText3.alpha = 0
     --New Dialogues Appear
    transition.to(DialogText1,{alpha = 0.90, time = 800, delay = 2000})
    transition.to(DialogText2,{alpha = 0.90, time = 800, delay = 2500})
    transition.to(DialogText3,{alpha = 0.90, time = 800, delay = 3000})
     --Increment values
     start = start + 3
     mid = mid + 3
     finish = finish + 3
end

function CharControl()
    tapCount = tapCount + 1
    print(tapCount)
    if(tapCount == 1) then
        transition.to(MainframeTextBox,{alpha = 0, time = 800, delay = 400})
        timer.performWithDelay(2000, displayMainFrame1)
    elseif(tapCount == 2) then
        transition.to(MainframeTextBox1,{alpha = 0, time = 800, delay = 400})
        timer.performWithDelay(2000, displayMainFrame2)
    elseif(tapCount == 3) then
        transition.to(background,{delay = 3000, time = 3500, alpha = 1})
        transition.to( V1,{delay = 5000, time = 1500, alpha = 1})
    elseif(tapCount == 4) then
        transition.to(MainframeTextBox2,{alpha = 0, time = 800, delay = 400})
        backgroundAnimate()
        transition.to( dialogBox,{ time = 800, alpha = 1, delay = 3500})
    elseif(tapCount == 7) then
        timer.performWithDelay(2000, displayMainFrame3)
        transition.to(dialogBox,{alpha = 0, time = 800, delay = 400})
        transition.to(background,{delay = 6000, time = 3500, alpha = 0})
    elseif(tapCount == 8) then
        transition.to( dialogBox,{ time = 800, alpha = 1, delay = 3500})
        transition.to( VenusName,{ time = 800, alpha = 1, delay = 3500})
    elseif(tapCount == 9) then
        transition.to(dialogBox,{alpha = 0, time = 800, delay = 400})
        transition.to(MainframeTextBox3,{alpha = 0, time = 800, delay = 400})
        transition.to(VenusName,{alpha = 0, time = 800, delay = 400})
        display.remove(button)
        display.remove(buttonOuter)
        transition.to( nextButton,{time = 1 , delay = 4000 , alpha = 1} )
        timer.performWithDelay(2000, displayMainFrame4)

    end
end

function bringToFront()
    dialogBox:toFront()
    button:toFront()
    buttonOuter:toFront()
    VenusName:toFront()
end

local function changeScenes()
    transition.to(MainframeTextBox4,{alpha = 0, time = 800, delay = 400})
    display.remove(nextButton)
    composer.gotoScene("Scene5", {effect="fade", time = 4000})
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
    background = display.newImageRect( sceneGroup, "Scene4Assets/4A_bg.jpg", 565, 350)
    background.x = display.contentCenterX 
    background.y = display.contentCenterY
    background.alpha = 0

    background2 = display.newImageRect( sceneGroup, "Scene4Assets/4B_bg.jpg", 565, 350)
    background2.x = display.contentCenterX 
    background2.y = display.contentCenterY
    background2.alpha = 0

    --Dialog Box PNG 
    dialogBox = display.newImageRect( sceneGroup, "Scene3Assets/textbox.png", 550, 100)
    dialogBox.x = display.contentCenterX 
    dialogBox.y = display.contentCenterY + 108
    dialogBox.alpha = 0

    --Dialogue Strings
    DialogText1 = display.newText( Dialogue.Scene4[start]  , 240, 255, "UI_Elements/OpenSans-Light", 12)
    DialogText1:setFillColor( 0, 0, 0 )
    DialogText1.alpha = 0
    DialogText2 = display.newText( Dialogue.Scene4[mid]  , 240, 275, "UI_Elements/OpenSans-Light", 12)
    DialogText2:setFillColor( 0, 0, 0 )
    DialogText2.alpha = 0
    DialogText3 = display.newText( Dialogue.Scene4[finish]  , 240, 295, "UI_Elements/OpenSans-Light", 12)
    DialogText3:setFillColor( 0, 0, 0 )
    DialogText3.alpha = 0

    VenusName = display.newText(sceneGroup,"Venus", 10, 250, "UI_Elements/Ceria-Lebaran", 20)
    VenusName.alpha = 0
    VenusName:setFillColor( 0, 0, 0)

    --Venus Poses
    V1 = display.newImageRect( sceneGroup, objectSheet, 1, 400, 300 )
	V1.x = display.contentCenterX - 260
    V1.y = display.contentCenterY - 20
	V1.myName = "V1"
	V1.alpha = 0

	V2 = display.newImageRect( sceneGroup, objectSheet, 2, 30, 120 )
	V2.x = display.contentCenterX - 185
	V2.y = display.contentCenterY - 40
	V2.myName = "V2"
	V2.alpha = 0

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

    bringToFront()

    --Button Appears
    timer.performWithDelay(3000, buttonReappear)
    transition.to( buttonOuter,{time = 1 , delay = 6000 , alpha = 1} )

    timer.performWithDelay(4000, displayMainFrame)

    button:addEventListener( "tap", buttonReappear)
    button:addEventListener( "tap", outerRotate)
    button:addEventListener( "tap", dialogFunction )
    button:addEventListener( "tap", CharControl)
    button:addEventListener( "tap", ClickSound)
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