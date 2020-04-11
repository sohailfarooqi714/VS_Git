-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

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
            width=364,
            height=582,

            sourceX = 92,
            sourceY = 106,
            sourceWidth = 500,
            sourceHeight = 688
        },

        {
            -- K2
            x=367,
            y=1,
            width=302,
            height=582,

            sourceX = 91,
            sourceY = 106,
            sourceWidth = 500,
            sourceHeight = 688
        },

        {
            -- K3
            x=671,
            y=1,
            width=302,
            height=582,

            sourceX = 91,
            sourceY = 106,
            sourceWidth = 500,
            sourceHeight = 688
        },

        {
            -- K4
            x=267,
            y=1169,
            width=264,
            height=582,

            sourceX = 128,
            sourceY = 106,
            sourceWidth = 500,
            sourceHeight = 688
        },

        {
            -- K5
            x=1,
            y=585,
            width=302,
            height=582,

            sourceX = 91,
            sourceY = 106,
            sourceWidth = 500,
            sourceHeight = 688
        },

        {
            -- K6
            x=305,
            y=585,
            width=264,
            height=582,

            sourceX = 128,
            sourceY = 106,
            sourceWidth = 500,
            sourceHeight = 688
        },

        {
            -- K7
            x=533,
            y=1169,
            width=264,
            height=582,

            sourceX = 128,
            sourceY = 106,
            sourceWidth = 500,
            sourceHeight = 688
        },

        {
            -- K8
            x=571,
            y=585,
            width=264,
            height=582,

            sourceX = 128,
            sourceY = 106,
            sourceWidth = 500,
            sourceHeight = 688
        },

        {
            -- K9
            x=799,
            y=1169,
            width=264,
            height=582,

            sourceX = 128,
            sourceY = 106,
            sourceWidth = 500,
            sourceHeight = 688
        },

        {
            -- K10
            x=1,
            y=1169,
            width=264,
            height=582,

            sourceX = 128,
            sourceY = 106,
            sourceWidth = 500,
            sourceHeight = 688
        },
    },

    sheetContentWidth = 1064,
    sheetContentHeight = 1752
}

local sheetOptionsSarah =
{
    frames =
    {
        {
            -- S1
            x=141,
            y=1,
            width=490,
            height=574,

            sourceX = 10,
            sourceY = 114,
            sourceWidth = 500,
            sourceHeight = 688
        },

        {
            -- S2
            x=1,
            y=577,
            width=490,
            height=574,

            sourceX = 10,
            sourceY = 114,
            sourceWidth = 500,
            sourceHeight = 688
        },

        {
            -- S3
            x=493,
            y=577,
            width=490,
            height=574,

            sourceX = 10,
            sourceY = 114,
            sourceWidth = 500,
            sourceHeight = 688
        },

        {
            -- S4
            x=985,
            y=577,
            width=490,
            height=574,

            sourceX = 10,
            sourceY = 114,
            sourceWidth = 500,
            sourceHeight = 688
        },

        {
            -- S5
            x=1653,
            y=1,
            width=206,
            height=574,

            sourceX = 191,
            sourceY = 114,
            sourceWidth = 500,
            sourceHeight = 688
        },

        {
            -- S6
            x=1,
            y=1,
            width=138,
            height=570,

            sourceX = 211,
            sourceY = 118,
            sourceWidth = 500,
            sourceHeight = 688
        },

        {
            -- S7
            x=825,
            y=1,
            width=190,
            height=574,

            sourceX = 190,
            sourceY = 114,
            sourceWidth = 500,
            sourceHeight = 688
        },

        {
            -- S8
            x=1477,
            y=577,
            width=206,
            height=574,

            sourceX = 191,
            sourceY = 114,
            sourceWidth = 500,
            sourceHeight = 688
        },

        {
            -- S9
            x=1685,
            y=577,
            width=190,
            height=574,

            sourceX = 190,
            sourceY = 114,
            sourceWidth = 500,
            sourceHeight = 688
        },

        {
            -- S10
            x=633,
            y=1,
            width=190,
            height=574,

            sourceX = 190,
            sourceY = 114,
            sourceWidth = 500,
            sourceHeight = 688
        },

        {
            -- S11
            x=825,
            y=1,
            width=190,
            height=574,

            sourceX = 190,
            sourceY = 114,
            sourceWidth = 500,
            sourceHeight = 688
        },

        {
            -- S12
            x=1017,
            y=1,
            width=190,
            height=574,

            sourceX = 190,
            sourceY = 114,
            sourceWidth = 500,
            sourceHeight = 688
        },

        {
            -- S13
            x=1209,
            y=1,
            width=206,
            height=574,

            sourceX = 191,
            sourceY = 114,
            sourceWidth = 500,
            sourceHeight = 688
        },

        {
            -- S14
            x=1417,
            y=1,
            width=234,
            height=574,

            sourceX = 163,
            sourceY = 114,
            sourceWidth = 500,
            sourceHeight = 688
        },
    },

    sheetContentWidth = 1876,
    sheetContentHeight = 1152
}

