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
    frames = 
    {
    
        {
            -- 1
            x=510,
            y=1,
            width=522,
            height=850,

        },
        {
            -- 2
            x=1,
            y=1,
            width=507,
            height=1000,

        },
        {
            -- 3
            x=1,
            y=1003,
            width=507,
            height=1000,

        },
        {
            -- 4
            x=510,
            y=853,
            width=507,
            height=1000,

        },
        {
            -- 5
            x=1019,
            y=853,
            width=507,
            height=1000,

        },
        {
            -- 6
            x=1034,
            y=1,
            width=522,
            height=850,

        },
        {
            -- 7
            x=1528,
            y=853,
            width=507,
            height=1000,

        },
        {
            -- 8
            x=1558,
            y=1,
            width=459,
            height=750,

        },
    },

    sheetContentWidth = 2036,
    sheetContentHeight = 2004
}

--Conigure Image Sheet
local sheetOptionsSarah =
{
    
    frames = {
    
        {
            -- 1
            x=1,
            y=1,
            width=534,
            height=850,

        },
        {
            -- 2
            x=1139,
            y=1,
            width=298,
            height=850,

        },
        {
            -- 3
            x=537,
            y=1,
            width=299,
            height=850,

        },
        {
            -- 4
            x=838,
            y=1,
            width=299,
            height=850,

        },
    },

    sheetContentWidth = 1438,
    sheetContentHeight = 852
}

-- MAIN FRAME EFFECT TEXT--------------------------------------------------------------------------------------  
---------------------------------------------------------------------------------------------------------------
local text = {letters=" Accessing Remote System PRJVENUS@Hkamali_PC\nRun sound_recorder.rb script . . . . . . Complete.\nSystem Microphone Accessible.\nRun webcam -p /var/www . . .. . . Complete.\nSystem Camera Accessible.\nContacts identified: Hassan Kamali and Sara Hui", index = 1} --FOR MAIN FRAME EFFECT
local text1 = {letters1= "Disconnect Remote System PRJVENUS@Hkamali_PC\n\nLayering audio recording with email dataset.", index1 = 1}
local text2 = {letters2="Processing new dataset with manifesto requirements", index2 = 1} --FOR MAIN FRAME EFFECT

local MainframeTextBox = display.newText("", 0, 0,"UI_Elements/Digital-System",15) -- FOR MAINFRAME EFFECT
MainframeTextBox.x = display.contentCenterX
MainframeTextBox.y = display.contentCenterY
MainframeTextBox:setFillColor(0,1,0)

local MainframeTextBox1 = display.newText("", 0, 0, "UI_Elements/Digital-System", 17) -- FOR MAINFRAME1 EFFECT
MainframeTextBox1.x = display.contentCenterX 
MainframeTextBox1.y = display.contentCenterY - 20
MainframeTextBox1:setFillColor(0,1,0)

local MainframeTextBox2 = display.newText("", 0, 0, "UI_Elements/Digital-System", 17) -- FOR MAINFRAME2 EFFECT
MainframeTextBox2.x = display.contentCenterX 
MainframeTextBox2.y = display.contentCenterY - 20
MainframeTextBox2:setFillColor(0,1,0)


----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

local objectSheet = graphics.newImageSheet( "Scene8Assets/KamaliSpriteSheet.png", sheetOptionsKamali )
local objectSheet2 = graphics.newImageSheet( "Scene8Assets/SarahSpriteSheet.png", sheetOptionsSarah )

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
    timer.performWithDelay(50, mainframeText2, string.len(text2.letters2))
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
  --New Dialogues Appear
  transition.to(DialogText1,{alpha = 0.90, time = 400, delay = 1000})
  transition.to(DialogText2,{alpha = 0.90, time = 400, delay = 1500})
  transition.to(DialogText3,{alpha = 0.90, time = 400, delay = 2000})
  transition.to(DialogText4,{alpha = 0.90, time = 400, delay = 2500})
end

