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
local sheetOptionsKamali =
{
    
    frames = {
    
        {
            -- K1
            x=1,
            y=1,
            width=404,
            height=500,

        },
        {
            -- K2
            x=1,
            y=503,
            width=404,
            height=500,

        },
        {
            -- K3
            x=407,
            y=1,
            width=404,
            height=500,

        },
        {
            -- K4
            x=407,
            y=503,
            width=404,
            height=500,

        },
        {
            -- K5
            x=813,
            y=1,
            width=404,
            height=500,

        },
        {
            -- K6
            x=813,
            y=503,
            width=404,
            height=500,

        },
        {
            -- K7
            x=1219,
            y=1,
            width=404,
            height=500,

        },
        {
            -- K8
            x=1625,
            y=1,
            width=404,
            height=500,

        },
        {
            -- K9
            x=1219,
            y=503,
            width=404,
            height=500,

        },
    },

    sheetContentWidth = 2030,
    sheetContentHeight = 1004
}

--Conigure Image Sheet
local sheetOptionsVenus =
{
    
    frames = {
    
        {
            -- Venus2
            x=1,
            y=1,
            width=265,
            height=932,

            sourceX = 15,
            sourceY = 161,
            sourceWidth = 295,
            sourceHeight = 1200
        },
        {
            -- Venus2Salam
            x=533,
            y=1,
            width=253,
            height=930,

            sourceX = 23,
            sourceY = 100,
            sourceWidth = 295,
            sourceHeight = 1200
        },
        {
            -- Venus2Smile
            x=268,
            y=1,
            width=263,
            height=930,

            sourceX = 12,
            sourceY = 100,
            sourceWidth = 295,
            sourceHeight = 1200
        },
    },

    sheetContentWidth = 787,
    sheetContentHeight = 934
}
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
local text = {letters=" Accessing Remote System PRJVENUS@Hkamali_PC \n       Run sound_recorder.rb script . . . \n         . . . Complete... \n          System Microphone Accessible. \n        Run webcam -p /var/www . . . \n         . . . Complete . . . \n  System Camera Accessible. \n  Accessing Text Communication Permissions \n         Overriding . . . . . . Complete. \n        Command Line Accessible.", index = 1} --FOR MAIN FRAME EFFECT
local text1 = {letters1= "Disambiguation:\n\n1) Skynet from the movie franchise.\n\n2) A Russian airline.\n\n3) A worldwide express shipping network.\n\n4) A satellite television provider in Myanmar.", index1 = 1}

local MainframeTextBox = display.newText("", 0, 0,"UI_Elements/Digital-System", 17) -- FOR MAINFRAME EFFECT
MainframeTextBox.x = display.contentCenterX
MainframeTextBox.y = display.contentCenterY
MainframeTextBox:setFillColor(0,1,0)

local MainframeTextBox1 = display.newText("", 0, 0, "UI_Elements/Digital-System", 17) -- FOR MAINFRAME1 EFFECT
MainframeTextBox1.x = display.contentCenterX - 100
MainframeTextBox1.y = display.contentCenterY - 50
MainframeTextBox1:setFillColor(0,1,0)
--------------------------------------------------------------------------------------------------------------
local objectSheet = graphics.newImageSheet( "Scene11Assets/KamaliSpriteSheet.png", sheetOptionsKamali )
local objectSheet2 = graphics.newImageSheet( "Scene11Assets/VenusSpriteSheet.png", sheetOptionsVenus )

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
    timer.performWithDelay(25, mainframeText1, string.len(text1.letters1))
end

--Venus Hover Functions
function Hover1(event)
    transition.to( V1,{ time = 1600, y = 110, onComplete=Hover_repeat1 } )
end

function Hover_repeat1(event)
    transition.to( V1,{ time = 1400 , y = 116, onComplete=Hover1 } )
end

function Hover2(event)
    transition.to( V2,{ time = 1600, y = 110, onComplete=Hover_repeat2 } )
end

function Hover_repeat2(event)
    transition.to( V2,{ time = 1400 , y = 116, onComplete=Hover2 } )