local objectSheet = graphics.newImageSheet( "Scene3Assets/KamaliSpriteSheet.png", sheetOptionsKamali )

local objectSheet2 = graphics.newImageSheet("Scene3Assets/SarahSpriteSheet.png", sheetOptionsSarah)

local TapClickSound = audio.loadStream( "Scene3Assets/click1.wav" )
--local BackgroundMusic = audio.loadStream( "Scene3Assets/labloop.wav" )
local KeyboardTypeSound = audio.loadStream( "Scene3Assets/keyboard.mp3" )
local SceneChangeAudio = audio.loadStream( "Scene3Assets/Swoosh.wav" )

local dataTable = {}
 
local filePath = system.pathForFile( "dialog1.json", system.ResourceDirectory ) 	--Specify path of interaction

local contents

local BackGroundMusicChannel

local background
local button , nextButton, DialogText, DialogueTextSarah, Kamali_Name, Sarah_Name
local K1,K2,K3,K4,K5,K6,K7,K8,K9,K10
local S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14

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

local function changeScenes()
    composer.gotoScene("Scene3_CG", {effect="slideLeft", time = 800})
    --transition.to(DialogText2,{alpha = 0, time = 800, delay = 400})
    audio.play(SceneChangeAudio)
    display.remove(nextButton)
end

function ClickSound(event)
    audio.play(TapClickSound)
end

function KeyboardSound(event)
    audio.play(KeyboardTypeSound)
end

function PlayBackgroundSound(event)
    BackGroundMusicChannel = audio.play(BackgroundMusic, { channel=1, loops=-1} )
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

function showClicks()
     --Show Clicks
     transition.to( Click_Text1,{ time = 1500 ,alpha = 1} )
     transition.to( Click_Text2,{ time = 1500 , delay = 500 ,alpha = 1} )
     transition.to( Click_Text3,{ time = 1500 , delay = 1000 ,alpha = 1} )
     transition.to( Click_Text4,{ time = 1500 , delay = 1500 ,alpha = 1} )
     --Remove Clicks
     transition.to( Click_Text1,{ time = 1000 , delay = 3000 ,alpha = 0} )
     transition.to( Click_Text2,{ time = 1000 , delay = 3500 ,alpha = 0} )
     transition.to( Click_Text3,{ time = 1000 , delay = 4000 ,alpha = 0} )
     transition.to( Click_Text4,{ time = 1000 , delay = 4500 ,alpha = 0} )
     --Show Clicks
     transition.to( Click_Text5,{ time = 1500 , delay = 5000 ,alpha = 1} )
     transition.to( Click_Text6,{ time = 1500 , delay = 5500 ,alpha = 1} )
     transition.to( Click_Text7,{ time = 1500 , delay = 6000 ,alpha = 1} )
     transition.to( Click_Text8,{ time = 1500 , delay = 6500 ,alpha = 1} )
     --Remove Clicks
     transition.to( Click_Text5,{ time = 1000 , delay = 8000 ,alpha = 0} )
     transition.to( Click_Text6,{ time = 1000 , delay = 8500 ,alpha = 0} )
     transition.to( Click_Text7,{ time = 1000 , delay = 9000 ,alpha = 0} )
     transition.to( Click_Text8,{ time = 1000 , delay = 9500 ,alpha = 0} )
end