function CharControl()
    tapCount = tapCount + 1
    print(tapCount)
    if(tapCount == 1)then
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(K2,{alpha = 0.70, time = 400, delay = 1000})
        transition.to(S1,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 2)then
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to(K2,{alpha = 1, time = 400, delay = 1000})
        transition.to(S1,{alpha = 0.70, time = 400, delay = 1000})
    elseif(tapCount == 3)then
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(K2,{alpha = 0.70, time = 400, delay = 1000})
        transition.to( S1,{ alpha = 0, time = 2500, delay = 500} )
        transition.to( S2,{ alpha = 1, time = 1000, delay = 500} )
    elseif(tapCount == 4)then
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to( K2,{ alpha = 0, time = 2500, delay = 500} )
        transition.to( K4,{ alpha = 1, time = 1000, delay = 500} )
        transition.to(S2,{alpha = 0.70, time = 400, delay = 1000})
    elseif(tapCount == 5)then
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to( K4,{alpha = 0.70, time = 400, delay = 1000})
        transition.to( S2,{ alpha = 0, time = 2500, delay = 500} )
        transition.to( S1,{ alpha = 1, time = 1000, delay = 500} )
    elseif(tapCount == 6)then
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to( S1,{alpha = 0.70, time = 400, delay = 1000})
        transition.to( K4,{ alpha = 0, time = 2500, delay = 500} )
        transition.to( K7,{ alpha = 1, time = 1000, delay = 500} )
    elseif(tapCount == 7)then
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(K7,{alpha = 0.70, time = 400, delay = 1000})
        transition.to( S1,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 8)then
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to( S1,{alpha = 0.70, time = 400, delay = 1000})
        transition.to( K7,{ alpha = 0, time = 2500, delay = 500} )
        transition.to( K1,{ alpha = 1, time = 1000, delay = 500} )
    elseif(tapCount == 9)then
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to( K1,{alpha = 0.70, time = 400, delay = 1000})
        transition.to( S1,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 10)then
        transition.to( S1,{ alpha = 0, time = 2500, delay = 500} )
        transition.to( S2,{ alpha = 1, time = 1000, delay = 500} )
    elseif(tapCount == 11)then
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(dialogBox,{alpha = 0, time = 400, delay = 400})
        transition.to( K1,{alpha = 0.5, time = 3000, delay = 2000})
        transition.to( S2,{ alpha = 0.5, time = 3000, delay = 2000} )
        transition.to( background,{ alpha = 0.5, time = 3000, delay = 2000} )
        timer.performWithDelay(6000, displayMainFrame)
    elseif(tapCount == 12)then
        transition.to( MainframeTextBox,{ alpha = 0 , time = 2000, delay = 1000})
        transition.to( K1,{ alpha = 0, time = 2500, delay = 500} )
        transition.to( K7,{ alpha = 1, time = 2000, delay = 500} )
        transition.to( S2,{ alpha = 0.7, time = 3000, delay = 2000} )
        transition.to( background,{ alpha = 1, time = 3000, delay = 2000} )
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1500})
        transition.to(dialogBox,{alpha = 1, time = 400, delay = 1500})
    elseif(tapCount == 13)then --Sarah name 
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to( S2,{ alpha = 1, time = 1000, delay = 500} )
        transition.to( K7,{alpha = 0.70, time = 400, delay = 1000})
    elseif(tapCount == 14)then --Kamali name and change kamali pose
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to( S2,{alpha = 0.70, time = 400, delay = 1000})
        transition.to( K7,{ alpha = 0, time = 2500, delay = 500} )
        transition.to( K5,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 15)then --Sarah name
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(K5,{alpha = 0.70, time = 400, delay = 1000})
        transition.to(S2,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 16)then --Kamali Speak                             
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to( K5,{ alpha = 0, time = 2500, delay = 500} )
        transition.to( K2,{ alpha = 1, time = 2000, delay = 500} )
        transition.to(S2,{alpha = 0.7, time = 400, delay = 1000})
    elseif(tapCount == 17)then --sarah speak
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(S2,{alpha = 1, time = 400, delay = 1000})
        transition.to(K2,{alpha = 0.7, time = 400, delay = 1000})
    elseif(tapCount == 18)then --Kamali speak
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to(S2,{alpha = 0.7, time = 400, delay = 1000})
        transition.to(K2,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 19)then --Sarah speak and sarah shocked pose change
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(K2,{alpha = 0.7, time = 400, delay = 1000})
        transition.to(S2,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(S3,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 20)then --Kamali speak and kamali pose change to sarcastic
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to(S3,{alpha = 0.7, time = 400, delay = 1000})
        transition.to(K2,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(K4,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 21)then -- Kamali speak change pose to default expression
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to(K4,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(K2,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 22)then
    elseif(tapCount == 23)then --Kamali speak 
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 24)then --Sarah speak
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(K2,{alpha = 0.7, time = 400, delay = 1000})
        transition.to(S3,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(S1,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 25)then --Sarah speak and inquisitive change pose
        transition.to(S1,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(S2,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 26)then --Kamali speak change pose to angry
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to(S2,{alpha = 0.7, time = 400, delay = 1000})
        transition.to(K2,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(K7,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 27)then --Sarah speak 
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(K7,{alpha = 0.7, time = 400, delay = 1000})
        transition.to(S2,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 28)then -- Kamali speaks no dialogue stares change pose
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(dialogBox,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(S2,{alpha = 0.7, time = 400, delay = 1000})
        transition.to(K7,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(K4,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 29)then -- Sarah speak 
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(dialogBox,{alpha = 1, time = 400, delay = 1000})
        transition.to(K4,{alpha = 0.7, time = 400, delay = 1000})
        transition.to(S2,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(S4,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 32)then -- Kamali Speak
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to(K4,{alpha = 1, time = 400, delay = 1000})
        transition.to(S4,{alpha = 0.7, time = 400, delay = 1000})
    elseif(tapCount == 34)then -- Saarah speak
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(K4,{alpha = 0.7, time = 400, delay = 1000})
        transition.to(S4,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 35)then -- Kamali Speak and Change pose to default
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to(S4,{alpha = 0.7, time = 400, delay = 1000})
        transition.to(K4,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(K2,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 36)then -- Sarah speaks
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(S4,{alpha = 1, time = 400, delay = 1000})
        transition.to(K2,{alpha = 0.7, time = 400, delay = 1000})
    elseif(tapCount == 37)then --Kamali speaks
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to(S4,{alpha = 0.7, time = 400, delay = 1000})
        transition.to(K2,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 38)then --Saarah speaks
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(S4,{alpha = 1, time = 400, delay = 1000})
        transition.to(K2,{alpha = 0.7, time = 400, delay = 1000})
    elseif(tapCount == 39)then -- Kamali Speaks
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to(S4,{alpha = 0.7, time = 400, delay = 1000})
        transition.to(K2,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 40)then -- Sarah speaks
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(S4,{alpha = 1, time = 400, delay = 1000})
        transition.to(K2,{alpha = 0.7, time = 400, delay = 1000})
    elseif(tapCount == 41)then -- Kamali Speaks
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to(S4,{alpha = 0.7, time = 400, delay = 1000})
        transition.to(K2,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 42)then -- Sarah Speaks
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(S4,{alpha = 1, time = 400, delay = 1000})
        transition.to(K2,{alpha = 0.7, time = 400, delay = 1000})
    elseif(tapCount == 43)then -- Kamali Speaks
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to(S4,{alpha = 0.7, time = 400, delay = 1000})
        transition.to(K2,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 44)then -- Sarah Speaks
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(S4,{alpha = 1, time = 400, delay = 1000})
        transition.to(K2,{alpha = 0.7, time = 400, delay = 1000})
    elseif(tapCount == 50)then -- Kamali Sighs Blows Steam
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to(S4,{alpha = 0.7, time = 400, delay = 1000})
        transition.to(K2,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(K7,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 51)then -- Kamali 
        transition.to(K7,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(K5,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 52)then -- Sarah Speaks
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(S4,{alpha = 1, time = 400, delay = 1000})
        transition.to(K5,{alpha = 0.7, time = 400, delay = 1000})
    elseif(tapCount == 53)then -- Kamali Speaks
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(KamaliName,{alpha = 1, time = 400, delay = 1000})
        transition.to(S4,{alpha = 0.7, time = 400, delay = 1000})
        transition.to(K5,{ alpha = 0, time = 2500, delay = 500} )
        transition.to(K2,{ alpha = 1, time = 2000, delay = 500} )
    elseif(tapCount == 54)then -- Sarah Speaks
        transition.to(KamaliName,{alpha = 0, time = 400, delay = 400})
        transition.to(SarahName,{alpha = 1, time = 400, delay = 1000})
        transition.to(S4,{alpha = 1, time = 400, delay = 1000})
        transition.to(K2,{alpha = 0.7, time = 400, delay = 1000})
    elseif(tapCount == 55)then -- Mainframe
        transition.to(SarahName,{alpha = 0, time = 400, delay = 400})
        transition.to(dialogBox,{alpha = 0, time = 400, delay = 400})
        transition.to(S4,{alpha = 0, time = 3000, delay = 2000})
        transition.to(K2,{ alpha = 0, time = 3000, delay = 2000} )
        transition.to(background,{ alpha = 0.5, time = 3000, delay = 2000} )
        timer.performWithDelay(5000, displayMainFrame1)
    elseif(tapCount == 56)then
        transition.to(dialogBox,{alpha = 1, time = 400, delay = 1000})
        transition.to(VenusName,{alpha = 1, time = 400, delay = 1000})
    elseif(tapCount == 57)then
        transition.to(dialogBox,{alpha = 0, time = 400, delay = 1000})
        transition.to(VenusName,{alpha = 0, time = 400, delay = 1000})
        transition.to(background,{ alpha = 0, time = 3000, delay = 2000} )
        transition.to(MainframeTextBox1,{alpha = 0, time = 2000})
        timer.performWithDelay(4000, displayMainFrame2)
        display.remove(button)
        display.remove(buttonOuter)
        transition.to( nextButton,{time = 1 , delay = 3000 ,alpha = 1} )
    end
end

local function changeScenes()
    transition.to(MainframeTextBox2,{time = 2000, alpha = 0})

    display.remove(nextButton)
    composer.gotoScene("Scene9", {effect="fade", time = 4000})
end

function bringToFront()
    dialogBox:toFront()
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

    background = display.newImageRect(sceneGroup, "Scene8Assets/bg_8.png", 565, 350)
    background.x = display.contentCenterX 
    background.y = display.contentCenterY
    background.alpha = 0

    --Kamali Poses
    K1 = display.newImageRect( sceneGroup, objectSheet, 1, 192, 315 ) -- Loosing it
	K1.x = display.contentCenterX - 147
	K1.y = display.contentCenterY + 5
	K1.myName = "K1"
	K1.alpha = 0

	K2 = display.newImageRect( sceneGroup, objectSheet, 2, 160, 305 ) -- Normal
	K2.x = display.contentCenterX - 155
	K2.y = display.contentCenterY + 12
	K2.myName = "K2"
	K2.alpha = 0

	K3 = display.newImageRect( sceneGroup, objectSheet, 3, 160, 305 ) -- Bad mood
	K3.x = display.contentCenterX - 155
	K3.y = display.contentCenterY + 12
	K3.myName = "K3"
    K3.alpha = 0

    K4 = display.newImageRect( sceneGroup, objectSheet, 4, 160, 305 ) -- Eyes to side
	K4.x = display.contentCenterX - 155
	K4.y = display.contentCenterY + 12
	K4.myName = "K4"
	K4.alpha = 0

	K5 = display.newImageRect( sceneGroup, objectSheet, 5, 160, 305 ) -- Blowing Steam
	K5.x = display.contentCenterX - 155
	K5.y = display.contentCenterY + 12
	K5.myName = "K5"
    K5.alpha = 0

    K6 = display.newImageRect( sceneGroup, objectSheet, 6, 190, 300 ) -- Pareshan
	K6.x = display.contentCenterX - 155
	K6.y = display.contentCenterY + 10
	K6.myName = "K6"
    K6.alpha = 0

    K7 = display.newImageRect( sceneGroup, objectSheet, 7, 160, 305 ) -- Pissed
	K7.x = display.contentCenterX - 155
	K7.y = display.contentCenterY + 12
	K7.myName = "K7"
    K7.alpha = 0

    K8 = display.newImageRect( sceneGroup, objectSheet, 8, 190, 305 ) -- Kamali Waves
	K8.x = display.contentCenterX - 139
	K8.y = display.contentCenterY + 12
	K8.myName = "K8"
    K8.alpha = 0

    S1 = display.newImageRect( sceneGroup, objectSheet2, 1, 165, 280 ) -- Sarah Computer
	S1.x = display.contentCenterX + 200
	S1.y = display.contentCenterY + 20
	S1.myName = "S1"
    S1.alpha = 0

    S2 = display.newImageRect( sceneGroup, objectSheet2, 2, 100, 285 ) -- Sarah Front
	S2.x = display.contentCenterX + 135
	S2.y = display.contentCenterY + 20
	S2.myName = "S2"
    S2.alpha = 0

    S3 = display.newImageRect( sceneGroup, objectSheet2, 3, 100, 285 ) -- Sarah Front
	S3.x = display.contentCenterX + 135
	S3.y = display.contentCenterY + 20
	S3.myName = "S3"
    S3.alpha = 0

    S4 = display.newImageRect( sceneGroup, objectSheet2, 4, 100, 285 ) -- Sarah Front
	S4.x = display.contentCenterX + 135
	S4.y = display.contentCenterY + 20
	S4.myName = "S4"
    S4.alpha = 0

    --Scene Location Text
    LocationTextUpper = display.newText( sceneGroup,"Research Lab - Main Facility", 112, 250, "Scene3Assets/Fox", 14 )
    LocationTextUpper.alpha = 0
    LocationTextLower = display.newText( sceneGroup,"Next Morning", 112, 272, "UI_Elements/Digital-Clock", 16 )
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

    --Kamali Name
    KamaliName = display.newText(sceneGroup,"Kamali", 15, 238, "UI_Elements/Ceria-Lebaran", 20)
    KamaliName.alpha = 0
    KamaliName:setFillColor( 0, 0, 0)

    --Sarah Name
    SarahName = display.newText(sceneGroup,"Sarah", 15, 238, "UI_Elements/Ceria-Lebaran", 20)
    SarahName.alpha = 0
    SarahName:setFillColor( 0, 0, 0)

    --Venus Name
    VenusName = display.newText(sceneGroup,"Venus", 15, 238, "UI_Elements/Ceria-Lebaran", 20)
    VenusName.alpha = 0
    VenusName:setFillColor( 0, 0, 0)

    --Button
    button = display.newImageRect( sceneGroup, "Scene3Assets/blue.png", 20, 20 )
    button.x = display.contentCenterX + 250
    button.y = display.contentCenterY + 120
    button.alpha = 0

    --Next Button
    nextButton = display.newImageRect( sceneGroup, "Scene3Assets/skipScene.png", 30, 30 )
    nextButton.x = display.contentCenterX + 250
    nextButton.y = display.contentCenterY + 120
    nextButton.alpha = 0

    --Button
    buttonOuter = display.newImageRect( sceneGroup, "Scene3Assets/blueOuter.png", 30, 30 )
    buttonOuter.x = display.contentCenterX + 250
    buttonOuter.y = display.contentCenterY + 120
    buttonOuter.alpha = 0

    timer.performWithDelay(4000 , LocationTextAppear)

    --Sarah working pose appears
    transition.to( S1,{ alpha = 1, time = 2000, delay = 16000})
    transition.to( S1,{ alpha = 0.70, time = 2000, delay = 21000})
    --Kamali wave transition appear
    transition.to( K2,{ alpha = 1, time = 2000, delay = 19000} )
    transition.to( K2,{ alpha = 0, time = 1500, delay = 21000} )
    transition.to( K8,{ alpha = 1, time = 1000, delay = 21000} )
    transition.to( K8,{ alpha = 0, time = 2000, delay = 22000} )
    transition.to( K2,{ alpha = 1, time = 2000, delay = 22000} )
    --Introductory Dialogues
    transition.to(DialogText2,{alpha = 1, time = 800, delay = 21000})
    transition.to(DialogText3,{alpha = 1, time = 800, delay = 22000})
    transition.to(KamaliName,{alpha = 1, time = 800, delay = 21000})
    transition.to(dialogBox,{alpha = 1, time = 800, delay = 21000})
    --Button Appears
    timer.performWithDelay( 22000 , buttonReappear)
    transition.to( buttonOuter,{ alpha = 1, time = 1, delay = 25000 } )

    --Transition to background after scene change
    transition.to( background,{ alpha = 1, time = 6000, delay = 8000 } )

    button:addEventListener( "tap", buttonReappear)
    button:addEventListener( "tap", outerRotate)
    button:addEventListener( "tap", dialogFunction )
    button:addEventListener( "tap", CharControl )

    nextButton:addEventListener( "tap", changeScenes )
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