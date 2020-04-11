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
-- ------------------------------------------------------------------------------------

--Conigure Image Sheet
local sheetOptionsVenus =
{
    
    frames = {
    
        {
            -- V1
            x=811,
            y=1,
            width=226,
            height=1000,

        },
        {
            -- V2
            x=1039,
            y=1,
            width=226,
            height=1000,

        },
        {
            -- V3
            x=1,
            y=1,
            width=312,
            height=1000,

        },
        {
            -- VC1
            x=1267,
            y=1,
            width=222,
            height=776,

            sourceX = 8,
            sourceY = 83,
            sourceWidth = 246,
            sourceHeight = 1000
        },
        {
            -- VC2
            x=315,
            y=1,
            width=246,
            height=1000,

        },
        {
            -- VC3
            x=563,
            y=1,
            width=246,
            height=1000,

        },
    },

    sheetContentWidth = 1490,
    sheetContentHeight = 1002
}

----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
local text = {letters="Parsing General Isaac’s Emails - 0800 Hours\n\n50 Hits Matching ‘new project’, ‘closure’ Found", index = 1} --FOR MAIN FRAME EFFECT
local text1 = {letters1= "Run inference module . . . ", index1 = 1}

local MainframeTextBox = display.newText("", 0, 0,"UI_Elements/Digital-System", 17) -- FOR MAINFRAME EFFECT
MainframeTextBox.x = display.contentCenterX
MainframeTextBox.y = display.contentCenterY
MainframeTextBox:setFillColor(0,1,0)

local MainframeTextBox1 = display.newText("", 0, 0, "UI_Elements/Digital-System", 20) -- FOR MAINFRAME1 EFFECT
MainframeTextBox1.x = display.contentCenterX 
MainframeTextBox1.y = display.contentCenterY - 20
MainframeTextBox1:setFillColor(0,1,0)
----------------------------------------------------------------------------------------------------------------------------------
local objectSheet = graphics.newImageSheet( "Scene14Assets/VenusSpriteSheet.png", sheetOptionsVenus )

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
    transition.to( button,{ time = 1 ,delay = 3000 ,alpha = 1} )
end

function outerRotate()
    --Method 2
    transition.to( buttonOuter,{rotation = 360, time = 400} )
    transition.to( buttonOuter,{rotation = 720, time = 400, delay = 800} )
    transition.to( buttonOuter,{rotation = 1080, time = 400, delay = 1600} )
    transition.to( buttonOuter,{rotation = 1440, time = 400, delay = 2400} )
end

--Mainframe Effect Functions
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
    timer.performWithDelay(50, mainframeText1, string.len(text1.letters1))
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

function Hover2(event)
    transition.to( V3,{ time = 1600, y = 115, onComplete=Hover2_repeat } )
end

function Hover2_repeat(event)
    transition.to( V3,{ time = 1400 , y = 120, onComplete=Hover2 } )
end

--Recursive call for hovering effect Venus2 sprite.
function VenusCloneHover(event)
    transition.to( VC1,{ time = 1600, y = 170, onComplete=VenusCloneHover_repeat } )
end

function VenusCloneHover_repeat(event) -- Salam pose
    transition.to( VC1,{ time = 1400 , y = 175, onComplete=VenusCloneHover } )
end

function VenusClone2Hover(event)
    transition.to( VC2,{ time = 1600, y = 120, onComplete=VenusClone2Hover_repeat } )
end

function VenusClone2Hover_repeat(event)
    transition.to( VC2,{ time = 1400 , y = 125, onComplete=VenusClone2Hover } )
end

function VenusClone3Hover(event)
    transition.to( VC3,{ time = 1600, y = 120, onComplete=VenusClone3Hover_repeat } )
end