function kamaliAnimate()
    --Kamali arrives at the lab
    transition.to(K2 ,{ time = 1500, alpha = 1})
    transition.to(K2 ,{ time = 1000, delay = 1000, alpha = 0})
    transition.to(K1 ,{ time = 600, delay = 1000, alpha = 1})
    transition.to(K1 ,{ time = 1000, delay = 2000, alpha = 0})
    transition.to(K3 ,{ time = 600, delay = 2000, alpha = 1})
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
    transition.to(DialogText3,{alpha = 0, time = 400, delay = 400})
    transition.to(DialogText4,{alpha = 0, time = 400, delay = 400})
      --Dialogue Strings
      DialogText1 = display.newText(Dialogue.Scene3[start]  , 240, 240, "UI_Elements/OpenSans-Light", 12)
      DialogText1:setFillColor( 0, 0, 0 )
      DialogText1.alpha = 0
      DialogText2 = display.newText(Dialogue.Scene3[mid1]  , 240, 260, "UI_Elements/OpenSans-Light", 12)
      DialogText2:setFillColor( 0, 0, 0 )
      DialogText2.alpha = 0
      DialogText3 = display.newText(Dialogue.Scene3[mid2]  , 240, 280, "UI_Elements/OpenSans-Light", 12)
      DialogText3:setFillColor( 0, 0, 0 )
      DialogText3.alpha = 0
      DialogText4 = display.newText(Dialogue.Scene3[finish]  , 240, 300, "UI_Elements/OpenSans-Light", 12)
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
    if(tapCount == 1) then
        transition.to( Kamali_Name,{time = 800, delay = 1200, alpha = 1} )
        transition.to( dialogBox,{time = 600, delay = 600, alpha = 1})
        transition.to( S3,{time = 600, delay = 400, alpha = 0})
        transition.to( S4,{time = 600, delay = 400, alpha = 1})
        transition.to( S4,{time = 600, delay = 1000, alpha = 0.70})
    elseif(tapCount == 2) then
        transition.to( Kamali_Name,{time = 600, delay = 1000, alpha = 0} )
        transition.to( Sarah_Name,{time = 800, delay = 1200, alpha = 1} )
        transition.to( S4,{time = 600, delay = 400, alpha = 0})
        transition.to( S2,{time = 600, delay = 400, alpha = 1})
        transition.to( K3,{time = 600, delay = 400, alpha = 0.70})
    elseif(tapCount == 3) then
        transition.to( Kamali_Name,{time = 800, delay = 1200, alpha = 1} )
        transition.to( Sarah_Name,{time = 600, delay = 1000, alpha = 0} )
        transition.to( S2,{time = 600, delay = 400, alpha = 0.70})
        transition.to(K3 ,{ time = 600, delay = 400, alpha = 0})
        transition.to(K5 ,{ time = 600, delay = 400, alpha = 1})
    elseif(tapCount == 4) then
        transition.to( Kamali_Name,{time = 600, delay = 1000, alpha = 0} )
        transition.to( Sarah_Name,{time = 800, delay = 1200, alpha = 1} )
        transition.to( S2,{time = 600, delay = 400, alpha = 1})
        transition.to(K5 ,{ time = 600, delay = 400, alpha = 0.70})
    elseif(tapCount == 5) then
        transition.to( Kamali_Name,{time = 800, delay = 1200, alpha = 1} )
        transition.to( Sarah_Name,{time = 600, delay = 1000, alpha = 0} )
        transition.to( S2,{time = 600, delay = 400, alpha = 0.70})
        transition.to(K5 ,{ time = 600, delay = 400, alpha = 1})
    elseif(tapCount == 6) then
        transition.to( Kamali_Name,{time = 600, delay = 1000, alpha = 0} )
        transition.to( Sarah_Name,{time = 800, delay = 1200, alpha = 1} )
        transition.to( K5,{ time = 600, delay = 400, alpha = 0.70})
        transition.to( S2,{time = 600, delay = 400, alpha = 0})
        transition.to( S7,{time = 600, delay = 400, alpha = 1})
    elseif(tapCount == 7) then
        transition.to( S7,{time = 600, delay = 400, alpha = 0})
        transition.to( S6,{time = 600, delay = 400, alpha = 1})
    elseif(tapCount == 8) then
        transition.to( Kamali_Name,{time = 800, delay = 1200, alpha = 1} )
        transition.to( Sarah_Name,{time = 600, delay = 1000, alpha = 0} )
        transition.to( S6,{time = 600, delay = 400, alpha = 0.7})
        transition.to( K5,{ time = 600, delay = 400, alpha = 1})
    elseif(tapCount == 9) then
        transition.to( Kamali_Name,{time = 600, delay = 1000, alpha = 0} )
        transition.to( Sarah_Name,{time = 800, delay = 1200, alpha = 1} )
        transition.to( K5,{ time = 600, delay = 400, alpha = 0.7})
        transition.to( S6,{time = 600, delay = 400, alpha = 1})
    elseif(tapCount == 10) then
        transition.to( Kamali_Name,{time = 800, delay = 1200, alpha = 1} )
        transition.to( Sarah_Name,{time = 600, delay = 1000, alpha = 0} )
        transition.to( S6,{ time = 600, delay = 400, alpha = 0.7})
        transition.to( K5,{ time = 600, delay = 400, alpha = 1})
    elseif(tapCount == 15) then
        transition.to( Kamali_Name,{time = 600, delay = 1000, alpha = 0} )
        transition.to( Sarah_Name,{time = 800, delay = 1200, alpha = 1} )
        transition.to( K5,{ time = 600, delay = 400, alpha = 0.7})
        transition.to( S6,{ time = 600, delay = 400, alpha = 0})
        transition.to( S13,{ time = 600, delay = 400, alpha = 1})
    elseif(tapCount == 16) then
        transition.to( Kamali_Name,{time = 800, delay = 1200, alpha = 1} )
        transition.to( Sarah_Name,{time = 600, delay = 1000, alpha = 0} )
        transition.to( S13,{ time = 600, delay = 400, alpha = 0.7})
        transition.to( K5,{time = 600, delay = 400, alpha = 0})
        transition.to( K3,{time = 600, delay = 400, alpha = 1})
    elseif(tapCount == 17) then
        transition.to( Kamali_Name,{time = 600, delay = 1000, alpha = 0} )
        transition.to( Sarah_Name,{time = 800, delay = 1200, alpha = 1} )
        transition.to( K3,{time = 600, delay = 400, alpha = 0.7})
        transition.to( S13,{time = 600, delay = 400, alpha = 0})
        transition.to( S7,{time = 600, delay = 400, alpha = 1})
    elseif(tapCount == 20) then
        transition.to( Kamali_Name,{time = 800, delay = 1200, alpha = 1} )
        transition.to( Sarah_Name,{time = 600, delay = 1000, alpha = 0} )
        transition.to( S7,{time = 600, delay = 400, alpha = 0.7})
        transition.to( K3,{time = 600, delay = 400, alpha = 0})
        transition.to( K10,{time = 600, delay = 400, alpha = 1})
    elseif(tapCount == 23) then
        transition.to( K10,{time = 600, delay = 400, alpha = 0})
        transition.to( K7,{time = 600, delay = 400, alpha = 1})
    elseif(tapCount == 25) then
        transition.to( Kamali_Name,{time = 600, delay = 1000, alpha = 0} )
        transition.to( Sarah_Name,{time = 800, delay = 1200, alpha = 1} )
        transition.to( K7,{time = 600, delay = 400, alpha = 0.7})
        transition.to( S7,{time = 600, delay = 400, alpha = 1})
    elseif(tapCount == 26) then
        transition.to( Kamali_Name,{time = 800, delay = 1200, alpha = 1} )
        transition.to( Sarah_Name,{time = 600, delay = 1000, alpha = 0} )
        transition.to( S7,{time = 600, delay = 400, alpha = 0.7})
        transition.to( K7,{time = 600, delay = 400, alpha = 0})
        transition.to( K6,{time = 600, delay = 400, alpha = 1})
    elseif(tapCount == 27) then
        transition.to( Kamali_Name,{time = 600, delay = 1000, alpha = 0} )
        transition.to( Sarah_Name,{time = 800, delay = 1200, alpha = 1} )
        transition.to( K6,{time = 600, delay = 400, alpha = 0.7})
        transition.to( S7,{time = 600, delay = 400, alpha = 1})
    elseif(tapCount == 28) then
        transition.to( S7,{time = 600, delay = 400, alpha = 0})
        transition.to( S14,{time = 600, delay = 400, alpha = 1})
    elseif(tapCount == 29) then
        transition.to( Kamali_Name,{time = 800, delay = 1200, alpha = 1} )
        transition.to( Sarah_Name,{time = 600, delay = 1000, alpha = 0} )
        transition.to( S14,{time = 600, delay = 400, alpha = 0.7})
        transition.to( K6,{time = 600, delay = 400, alpha = 0})
        transition.to( K9,{time = 600, delay = 400, alpha = 1})
    elseif(tapCount == 30) then
        transition.to( Kamali_Name,{time = 600, delay = 1000, alpha = 0} )
        transition.to( Sarah_Name,{time = 800, delay = 1200, alpha = 1} )
        transition.to( K9,{time = 600, delay = 400, alpha = 0.7})
        transition.to( S14,{time = 600, delay = 400, alpha = 0})
        transition.to( S13,{time = 600, delay = 400, alpha = 1})
    elseif(tapCount == 31) then
        transition.to( Kamali_Name,{time = 800, delay = 1200, alpha = 1} )
        transition.to( Sarah_Name,{time = 600, delay = 1000, alpha = 0} )
        transition.to( S13,{time = 600, delay = 400, alpha = 0.7})
        transition.to( K9,{time = 600, delay = 400, alpha = 0})
        transition.to( K8,{time = 600, delay = 400, alpha = 1})
    elseif(tapCount == 34) then
        transition.to( dialogBox,{alpha = 0, time = 800, delay = 400})
        transition.to( Kamali_Name,{alpha = 0, time = 800, delay = 400})
        transition.to( nextButton,{alpha = 1, time = 1, delay = 3000})
        display.remove(button)
        display.remove(buttonOuter)
    end
