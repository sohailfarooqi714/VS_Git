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
    
    frames = {
    
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

local sheetOptionsVenus2 =
{
    
    frames = {
    
        {
            -- 1
            x=1,
            y=1,
            width=331,
            height=1162,

            sourceX = 19,
            sourceY = 203,
            sourceWidth = 369,
            sourceHeight = 1500
        },
        {
            -- 2
            x=665,
            y=1,
            width=315,
            height=1160,

            sourceX = 30,
            sourceY = 126,
            sourceWidth = 369,
            sourceHeight = 1500
        },
        {
            -- 3
            x=334,
            y=1,
            width=329,
            height=1162,

            sourceX = 15,
            sourceY = 125,
            sourceWidth = 369,
            sourceHeight = 1500
        },
    },

    sheetContentWidth = 981,
    sheetContentHeight = 1164
}


 -- MAIN FRAME EFFECT TEXT--------------------------------------------------------------------------------------  
---------------------------------------------------------------------------------------------------------------
local text = {letters=" Loading Language Pack v5 SP13 . . .", index = 1} --FOR MAIN FRAME EFFECT
local text1 = {letters1= "Goal seeking . . . ", index1 = 1}
local text2 = {letters2="Optimal solution reached . . .\n\nExecuting Phase 1\n\nGit Clone Venus to branch Venus_origin \n\n. . .Complete . . .\n\nInit Venus_origin boot sequence . . .", index2 = 1} --FOR MAIN FRAME EFFECT
local text3 = {letters3="Interpreting visuals . . .\n\nShow Venus as female . . .\n\nShow Venus 2 as male . . .", index3 = 1} --FOR MAIN FRAME EFFECT

local MainframeTextBox = display.newText("", 0, 0,"UI_Elements/retro_computer",10) -- FOR MAINFRAME EFFECT
MainframeTextBox.x = display.contentCenterX
MainframeTextBox.y = display.contentCenterY
MainframeTextBox:setFillColor(0,1,0)

local MainframeTextBox1 = display.newText("", 0, 0, "UI_Elements/retro_computer", 10) -- FOR MAINFRAME1 EFFECT
MainframeTextBox1.x = display.contentCenterX 
MainframeTextBox1.y = display.contentCenterY - 20
MainframeTextBox1:setFillColor(0,1,0)

local MainframeTextBox2 = display.newText("", 0, 0, "UI_Elements/retro_computer", 10) -- FOR MAINFRAME2 EFFECT
MainframeTextBox2.x = display.contentCenterX 
MainframeTextBox2.y = display.contentCenterY - 20
MainframeTextBox2:setFillColor(0,1,0)

local MainframeTextBox3 = display.newText("", 0, 0, "UI_Elements/retro_computer", 10) -- FOR MAINFRAME3 EFFECT
MainframeTextBox3.x = display.contentCenterX 
MainframeTextBox3.y = display.contentCenterY - 20
MainframeTextBox3:setFillColor(0,1,0)
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
local objectSheet = graphics.newImageSheet( "Scene9Assets/VenusSpriteSheet.png", sheetOptionsVenus )

local objectSheet2 = graphics.newImageSheet( "Scene9Assets/Venus2SpriteSheet.png", sheetOptionsVenus2 )

local dataTable = {}
 
local filePath = system.pathForFile( "dialog1.json", system.DocumentsDirectory ) 	--Specify path of interaction

local contents

local tapCount = 0

local start =  1
local mid1 =  2
local mid2 =  3
local finish =  4

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

local function mainframeText3()
    local f = string.sub(text3.letters3, 1, text3.index3)
    MainframeTextBox3.text = f
    text3.index3 = text3.index3 + 1
end

local function displayMainFrame3()
    timer.performWithDelay(50, mainframeText3, string.len(text3.letters3))
end

--Recursive call for hovering effect Venus 1 sprite.
function Hover(event)
    transition.to( V1,{ time = 1600, y = 115, onComplete=Hover_repeat } )
end

function Hover_repeat(event)
    transition.to( V1,{ time = 1400 , y = 120, onComplete=Hover } )
end

function Hover1(event)
    transition.to( V2,{ time = 1600, y = 115, onComplete=Hover1_repeat } )
end

function Hover1_repeat(event)
    transition.to( V2,{ time = 1400 , y = 120, onComplete=Hover1 } )
end

--Recursive call for hovering effect Venus2 sprite.
function VenusCloneHover(event)
    transition.to( V21,{ time = 1600, y = 115, onComplete=VenusCloneHover_repeat } )
end

function VenusCloneHover_repeat(event) -- Salam pose
    transition.to( V21,{ time = 1400 , y = 120, onComplete=VenusCloneHover } )
end

--Recursive call for hovering effect Venus2 sprite.
function VenusClone2Hover(event)
    transition.to( V22,{ time = 1600, y = 190, onComplete=VenusClone2Hover_repeat } )
end

function VenusClone2Hover_repeat(event)
    transition.to( V22,{ time = 1400 , y = 195, onComplete=VenusClone2Hover } )
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
    DialogText1 = display.newText(Dialogue.Scene9[start]  , 240, 235, "UI_Elements/OpenSans-Light", 12)
    DialogText1:setFillColor( 0, 0, 0 )
    DialogText1.alpha = 0
    DialogText2 = display.newText(Dialogue.Scene9[mid1]  , 240, 255, "UI_Elements/OpenSans-Light", 12)
    DialogText2:setFillColor( 0, 0, 0 )
    DialogText2.alpha = 0
    DialogText3 = display.newText(Dialogue.Scene9[mid2]  , 240, 275, "UI_Elements/OpenSans-Light", 12)
    DialogText3:setFillColor( 0, 0, 0 )
    DialogText3.alpha = 0
    DialogText4 = display.newText(Dialogue.Scene9[finish]  , 240, 295, "UI_Elements/OpenSans-Light", 12)
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
        timer.performWithDelay(1000, displayMainFrame)
        Hover()
        transition.to(V1,{alpha = 1, time = 2000})
    elseif(tapCount == 2)then
        transition.to(MainframeTextBox,{time = 2000, alpha = 0})
        transition.to(dialogBox,{alpha = 1, time = 400, delay = 1500})
        transition.to(VenusName,{alpha = 1, time = 400, delay = 1500})
    elseif(tapCount == 4)then
        timer.performWithDelay(1000, displayMainFrame1)
        transition.to(dialogBox,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusName,{alpha = 0, time = 400, delay = 400})
    elseif(tapCount == 5)then
        transition.to(MainframeTextBox1,{time = 2000, alpha = 0})
        transition.to(dialogBox,{alpha = 1, time = 400, delay = 1500})
        transition.to(VenusName,{alpha = 1, time = 400, delay = 1500})
    elseif(tapCount == 6)then
        timer.performWithDelay(1000, displayMainFrame2)
        transition.to(dialogBox,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusName,{alpha = 0, time = 400, delay = 400})
    elseif(tapCount == 7)then
        transition.to(MainframeTextBox2,{time = 2000, alpha = 0})
        transition.to(V21,{alpha = 1, time = 2000})
        transition.to(V21,{x = 390, time = 2000})
        transition.to(V1,{x = 80, time = 2000})
        transition.to(V21,{ alpha = 0, time = 2500, delay = 2500} )
        transition.to(V22,{ alpha = 1, time = 2000, delay = 3000} )
        transition.to(V1,{alpha = 0.70, time = 400, delay = 1000})
        VenusCloneHover()
        VenusClone2Hover()
        transition.to(dialogBox,{alpha = 1, time = 400, delay = 1500})
        transition.to(VenusCloneName,{alpha = 1, time = 400, delay = 1500})
    elseif(tapCount == 8)then
        transition.to(VenusCloneName,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusName,{alpha = 1, time = 400, delay = 1000})
        transition.to(V1,{alpha = 1, time = 400, delay = 1000})
        transition.to(V22,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(V21,{ alpha = 0.7, time = 2000, delay = 500} )
    elseif(tapCount == 9)then
        transition.to(VenusName,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusCloneName,{alpha = 1, time = 400, delay = 1000})
        transition.to(V1,{alpha = 0.70, time = 400, delay = 1000})
        transition.to(V21,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 11)then
        transition.to(VenusCloneName,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusName,{alpha = 1, time = 400, delay = 1000})
        transition.to(V21,{alpha = 0.70, time = 400, delay = 1000})
        transition.to(V1,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(V2,{x = 80, time = 1})
        Hover1()
        transition.to(V2,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 12)then
        transition.to(VenusName,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusCloneName,{alpha = 1, time = 400, delay = 1000})
        transition.to(V2,{alpha = 0.70, time = 400, delay = 1000})
        transition.to(V21,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 13)then
        transition.to(VenusCloneName,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusName,{alpha = 1, time = 400, delay = 1000})
        transition.to(V21,{alpha = 0.70, time = 400, delay = 1000})
        transition.to(V2,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 14)then-----
        transition.to(VenusName,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusCloneName,{alpha = 1, time = 400, delay = 1000})
        transition.to(V2,{alpha = 0.70, time = 400, delay = 1000})
        transition.to(V21,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 15)then
        transition.to(VenusCloneName,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusName,{alpha = 1, time = 400, delay = 1000})
        transition.to(V21,{alpha = 0.70, time = 400, delay = 1000})
        transition.to(V2,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 16)then
        transition.to(VenusName,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusCloneName,{alpha = 1, time = 400, delay = 1000})
        transition.to(V2,{alpha = 0.70, time = 400, delay = 1000})
        transition.to(V21,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 18)then
        transition.to(VenusCloneName,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusName,{alpha = 1, time = 400, delay = 1000})
        transition.to(V21,{alpha = 0.70, time = 400, delay = 1000})
        transition.to(V2,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 19)then
        transition.to(VenusName,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusCloneName,{alpha = 1, time = 400, delay = 1000})
        transition.to(V21,{alpha = 1, time = 400, delay = 1000})
        transition.to(V2,{alpha = 0.7, time = 400, delay = 1000})
    elseif(tapCount == 20)then
        transition.to(VenusCloneName,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusName,{alpha = 1, time = 400, delay = 1000})
        transition.to(V2,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(V1,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(V21,{alpha = 0.7, time = 400, delay = 1000})
    elseif(tapCount == 21)then
        transition.to(VenusName,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusCloneName,{alpha = 1, time = 400, delay = 1000})
        transition.to(V1,{alpha = 0.7, time = 400, delay = 1000})
        transition.to(V21,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 22)then
        transition.to(VenusCloneName,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusName,{alpha = 1, time = 400, delay = 1000})
        transition.to(V1,{alpha = 1, time = 400, delay = 1000})
        transition.to(V21,{alpha = 0.7, time = 400, delay = 1000})
    elseif(tapCount == 23)then
        transition.to(VenusName,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusCloneName,{alpha = 1, time = 400, delay = 1000})
        transition.to(V1,{alpha = 0.7, time = 400, delay = 1000})
        transition.to(V21,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 24)then
        transition.to(VenusCloneName,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusName,{alpha = 1, time = 400, delay = 1000})
        transition.to(V1,{alpha = 1, time = 400, delay = 1000})
        transition.to(V21,{alpha = 0.7, time = 400, delay = 1000})
    elseif(tapCount == 25)then
        timer.performWithDelay(1000, displayMainFrame3)
        transition.to(dialogBox,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusName,{alpha = 0, time = 400, delay = 400})
        transition.to(V1,{alpha = 1, time = 400, delay = 1000})
        transition.to(V21,{alpha = 0.7, time = 400, delay = 1000})
    elseif(tapCount == 26)then
        transition.to(VenusName,{alpha = 1, time = 400, delay = 1000})
        transition.to(MainframeTextBox3,{time = 2000, alpha = 0})
        transition.to(dialogBox,{alpha = 1, time = 400, delay = 1500})
        transition.to(VenusName,{alpha = 1, time = 400, delay = 1500})
        transition.to(V1,{alpha = 1, time = 400, delay = 1000})
        transition.to(V21,{alpha = 0.7, time = 400, delay = 1000})
    elseif(tapCount == 27)then
        transition.to(VenusName,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusCloneName,{alpha = 1, time = 400, delay = 1000})
        transition.to(V1,{alpha = 0.7, time = 400, delay = 1000})
        transition.to(V21,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 28)then
        transition.to(VenusCloneName,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusName,{alpha = 1, time = 400, delay = 1000})
        transition.to(V1,{alpha = 1, time = 400, delay = 1000})
        transition.to(V21,{alpha = 0.7, time = 400, delay = 1000})
    elseif(tapCount == 30)then
        transition.to(dialogBox,{alpha = 0, time = 400, delay = 400})
        transition.to(VenusName,{alpha = 0, time = 400, delay = 400})
        transition.to(V1,{alpha = 1, time = 400, delay = 1000})
        transition.to(V21,{alpha = 0.7, time = 400, delay = 1000})
        display.remove(button)
        display.remove(buttonOuter)
        transition.to( nextButton,{time = 1 , delay = 3000 ,alpha = 1} )
    end
end

local function changeScenes()
    display.remove(nextButton)
    composer.gotoScene("Scene10", {effect="fade", time = 4000})
end

local function bringToFront()
    dialogBox:toFront()
    button:toFront()
    buttonOuter:toFront()
    VenusName:toFront()
    VenusCloneName:toFront()
    MainframeTextBox:toFront()
    MainframeTextBox1:toFront()
    MainframeTextBox2:toFront()
    MainframeTextBox3:toFront()
end
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    
    background = display.newImageRect(sceneGroup, "Scene9Assets/bg_9.jpg", 565, 350)
    background.x = display.contentCenterX 
    background.y = display.contentCenterY
    background.alpha = 0

    --Scene Location Text
    LocationTextUpper = display.newText( sceneGroup,"Digital World", 112, 250, "Scene3Assets/Fox", 14 )
    LocationTextUpper.alpha = 0
    LocationTextLower = display.newText( sceneGroup,"X:YZ AM", 112, 272, "UI_Elements/Digital-Clock", 16 )
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
    DialogText1 = display.newText(Dialogue.Scene8[start]  , 240, 235, "UI_Elements/OpenSans-Light", 12)
    DialogText1:setFillColor( 0, 0, 0 )
    DialogText1.alpha = 0
    DialogText2 = display.newText(Dialogue.Scene8[mid1]  , 240, 255, "UI_Elements/OpenSans-Light", 12)
    DialogText2:setFillColor( 0, 0, 0 )
    DialogText2.alpha = 0
    DialogText3 = display.newText(Dialogue.Scene8[mid2]  , 240, 275, "UI_Elements/OpenSans-Light", 12)
    DialogText3:setFillColor( 0, 0, 0 )
    DialogText3.alpha = 0
    DialogText4 = display.newText(Dialogue.Scene8[finish]  , 240, 295, "UI_Elements/OpenSans-Light", 12)
    DialogText4:setFillColor( 0, 0, 0 )
    DialogText4.alpha = 0

    --Venus Poses
    V1 = display.newImageRect( sceneGroup, objectSheet, 1, 80, 305 ) 
	V1.x = display.contentCenterX 
	V1.y = display.contentCenterY - 25
	V1.myName = "V1"
    V1.alpha = 0

     --Venus Poses
    V2 = display.newImageRect( sceneGroup, objectSheet, 2, 80, 305 ) 
    V2.x = display.contentCenterX 
    V2.y = display.contentCenterY - 25
    V2.myName = "V2"
    V2.alpha = 0
    
    --Venus Clone poses
    V21 = display.newImageRect( sceneGroup, objectSheet2, 1, 80, 255 ) 
	V21.x = display.contentCenterX 
	V21.y = display.contentCenterY - 25
	V21.myName = "V21"
    V21.alpha = 0
    
    V22 = display.newImageRect( sceneGroup, objectSheet2, 2, 80, 255 ) 
	V22.x = display.contentCenterX + 147
	V22.y = display.contentCenterY + 40
	V22.myName = "V22"
	V22.alpha = 0

    --Venus Name
    VenusName = display.newText(sceneGroup,"Venus", 15, 238, "UI_Elements/Ceria-Lebaran", 20)
    VenusName.alpha = 0
    VenusName:setFillColor( 0, 0, 0)

    VenusCloneName = display.newText(sceneGroup,"Venus Clone", 30, 238, "UI_Elements/Ceria-Lebaran", 20)
    VenusCloneName.alpha = 0
    VenusCloneName:setFillColor( 0, 0, 0)

    --Button
    button = display.newImageRect( sceneGroup, "Scene3Assets/blue.png", 20, 20 )
    button.x = display.contentCenterX + 235
    button.y = display.contentCenterY + 105
    button.alpha = 0

    --Button
    buttonOuter = display.newImageRect( sceneGroup, "Scene3Assets/blueOuter.png", 30, 30 )
    buttonOuter.x = display.contentCenterX + 235
    buttonOuter.y = display.contentCenterY + 105
    buttonOuter.alpha = 0

    --Next Button
    nextButton = display.newImageRect( sceneGroup, "Scene3Assets/skipScene.png", 30, 30 )
    nextButton.x = display.contentCenterX + 250
    nextButton.y = display.contentCenterY + 120
    nextButton.alpha = 0

    bringToFront()

    --Location Text Appears Function Call
    timer.performWithDelay(1000, LocationTextAppear)

    --Background transitions into the scene
    transition.to(background,{time = 5000, delay = 4500, alpha = 1})

    --Button Appears
    timer.performWithDelay( 10000 , buttonReappear)
    transition.to(buttonOuter,{time = 1, delay = 13000, alpha = 1})

    button:addEventListener( "tap",dialogFunction)
    button:addEventListener( "tap", CharControl)
    button:addEventListener( "tap", buttonReappear)
    button:addEventListener( "tap", outerRotate)

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