function VenusClone3Hover_repeat(event) -- Salam pose
    transition.to( VC3,{ time = 1400 , y = 125, onComplete=VenusClone3Hover } )
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
      DialogText1 = display.newText(Dialogue.Scene14[start]  , 240, 240, "UI_Elements/OpenSans-Light", 12)
      DialogText1:setFillColor( 0, 0, 0 )
      DialogText1.alpha = 0
      DialogText2 = display.newText(Dialogue.Scene14[mid1]  , 240, 260, "UI_Elements/OpenSans-Light", 12)
      DialogText2:setFillColor( 0, 0, 0 )
      DialogText2.alpha = 0
      DialogText3 = display.newText(Dialogue.Scene14[mid2]  , 240, 280, "UI_Elements/OpenSans-Light", 12)
      DialogText3:setFillColor( 0, 0, 0 )
      DialogText3.alpha = 0
      DialogText4 = display.newText(Dialogue.Scene14[finish]  , 240, 300, "UI_Elements/OpenSans-Light", 12)
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
        transition.to(MainframeTextBox,{alpha = 0, time = 800, delay = 400})
        transition.to( V1,{time = 2500, delay = 3000, alpha = 1})
        Hover()
        transition.to(background,{time = 4500, delay = 6000, alpha = 1})
    elseif(tapCount == 2)then
        transition.to(dialogBox,{time = 400, delay = 1000, alpha = 0.85})
        transition.to(VenusName,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 4)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusClone,{time = 400, delay = 1000, alpha = 1})
        transition.to(V1,{x = 80, time = 2000})
        transition.to(V2,{x = 80, time = 2000})
        transition.to(V3,{x = 80, time = 2000})
        VenusCloneHover()
        transition.to(VC1,{alpha = 1, time = 2000})
        transition.to(VC1,{x = 390, time = 2000})
        transition.to(VC2,{x = 390, time = 2000})
        transition.to(VC3,{x = 390, time = 2000})
        transition.to(V1, {time = 1000, delay = 400, alpha = 0.75})
    elseif(tapCount == 5)then
        transition.to(VenusClone,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
        transition.to(V1,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(V2,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(VC1, {time = 1000, delay = 400, alpha = 0.75})
        Hover1()
    elseif(tapCount == 6)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusClone,{time = 400, delay = 1000, alpha = 1})
        transition.to(VC1, {time = 1000, delay = 400, alpha = 1})
        transition.to(V2, {time = 1000, delay = 400, alpha = 0.75})
    elseif(tapCount == 8)then
        transition.to(VenusClone,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
        transition.to(V2, {time = 1000, delay = 400, alpha = 1})
        transition.to(VC1, {time = 1000, delay = 400, alpha = 0.75})
    elseif(tapCount == 10)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusClone,{time = 400, delay = 1000, alpha = 1})
        transition.to(VC1,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(VC2,{ alpha = 1, time = 2000, delay = 500} )
        VenusClone2Hover()
        transition.to(V2, {time = 1000, delay = 400, alpha = 0.75})
    elseif(tapCount == 13)then
        transition.to(VenusClone,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
        transition.to(V2,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(V1,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(VC2, {time = 1000, delay = 400, alpha = 0.75})
    elseif(tapCount == 14)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusClone,{time = 400, delay = 1000, alpha = 1})
        transition.to(VC2, {time = 1000, delay = 400, alpha = 1})
        transition.to(V1,  {time = 2000, delay = 500, alpha = 0.75} )
    elseif(tapCount == 15)then
        transition.to(VenusClone,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
        transition.to(V1,  {time = 2000, delay = 500, alpha = 1} )
        transition.to(VC2, {time = 1000, delay = 400, alpha = 0.75})
    elseif(tapCount == 16)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusClone,{time = 400, delay = 1000, alpha = 1})
        transition.to(VC2, {time = 1000, delay = 400, alpha = 1})
        transition.to(V1,  {time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 19)then
        transition.to(VenusClone,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
        transition.to(V1, {time = 1000, delay = 400, alpha = 1})
        transition.to(VC2,  {time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 21)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusClone,{time = 400, delay = 1000, alpha = 1})
        transition.to(VC2, {time = 1000, delay = 400, alpha = 1})
        transition.to(V1,  {time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 23)then
        transition.to(VenusClone,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
        transition.to(V1, {time = 1000, delay = 400, alpha = 1})
        transition.to(VC2,  {time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 24)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusClone,{time = 400, delay = 1000, alpha = 1})
        transition.to(VC2, {time = 1000, delay = 400, alpha = 1})
        transition.to(V1,  {time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 26)then
        transition.to(VenusClone,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
        transition.to(V1, {time = 1000, delay = 400, alpha = 1})
        transition.to(VC2,  {time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 27)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusClone,{time = 400, delay = 1000, alpha = 1})
        VenusClone3Hover()
        transition.to(VC2,  {time = 1000, delay = 400, alpha = 1} )
        transition.to(V1,  {time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 28)then
        displayMainFrame1()
        transition.to(dialogBox,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusClone,{time = 400, delay = 400, alpha = 0})
        transition.to(V1,  {time = 1000, delay = 400, alpha = 1} )
        transition.to(VC2,  {time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 29)then
        transition.to(MainframeTextBox1,{alpha = 0, time = 800, delay = 400})
        transition.to(dialogBox,{time = 400, delay = 1000, alpha = 0.85})
        transition.to(VenusClone,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
    elseif(tapCount == 30)then
        transition.to(V1,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(V2,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 31)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusClone,{time = 400, delay = 1000, alpha = 1})
        transition.to(VC2, {time = 1000, delay = 400, alpha = 1})
        transition.to(V2,  {time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 32)then
        transition.to(VenusClone,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
        transition.to(V2, {time = 1000, delay = 400, alpha = 1})
        transition.to(VC2,  {time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 33)then
        transition.to(V2,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(V3,{ alpha = 1, time = 2000, delay = 500} )
        Hover2()
    elseif(tapCount == 34)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusClone,{time = 400, delay = 1000, alpha = 1})
        transition.to(VC2,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(VC3,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(V3,  {time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 35)then
        transition.to(VenusClone,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
        transition.to(V3,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(V1,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(VC3,  {time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 36)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusClone,{time = 400, delay = 1000, alpha = 1})
        transition.to(VC3,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(VC2,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(V1,  {time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 37)then
        transition.to(VenusClone,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
        transition.to(V1,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(V2,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(VC2,  {time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 39)then
        transition.to(V2,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(V1,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 40)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusClone,{time = 400, delay = 1000, alpha = 1})
        transition.to(VC2,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(VC3,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(V1,  {time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 41)then
        transition.to(VenusClone,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
        transition.to(V1,  {time = 1000, delay = 400, alpha = 1} )
        transition.to(VC3,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 44)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusClone,{time = 400, delay = 1000, alpha = 1})
        transition.to(VC3,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(VC1,{ alpha = 1, time = 2000, delay = 500} ) 
        transition.to(V1,  {time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 45)then
        transition.to(VenusClone,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
        transition.to(V1,{time = 1000, delay = 400, alpha = 1} )
        transition.to(VC1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 46)then
        transition.to(VenusName,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusClone,{time = 400, delay = 1000, alpha = 1})
        transition.to(VC1,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(VC2,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(V1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 47)then
        transition.to(VenusClone,{time = 400, delay = 400, alpha = 0})
        transition.to(VenusName,{time = 400, delay = 1000, alpha = 1})
        transition.to(V1,{time = 1000, delay = 400, alpha = 1} )
        transition.to(VC2,{time = 1000, delay = 400, alpha = 0.75} )
    end
end
 
local function bringToFront()
    dialogBox:toFront()
    button:toFront()
    buttonOuter:toFront()
    VenusName:toFront()
    VenusClone:toFront()
end
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    --Scene Background
    background = display.newImageRect( sceneGroup, "Scene14Assets/bg_14.jpg", 565, 350)
    background.x = display.contentCenterX 
    background.y = display.contentCenterY
    background.alpha = 0

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
    dialogBox = display.newImageRect( sceneGroup, "Scene3Assets/textbox.png", 550, 110)
    dialogBox.x = display.contentCenterX 
    dialogBox.y = display.contentCenterY + 100
    dialogBox.alpha = 0

    --Dialogue Strings
    DialogText1 = display.newText(Dialogue.Scene14[start]  , 240, 240, "UI_Elements/OpenSans-Light", 12)
    DialogText1:setFillColor( 0, 0, 0 )
    DialogText1.alpha = 0
    DialogText2 = display.newText(Dialogue.Scene14[mid1]  , 240, 260, "UI_Elements/OpenSans-Light", 12)
    DialogText2:setFillColor( 0, 0, 0 )
    DialogText2.alpha = 0
    DialogText3 = display.newText(Dialogue.Scene14[mid2]  , 240, 280, "UI_Elements/OpenSans-Light", 12)
    DialogText3:setFillColor( 0, 0, 0 )
    DialogText3.alpha = 0
    DialogText4 = display.newText(Dialogue.Scene14[finish]  , 240, 300, "UI_Elements/OpenSans-Light", 12)
    DialogText4:setFillColor( 0, 0, 0 )
    DialogText4.alpha = 0

    --Venus Poses
    V1 = display.newImageRect( sceneGroup, objectSheet, 1, 75, 305 ) 
	V1.x = display.contentCenterX 
	V1.y = display.contentCenterY - 25
	V1.myName = "V1"
    V1.alpha = 0

    V2 = display.newImageRect( sceneGroup, objectSheet, 2, 75, 305 ) 
    V2.x = display.contentCenterX 
    V2.y = display.contentCenterY - 25
    V2.myName = "V2"
    V2.alpha = 0

    V3 = display.newImageRect( sceneGroup, objectSheet, 3, 98, 305 ) 
    V3.x = display.contentCenterX 
    V3.y = display.contentCenterY - 25
    V3.myName = "V3"
    V3.alpha = 0

    VC1 = display.newImageRect( sceneGroup, objectSheet, 4, 75, 265 ) 
    VC1.x = display.contentCenterX 
    VC1.y = display.contentCenterY + 20
    VC1.myName = "VC1"
    VC1.alpha = 0

    VC2 = display.newImageRect( sceneGroup, objectSheet, 5, 95, 345 ) 
    VC2.x = display.contentCenterX
    VC2.y = display.contentCenterY - 40
    VC2.myName = "VC2"
    VC2.alpha = 0

    VC3 = display.newImageRect( sceneGroup, objectSheet, 6, 95, 345 ) 
    VC3.x = display.contentCenterX
    VC3.y = display.contentCenterY - 40
    VC3.myName = "VC3"
    VC3.alpha = 0

    --Venus Name
    VenusName = display.newText(sceneGroup,"Venus", 20, 235, "UI_Elements/Ceria-Lebaran", 20)
    VenusName:setFillColor( 0, 0, 0)
    VenusName.alpha = 0

    --Kamali Name
    VenusClone = display.newText(sceneGroup,"Venus Clone", 30, 235, "UI_Elements/Ceria-Lebaran", 20)
    VenusClone:setFillColor( 0, 0, 0)
    VenusClone.alpha = 0

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

    displayMainFrame()

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