end

function bringToFront()
    dialogBox:toFront()
    button:toFront()
    nextButton:toFront()
    buttonOuter:toFront()
    Kamali_Name:toFront()
    Sarah_Name:toFront()
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
    background.alpha = 0

    --Blinking Red Light Emission Sprite
    BlinkingRedLight = display.newImageRect( sceneGroup,"Scene3Assets/red1.png", 60, 60)
    BlinkingRedLight.x = display.contentCenterX + 127
    BlinkingRedLight.y = display.contentCenterY - 80
    BlinkingRedLight.alpha = 0

    --Scene Location Text
    LocationTextUpper = display.newText( sceneGroup,"Research Laboratory", 110, 250, "Scene3Assets/Fox", 12 )
    LocationTextUpper.alpha = 0
    LocationTextLower = display.newText( sceneGroup,"Next Morning", 110, 272, "UI_Elements/Digital-Clock", 16 )
    LocationTextLower.alpha = 0

    --Dialog Box PNG 
    dialogBox = display.newImageRect( sceneGroup, "Scene3Assets/textbox.png", 550, 120)
    dialogBox.x = display.contentCenterX 
    dialogBox.y = display.contentCenterY + 95
    dialogBox.alpha = 0

    --Dialogue Strings
    DialogText1 = display.newText(sceneGroup ,Dialogue.Scene3[start]  , 240, 240, "UI_Elements/OpenSans-Light", 12)
    DialogText1:setFillColor( 0, 0, 0 )
    DialogText1.alpha = 0

    DialogText2 = display.newText(sceneGroup ,Dialogue.Scene3[mid1]  , 240, 260, "UI_Elements/OpenSans-Light", 12)
    DialogText2:setFillColor( 0, 0, 0 )
    DialogText2.alpha = 0

    DialogText3 = display.newText(sceneGroup ,Dialogue.Scene3[mid2]  , 240, 280, "UI_Elements/OpenSans-Light", 12)
    DialogText3:setFillColor( 0, 0, 0 )
    DialogText3.alpha = 0

    DialogText4 = display.newText(sceneGroup ,Dialogue.Scene3[finish]  , 240, 300, "UI_Elements/OpenSans-Light", 12)
    DialogText4:setFillColor( 0, 0, 0 )
    DialogText4.alpha = 0

    --Sarah Name
    Sarah_Name = display.newText(sceneGroup,"Sarah", 10, 225, "UI_Elements/Ceria-Lebaran", 20)
    Sarah_Name:setFillColor( 0, 0, 0)
    Sarah_Name.alpha = 0

    --Kamali Name
    Kamali_Name = display.newText(sceneGroup,"Kamali", 10, 225, "UI_Elements/Ceria-Lebaran", 20)
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

    --Divider PNG Image
    LocationDivider = display.newImageRect( sceneGroup, "Scene3Assets/divider.png", 150, 8)
    LocationDivider.x =  600
    LocationDivider.y =  259

    --Kamali Poses
    K1 = display.newImageRect( sceneGroup, objectSheet, 1, 200, 320 )
	K1.x = display.contentCenterX - 200
	K1.y = display.contentCenterY - 40
	K1.myName = "K1"
	K1.alpha = 0

	K2 = display.newImageRect( sceneGroup, objectSheet, 2, 168, 320 )
	K2.x = display.contentCenterX - 185
	K2.y = display.contentCenterY - 40
	K2.myName = "K2"
	K2.alpha = 0

	K3 = display.newImageRect( sceneGroup, objectSheet, 3, 168, 320 )
	K3.x = display.contentCenterX - 185
	K3.y = display.contentCenterY - 40
	K3.myName = "K3"
    K3.alpha = 0
    
    K4 = display.newImageRect( sceneGroup, objectSheet, 4, 170, 320 )
	K4.x = display.contentCenterX - 185
	K4.y = display.contentCenterY - 40
	K4.myName = "K4"
    K4.alpha = 0
    
    K5 = display.newImageRect( sceneGroup, objectSheet, 5, 170, 320 )
	K5.x = display.contentCenterX - 185
	K5.y = display.contentCenterY - 40
	K5.myName = "K5"
    K5.alpha = 0
    
    K6 = display.newImageRect( sceneGroup, objectSheet, 6, 150, 320 )
	K6.x = display.contentCenterX - 185
	K6.y = display.contentCenterY - 40
	K6.myName = "K6"
    K6.alpha = 0
    
    K7 = display.newImageRect( sceneGroup, objectSheet, 7, 150, 320 )
	K7.x = display.contentCenterX - 185
	K7.y = display.contentCenterY - 40
	K7.myName = "K7"
    K7.alpha = 0
    
    K8 = display.newImageRect( sceneGroup, objectSheet, 8, 150, 320 )
	K8.x = display.contentCenterX - 185
	K8.y = display.contentCenterY - 40
	K8.myName = "K8"
    K8.alpha = 0
    
    K9 = display.newImageRect( sceneGroup, objectSheet, 9, 150, 320 )
	K9.x = display.contentCenterX - 185
	K9.y = display.contentCenterY - 40
	K9.myName = "K9"
    K9.alpha = 0
    
    K10 = display.newImageRect( sceneGroup, objectSheet, 10, 150, 320 )
	K10.x = display.contentCenterX - 185
	K10.y = display.contentCenterY - 40
	K10.myName = "K10"
    K10.alpha = 0
    
    --Sarah Poses
    S1 = display.newImageRect( sceneGroup, objectSheet2, 1, 230, 280 )
	S1.x = display.contentCenterX + 170
	S1.y = display.contentCenterY - 40
	S1.myName = "S1"
    S1.alpha = 0
    
    S2 = display.newImageRect( sceneGroup, objectSheet2, 2, 230, 280 )
	S2.x = display.contentCenterX + 170
	S2.y = display.contentCenterY - 30
	S2.myName = "S2"
    S2.alpha = 0
    
    S3 = display.newImageRect( sceneGroup, objectSheet2, 3, 230, 280 )
	S3.x = display.contentCenterX + 170
	S3.y = display.contentCenterY - 30
	S3.myName = "S3"
    S3.alpha = 0
    
    S4 = display.newImageRect( sceneGroup, objectSheet2, 4, 230, 280 )
	S4.x = display.contentCenterX + 170
	S4.y = display.contentCenterY - 30
	S4.myName = "S4"
    S4.alpha = 0
    
    S5 = display.newImageRect( sceneGroup, objectSheet2, 5, 110, 280 )
	S5.x = display.contentCenterX + 160
	S5.y = display.contentCenterY - 30
	S5.myName = "S5"
    S5.alpha = 0
    
    S6 = display.newImageRect( sceneGroup, objectSheet2, 6, 80, 280 )
	S6.x = display.contentCenterX + 170
	S6.y = display.contentCenterY - 30
	S6.myName = "S6"
    S6.alpha = 0
    
    S7 = display.newImageRect( sceneGroup, objectSheet2, 7, 100, 280 )
	S7.x = display.contentCenterX + 160
	S7.y = display.contentCenterY - 30
	S7.myName = "S7"
    S7.alpha = 0
    
    S8 = display.newImageRect( sceneGroup, objectSheet2, 8, 110, 275 )
	S8.x = display.contentCenterX + 158
    S8.y = display.contentCenterY - 32
	S8.myName = "S8"
    S8.alpha = 0
    
    S9 = display.newImageRect( sceneGroup, objectSheet2, 9, 230, 280 )
	S9.x = display.contentCenterX + 170
	S9.y = display.contentCenterY - 30
	S9.myName = "S9"
    S9.alpha = 0
    
    S10 = display.newImageRect( sceneGroup, objectSheet2, 10, 230, 280 )
	S10.x = display.contentCenterX + 170
	S10.y = display.contentCenterY - 30
	S10.myName = "S10"
    S10.alpha = 0
    
    S11 = display.newImageRect( sceneGroup, objectSheet2, 11, 230, 280 )
	S11.x = display.contentCenterX + 170
	S11.y = display.contentCenterY - 30
	S11.myName = "S11"
    S11.alpha = 0
    
    S12 = display.newImageRect( sceneGroup, objectSheet2, 12, 230, 280 )
	S12.x = display.contentCenterX + 170
	S12.y = display.contentCenterY - 30
	S12.myName = "S12"
    S12.alpha = 0
     
    S13 = display.newImageRect( sceneGroup, objectSheet2, 13, 110, 280 )
	S13.x = display.contentCenterX + 160
	S13.y = display.contentCenterY - 30
	S13.myName = "S13"
    S13.alpha = 0
    
    S14 = display.newImageRect( sceneGroup, objectSheet2, 14, 120, 280 )
	S14.x = display.contentCenterX + 165
	S14.y = display.contentCenterY - 30
	S14.myName = "S14"
	S14.alpha = 0

    --Click comic displays
    Click_Text1 = display.newText( sceneGroup, "CLICK", 320, 260, "Scene3Assets/Bad", 20)
    Click_Text1.alpha = 0
    Click_Text2 = display.newText( sceneGroup, "Tap", 460, 280, "Scene3Assets/Bad", 24)
    Click_Text2.alpha = 0
    Click_Text3 = display.newText( sceneGroup, "Tap", 325, 300, "Scene3Assets/Bad", 22)
    Click_Text3.alpha = 0
    Click_Text4 = display.newText( sceneGroup, "Click", 470, 310, "Scene3Assets/Bad", 20)
    Click_Text4.alpha = 0
    Click_Text5 = display.newText( sceneGroup, "CLICK", 460, 260, "Scene3Assets/Bad", 20)
    Click_Text5.alpha = 0
    Click_Text6 = display.newText( sceneGroup, "Tap", 325, 280, "Scene3Assets/Bad", 24)
    Click_Text6.alpha = 0
    Click_Text7 = display.newText( sceneGroup, "Tap", 470, 300, "Scene3Assets/Bad", 22)
    Click_Text7.alpha = 0
    Click_Text8 = display.newText( sceneGroup, "Click", 325, 310, "Scene3Assets/Bad", 20)
    Click_Text8.alpha = 0

    --Location Text Appears Function Call
    timer.performWithDelay(10000, LocationTextAppear)
    --Transitiion background into the scene
    transition.to( background,{ time = 5000, delay = 12000 ,alpha = 1} )
    --Function call to show clicks
    timer.performWithDelay( 22000 , showClicks )
    --Sarah Appears
    transition.to( S3,{ time = 3000, delay = 22000 ,alpha = 1} )
    --Call to kamaliAnimte//Kamali enters lab
    timer.performWithDelay(30000, kamaliAnimate)
    --Button Appears
    transition.to( button,{time = 400 , delay = 32000 ,alpha = 1} )
    transition.to(buttonOuter,{time = 1, delay = 32000, alpha = 1})

    --Call to recursive function for red light emission effect.
    timer.performWithDelay( 6000 ,server_glow )
    --Background Music Loop
    timer.performWithDelay( 7000, PlayBackgroundSound)
    --Typing sounds
    timer.performWithDelay( 22000 ,KeyboardSound )

    bringToFront()

    button:addEventListener( "tap", buttonReappear)
    button:addEventListener( "tap", outerRotate)
    button:addEventListener( "tap", dialogFunction )
    button:addEventListener( "tap", CharControl)
    button:addEventListener( "tap", ClickSound)
    nextButton:addEventListener( "tap",  changeScenes)
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
    display.remove(objectSheet)
    display.remove(objectSheet2)
    display.remove(BlinkingRedLight) 
    display.remove(button)
    display.remove(nextButton)
    dislay.remove(background)
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