end

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
      DialogText1 = display.newText(Dialogue.Scene11[start]  , 240, 240, "UI_Elements/OpenSans-Light", 12)
      DialogText1:setFillColor( 0, 0, 0 )
      DialogText1.alpha = 0
      DialogText2 = display.newText(Dialogue.Scene11[mid1]  , 240, 260, "UI_Elements/OpenSans-Light", 12)
      DialogText2:setFillColor( 0, 0, 0 )
      DialogText2.alpha = 0
      DialogText3 = display.newText(Dialogue.Scene11[mid2]  , 240, 280, "UI_Elements/OpenSans-Light", 12)
      DialogText3:setFillColor( 0, 0, 0 )
      DialogText3.alpha = 0
      DialogText4 = display.newText(Dialogue.Scene11[finish]  , 240, 300, "UI_Elements/OpenSans-Light", 12)
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
        transition.to(Kamali_Name,{alpha = 1, time = 400, delay = 1000})
        transition.to(dialogBox,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 3)then
        transition.to( K7,{ alpha = 0, time = 2500, delay = 500} )
        transition.to( K6,{ alpha = 1, time = 1000, delay = 500} )
    elseif(tapCount == 4)then
        transition.to( K6,{ alpha = 0, time = 2500, delay = 500} )
        transition.to( K5,{ alpha = 1, time = 1000, delay = 500} )
        transition.to( background, {alpha = 0, time = 4000, delay = 4000})
        transition.to( K5, {alpha = 0, time = 4000, delay = 4000})
        transition.to( dialogBox, {alpha = 0, time = 4000, delay = 4000})
        transition.to( Kamali_Name, {alpha = 0, time = 4000, delay = 4000})
        timer.performWithDelay(6000, displayMainFrame)
        Hover1()
        transition.to(V1, {time = 2500, delay = 10000, alpha = 1})
    elseif(tapCount == 5)then
        transition.to(MainframeTextBox,{alpha = 0, time = 800, delay = 400})
        transition.to(DialogText1V,{alpha = 1, time = 800, delay = 1000})
        transition.to(DialogText2V,{alpha = 1, time = 800, delay = 1500})
        transition.to(DialogText3V,{alpha = 1, time = 800, delay = 2000})
        transition.to(DialogText4V,{alpha = 1, time = 800, delay = 2500})
    elseif(tapCount == 6)then
        transition.to(dialogBox,{alpha = 1, time = 400, delay = 1500})
        transition.to(Kamali_Name,{alpha = 1, time = 400, delay = 1500})
        transition.to(V1 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to(K1 ,{time = 2000, delay = 500, alpha = 1})
    elseif(tapCount == 7)then
        transition.to( K1,{ alpha = 0, time = 2500, delay = 500} )
        transition.to( K2,{ alpha = 1, time = 1000, delay = 500} )
    elseif(tapCount == 8)then
        transition.to( K2,{ alpha = 0, time = 2500, delay = 500} )
        transition.to( K7,{ alpha = 1, time = 1000, delay = 500} )
    elseif(tapCount == 9)then
        transition.to( K7,{ alpha = 0, time = 2500, delay = 500} )
        transition.to( K1,{ alpha = 1, time = 1000, delay = 500} )
    elseif(tapCount == 11)then
        transition.to( K1,{ alpha = 0, time = 2500, delay = 500} )
        transition.to( K5,{ alpha = 1, time = 1000, delay = 500} )
    elseif(tapCount == 12)then
        transition.to(Kamali_Name,{alpha = 0, time = 400, delay = 400})
        transition.to(Venus_Name,{alpha = 1, time = 400, delay = 1000})
        transition.to(K5 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to(V1 ,{time = 1000, delay = 400, alpha = 1})
    elseif(tapCount == 13)then
        transition.to(Venus_Name,{alpha = 0, time = 400, delay = 400})
        transition.to(Kamali_Name,{alpha = 1, time = 400, delay = 1000})
        transition.to(V1 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to(K5 ,{time = 1000, delay = 400, alpha = 1})
    elseif(tapCount == 15)then
        transition.to(Kamali_Name,{alpha = 0, time = 400, delay = 400})
        transition.to(Venus_Name,{alpha = 1, time = 400, delay = 1000})
        transition.to(K5 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to(V1 ,{time = 1000, delay = 400, alpha = 1})
    elseif(tapCount == 17)then
        transition.to(Venus_Name,{alpha = 0, time = 400, delay = 400})
        transition.to(Kamali_Name,{alpha = 1, time = 400, delay = 1000})
        transition.to(V1 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to( K5,{ alpha = 0, time = 2500, delay = 500} )
        transition.to( K8,{ alpha = 1, time = 1000, delay = 500} )
    elseif(tapCount == 19)then
        transition.to(Kamali_Name,{alpha = 0, time = 400, delay = 400})
        transition.to(Venus_Name,{alpha = 1, time = 400, delay = 1000})
        transition.to(K8 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to(V1 ,{time = 1000, delay = 400, alpha = 1})
    elseif(tapCount == 21)then
        transition.to(Venus_Name,{alpha = 0, time = 400, delay = 400})
        transition.to(Kamali_Name,{alpha = 1, time = 400, delay = 1000})
        transition.to(V1 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to( K8,{ alpha = 0, time = 2500, delay = 500} )
        transition.to( K7,{ alpha = 1, time = 1000, delay = 500} )
    elseif(tapCount == 22)then
        transition.to(Kamali_Name,{alpha = 0, time = 400, delay = 400})
        transition.to(Venus_Name,{alpha = 1, time = 400, delay = 1000})
        transition.to(K7 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to(V1 ,{time = 1000, delay = 400, alpha = 1})
    elseif(tapCount == 26)then
        transition.to(Venus_Name,{alpha = 0, time = 400, delay = 400})
        transition.to(Kamali_Name,{alpha = 1, time = 400, delay = 1000})
        transition.to(V1 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to(K7,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(K9,{ alpha = 1, time = 1000, delay = 500} )
    elseif(tapCount == 28)then
        transition.to(Kamali_Name,{alpha = 0, time = 400, delay = 400})
        transition.to(Venus_Name,{alpha = 1, time = 400, delay = 1000})
        transition.to(K9 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to(V1 ,{time = 1000, delay = 400, alpha = 1})
    elseif(tapCount == 29)then
        transition.to(Venus_Name,{alpha = 0, time = 400, delay = 400})
        transition.to(Kamali_Name,{alpha = 1, time = 400, delay = 1000})
        transition.to(V1 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to(K9 ,{time = 1000, delay = 400, alpha = 1})
    elseif(tapCount == 30)then
        transition.to(Kamali_Name,{alpha = 0, time = 400, delay = 400})
        transition.to(Venus_Name,{alpha = 1, time = 400, delay = 1000})
        transition.to(K9 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to(V1 ,{time = 1000, delay = 400, alpha = 1})
    elseif(tapCount == 32)then
        transition.to(Venus_Name,{alpha = 0, time = 400, delay = 400})
        transition.to(Kamali_Name,{alpha = 1, time = 400, delay = 1000})
        transition.to(V1 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to(K9,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(K4,{ alpha = 1, time = 1000, delay = 500} )
    elseif(tapCount == 33)then
        transition.to(Kamali_Name,{alpha = 0, time = 400, delay = 400})
        transition.to(Venus_Name,{alpha = 1, time = 400, delay = 1000})
        transition.to(K4 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to(V1 ,{time = 1000, delay = 400, alpha = 1})
    elseif(tapCount == 36)then
        transition.to(Venus_Name,{alpha = 0, time = 400, delay = 400})
        transition.to(Kamali_Name,{alpha = 1, time = 400, delay = 1000})
        transition.to(V1 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to(K4,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(K1,{ alpha = 1, time = 1000, delay = 500} )
    elseif(tapCount == 38)then
        transition.to(Kamali_Name,{alpha = 0, time = 400, delay = 400})
        transition.to(Venus_Name,{alpha = 1, time = 400, delay = 1000})
        transition.to(K1 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to(V1 ,{time = 1000, delay = 400, alpha = 1})
    elseif(tapCount == 41)then
        transition.to(Venus_Name,{alpha = 0, time = 400, delay = 400})
        transition.to(Kamali_Name,{alpha = 1, time = 400, delay = 1000})
        transition.to(V1 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to(K1,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(K2,{ alpha = 1, time = 1000, delay = 500} )
    elseif(tapCount == 42)then
        transition.to(Kamali_Name,{alpha = 0, time = 400, delay = 400})
        transition.to(Venus_Name,{alpha = 1, time = 400, delay = 1000})
        transition.to(K2 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to(V1 ,{time = 1000, delay = 400, alpha = 1})
        transition.to(background, {time = 3000, delay = 1000, alpha = 1})
        transition.to(DialogText1V,{alpha = 0, time = 400, delay = 400})
        transition.to(DialogText2V,{alpha = 0, time = 400, delay = 400})
        transition.to(DialogText3V,{alpha = 0, time = 400, delay = 400})
        transition.to(DialogText4V,{alpha = 0, time = 400, delay = 400})
    elseif(tapCount == 44)then
        transition.to(Venus_Name,{alpha = 0, time = 400, delay = 400})
        transition.to(Kamali_Name,{alpha = 1, time = 400, delay = 1000})
        transition.to(V1 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to(K2,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(K9,{ alpha = 1, time = 1000, delay = 500} )
    elseif(tapCount == 46)then
        transition.to(Kamali_Name,{alpha = 0, time = 400, delay = 400})
        transition.to(Venus_Name,{alpha = 1, time = 400, delay = 1000})
        transition.to(K9 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to(V1 ,{time = 1000, delay = 400, alpha = 1})
        timer.performWithDelay(1000, displayMainFrame1)
    elseif(tapCount == 47)then
        transition.to(Venus_Name,{alpha = 0, time = 400, delay = 400})
        transition.to(Kamali_Name,{alpha = 1, time = 400, delay = 1000})
        transition.to(V1 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to(K9,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(K5,{ alpha = 1, time = 1000, delay = 500} )
        display.remove(button)
        display.remove(buttonOuter)
        transition.to(nextButton,{time = 3000, delay = 1000, alpha = 1})
    end
end

local function changeScenes()
    transition.to(MainframeTextBox1,{time = 4000, alpha = 0})
    display.remove(nextButton)
    composer.gotoScene("Scene12", {effect="fade", time = 4000})
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    --Scene Background
    background = display.newImageRect( sceneGroup, "Scene3Assets/Lab_bg1.png", 565, 350)
    background.x = display.contentCenterX 
    background.y = display.contentCenterY
    background.alpha = 1

    --Kamali Poses
    K1 = display.newImageRect( sceneGroup, objectSheet, 1, 220, 280 ) 
	K1.x = display.contentCenterX + 180
	K1.y = display.contentCenterY + 35
	K1.myName = "K1"
	K1.alpha = 0

	K2 = display.newImageRect( sceneGroup, objectSheet, 2, 220, 280 )
	K2.x = display.contentCenterX + 180
	K2.y = display.contentCenterY + 35
	K2.myName = "K2"
	K2.alpha = 0

	K3 = display.newImageRect( sceneGroup, objectSheet, 3, 220, 280 ) 
	K3.x = display.contentCenterX + 180
	K3.y = display.contentCenterY + 35
	K3.myName = "K3"
    K3.alpha = 0

    K4 = display.newImageRect( sceneGroup, objectSheet, 4, 220, 280 ) 
	K4.x = display.contentCenterX + 180
	K4.y = display.contentCenterY + 35
	K4.myName = "K4"
	K4.alpha = 0

	K5 = display.newImageRect( sceneGroup, objectSheet, 5, 220, 280 ) 
	K5.x = display.contentCenterX + 180
	K5.y = display.contentCenterY + 35
	K5.myName = "K5"
    K5.alpha = 0

    K6 = display.newImageRect( sceneGroup, objectSheet, 6, 220, 280 ) 
	K6.x = display.contentCenterX + 180
	K6.y = display.contentCenterY + 35
	K6.myName = "K6"
    K6.alpha = 0

    K7 = display.newImageRect( sceneGroup, objectSheet, 7, 220, 280 ) 
	K7.x = display.contentCenterX + 180
	K7.y = display.contentCenterY + 35
	K7.myName = "K7"
    K7.alpha = 0

    K8 = display.newImageRect( sceneGroup, objectSheet, 8, 220, 280 ) 
	K8.x = display.contentCenterX + 180
	K8.y = display.contentCenterY + 35
	K8.myName = "K8"
    K8.alpha = 0

    K9 = display.newImageRect( sceneGroup, objectSheet, 9, 220, 280 ) 
	K9.x = display.contentCenterX + 180
	K9.y = display.contentCenterY + 35
	K9.myName = "K9"
    K9.alpha = 0

    --Venus Poses
    V1 = display.newImageRect( sceneGroup, objectSheet2, 1, 70, 240 )
    V1.x = display.contentCenterX - 3
    V1.y = display.contentCenterY - 42 
    V1.myName = "V1"
    V1.alpha = 0
 
    V2 = display.newImageRect( sceneGroup, objectSheet2, 2, 70, 240 )
    V2.x = display.contentCenterX 
    V2.y = display.contentCenterY + 20
    V2.myName = "V2"
    V2.alpha = 0
 
    V3 = display.newImageRect( sceneGroup, objectSheet2, 3, 70, 240 )
    V3.x = display.contentCenterX 
    V3.y = display.contentCenterY + 20
    V3.myName = "V3"
    V3.alpha = 0

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
    DialogText1 = display.newText(sceneGroup , Dialogue.Scene11[start]  , 240, 240, "UI_Elements/OpenSans-Light", 12)
    DialogText1:setFillColor( 0, 0, 0 )
    DialogText1.alpha = 0
    DialogText2 = display.newText(sceneGroup ,Dialogue.Scene11[mid1]  , 240, 260, "UI_Elements/OpenSans-Light", 12)
    DialogText2:setFillColor( 0, 0, 0 )
    DialogText2.alpha = 0
    DialogText3 = display.newText(sceneGroup ,Dialogue.Scene11[mid2]  , 240, 280, "UI_Elements/OpenSans-Light", 12)
    DialogText3:setFillColor( 0, 0, 0 )
    DialogText3.alpha = 0
    DialogText4 = display.newText(sceneGroup ,Dialogue.Scene11[finish]  , 240, 300, "UI_Elements/OpenSans-Light", 12)
    DialogText4:setFillColor( 0, 0, 0 )
    DialogText4.alpha = 0

    --Dialog Text for Venus
    DialogText1V = display.newText( "Kia haal hain?", 100, 100, "UI_Elements/OpenSans-Light", 16)
    DialogText1V:setFillColor( 1,1,1 )
    DialogText1V.alpha = 0
    DialogText2V = display.newText( "Nǐ hǎo ma?", 100, 120, "UI_Elements/OpenSans-Light", 16)
    DialogText2V:setFillColor( 1,0,0 )
    DialogText2V.alpha = 0
    DialogText3V = display.newText( "¿Cómo estás?", 100, 140, "UI_Elements/OpenSans-Light", 16)
    DialogText3V:setFillColor( 0,1,0 )
    DialogText3V.alpha = 0
    DialogText4V = display.newText( "Is all well?", 100, 160, "UI_Elements/OpenSans-Light", 16)
    DialogText4V:setFillColor( 0,0,1 )
    DialogText4V.alpha = 0


    --Sarah Name
    Venus_Name = display.newText(sceneGroup,"Venus Clone", 20, 235, "UI_Elements/Ceria-Lebaran", 20)
    Venus_Name:setFillColor( 0, 0, 0)
    Venus_Name.alpha = 0

    --Kamali Name
    Kamali_Name = display.newText(sceneGroup,"Kamali", 10, 235, "UI_Elements/Ceria-Lebaran", 20)
    Kamali_Name:setFillColor( 0, 0, 0)
    Kamali_Name.alpha = 0

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

    transition.to(K7 ,{time = 2000, delay = 14000, alpha = 1})

    --Location Text Appears Function Call
    timer.performWithDelay(10000, LocationTextAppear)
    --Transitiion background into the scene
    transition.to( background,{ time = 5000, delay = 12000 ,alpha = 1} )

    --Button Appears
    transition.to( button,{time = 400 , delay = 22000 ,alpha = 1} )
    transition.to(buttonOuter,{time = 1, delay = 22000, alpha = 1})

    button:addEventListener("tap" , buttonReappear)
    button:addEventListener("tap" , outerRotate)
    button:addEventListener("tap" , dialogFunction)
    button:addEventListener("tap" , CharControl)

    nextButton:addEventListener("tap" , changeScenes)
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