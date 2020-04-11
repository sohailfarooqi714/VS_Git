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
local sheetOptionsGenerals =
{
    
    frames = 
    {
    
        {
            -- A1
            x=1,
            y=1,
            width=371,
            height=600,

        },
        {
            -- A2
            x=1,
            y=603,
            width=370,
            height=600,

        },
        {
            -- A3
            x=1,
            y=1205,
            width=370,
            height=600,

        },
        {
            -- A4
            x=373,
            y=603,
            width=370,
            height=600,

        },
        {
            -- Amir1
            x=374,
            y=1,
            width=370,
            height=600,

        },
        {
            -- Amir2
            x=373,
            y=1205,
            width=370,
            height=600,

        },
        {
            -- Amir3
            x=746,
            y=1,
            width=370,
            height=600,

        },
        {
            -- G1
            x=745,
            y=603,
            width=370,
            height=600,

        },
        {
            -- G2
            x=745,
            y=1205,
            width=370,
            height=600,

        },
        {
            -- G3
            x=1117,
            y=603,
            width=370,
            height=600,

        },
        {
            -- G4
            x=1117,
            y=1205,
            width=370,
            height=600,

        },
    },

    sheetContentWidth = 1488,
    sheetContentHeight = 1806
}

local sheetOptionsIsaac =
{
    
    frames = 
    {
    
        {
            -- I1
            x=1,
            y=1,
            width=396,
            height=500,

        },
        {
            -- I2
            x=1,
            y=503,
            width=396,
            height=500,

        },
        {
            -- I3
            x=399,
            y=1,
            width=396,
            height=500,

        },
        {
            -- I4
            x=399,
            y=503,
            width=396,
            height=500,

        },
        {
            -- I5
            x=797,
            y=1,
            width=396,
            height=500,

        },
        {
            -- I6
            x=797,
            y=503,
            width=396,
            height=500,

        },
        {
            -- I7
            x=1195,
            y=1,
            width=396,
            height=500,

        },
        {
            -- I8
            x=1195,
            y=503,
            width=396,
            height=500,

        },
    },

    sheetContentWidth = 1592,
    sheetContentHeight = 1004
}

local sheetOptionsIsaacPhone =
{
    frames = {
    
        {
            -- I9
            x=715,
            y=1,
            width=712,
            height=900,

        },
        {
            -- I10
            x=1,
            y=1,
            width=712,
            height=900,

        },
        {
            -- I11
            x=1,
            y=903,
            width=712,
            height=900,

        },
    },

    sheetContentWidth = 1428,
    sheetContentHeight = 1804
}
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------

local objectSheet = graphics.newImageSheet( "Scene10Assets/GeneralsSpriteSheet.png", sheetOptionsGenerals )

local objectSheet2 = graphics.newImageSheet( "Scene10Assets/IsaacSpriteSheet.png", sheetOptionsIsaac )

local objectSheet3 = graphics.newImageSheet( "Scene10Assets/IsaacPhoneSpriteSheet.png", sheetOptionsIsaacPhone )
 
local dataTable = {}
 
local filePath = system.pathForFile( "dialog1.json", system.DocumentsDirectory ) 	--Specify path of interaction

local contents

local tapCount = 0
local rotate = 0

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

function buttonReappear()
	--Button Disappear Transition
     transition.to( button,{time = 1 ,alpha = 0} )
    --Button Reappear Transition
     transition.to( button,{time = 1 , delay = 3000 ,alpha = 1} )
end

function outerRotate()
         --[[rotate = rotate + 3600
         transition.to( buttonOuter,{rotation = rotate, time = 3000} )
         --transition.to( buttonOuter,{rotation = rotate, time = 800, delay = 1000} )
         --transition.to( buttonOuter,{rotation = 1080, time = 400, delay = 1500} )]]
        
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
      DialogText1 = display.newText(Dialogue.Scene10[start]  , 240, 235, "UI_Elements/OpenSans-Light", 12)
      DialogText1:setFillColor( 0, 0, 0 )
      DialogText1.alpha = 0
      DialogText2 = display.newText(Dialogue.Scene10[mid1]  , 240, 255, "UI_Elements/OpenSans-Light", 12)
      DialogText2:setFillColor( 0, 0, 0 )
      DialogText2.alpha = 0
      DialogText3 = display.newText(Dialogue.Scene10[mid2]  , 240, 275, "UI_Elements/OpenSans-Light", 12)
      DialogText3:setFillColor( 0, 0, 0 )
      DialogText3.alpha = 0
      DialogText4 = display.newText(Dialogue.Scene10[finish]  , 240, 295, "UI_Elements/OpenSans-Light", 12)
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
            --DialogBox Appears   
            transition.to(dialogBox,{alpha = 1, time = 400, delay = 1500})               
            --Character Speak
            transition.to(IsaacName,{alpha = 1, time = 400, delay = 1500})
            --All Akbar sprite transitions to talk area in invisible mode
            transition.scaleTo( A1,{ xScale=2, yScale=2, time = 100 } )
            transition.to( A1,{ y = 125, x = 460, time = 100})
            transition.scaleTo( A2,{ xScale=2, yScale=2, time = 100 } )
            transition.to( A2,{ y = 125, x = 460, time = 100})
            transition.scaleTo( A3,{ xScale=2, yScale=2, time = 100 } )
            transition.to( A3,{ y = 125, x = 460, time = 100})
            transition.scaleTo( A4,{ xScale=2, yScale=2, time = 100 } )
            transition.to( A4,{ y = 125, x = 460, time = 100})
            transition.to( A1,{ alpha = 1, time = 1000, delay = 1000 } )
            --Character opacity Control
            transition.to( A1,{ alpha = 0.7, time = 400, delay = 3000 } )
        elseif(tapCount == 2)then
            --Character Speak
            transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
            transition.to(AkbarName,{alpha = 1, time = 400, delay = 1000})
            --Gul Khan sprite transitions to center of screen with rescale
            transition.scaleTo( G1,{ xScale=3, yScale=3, time = 100 } )
            transition.to( G1,{ y = 150, x = 250, time = 100})
            transition.to( G1,{ alpha = 1, time = 1000, delay = 5000 } )
            --Gul Khan sprite transitions back to original place with rescale
            transition.scaleTo( G1,{ xScale=1, yScale=1, time = 300, delay = 8000 } )
            transition.to( G1,{ y = 50, x = 180, time = 300, delay = 8000 })
            --Colonel Amir sprite transitions to center of screen with rescale
            transition.scaleTo( Amir1,{ xScale=3, yScale=3, time = 100 } )
            transition.to( Amir1,{ y = 150, x = 250, time = 100})
            transition.to( Amir1,{ alpha = 1, time = 1000, delay = 8000 } )
            --Colonel Amir sprite transitions back to original place with rescale
            transition.scaleTo( Amir1,{ xScale=1, yScale=1, time = 300, delay = 11000 } )
            transition.to( Amir1,{ y = 50, x = 240, time = 300, delay = 11000 })
            --Character Opacity Control
            transition.to( I3,{ alpha = 0.7, time = 400, delay = 1000 } )
            transition.to( A1,{ alpha = 1, time = 400, delay = 1000 } )
        elseif(tapCount == 3)then
            --Character Speak
            transition.to(AkbarName,{alpha = 0, time = 400, delay = 400})
            transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})
            --Character Pose Control
            transition.to(I3,{ alpha = 0, time = 2500, delay = 500} )
            transition.to(I8,{ alpha = 1, time = 2000, delay = 500} )
            --Character Opacity Control
            transition.to( A1,{ alpha = 0.7, time = 400, delay = 1000 } )
        elseif(tapCount == 4)then
            --Character Speak
            transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
            transition.to(AkbarName,{alpha = 1, time = 400, delay = 1000})
            --Character Opacity Control
            transition.to( I8,{ alpha = 0.7, time = 400, delay = 1000 } )
            transition.to( A1,{ alpha = 1, time = 400, delay = 1000 } )
        elseif(tapCount == 5)then
            --Character Speak
            transition.to(AkbarName,{alpha = 0, time = 400, delay = 400})
            transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})
            --Character Pose Control
            transition.to(I8,{ alpha = 0, time = 2500, delay = 500} )
            transition.to(I3,{ alpha = 1, time = 2000, delay = 500} )
            --Character Opacity Control
            transition.to( A1,{ alpha = 0.7, time = 400, delay = 1000 } )
        elseif(tapCount == 6)then
            transition.to(IsaacName,{alpha = 0, time = 400, delay = 1000})
        elseif(tapCount == 7)then
            --Character Speak
            transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
            transition.to(AkbarName,{alpha = 1, time = 400, delay = 1000})
            --Character Pose Control
            transition.to(A1,{ alpha = 0, time = 2500, delay = 500} )
            transition.to(A2,{ alpha = 1, time = 2000, delay = 500} )
            --Character Opacity Control
            transition.to( I3,{ alpha = 0.7, time = 400, delay = 1000 } )
        elseif(tapCount == 8)then
            --Character Speak
            transition.to(AkbarName,{alpha = 0, time = 400, delay = 400})
            transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})
            --Character Opacity Control
            transition.to( A2,{ alpha = 0.7, time = 400, delay = 1000 } )
            transition.to( I3,{ alpha = 1, time = 400, delay = 1000 } )
        elseif(tapCount == 9)then
            --Character Speak
            transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
            transition.to(AkbarName,{alpha = 1, time = 400, delay = 1000})
            --Character Pose Control
            transition.to(A2,{ alpha = 0, time = 2500, delay = 500} )
            transition.to(A4,{ alpha = 1, time = 2000, delay = 500} )
            --Character Opacity Control
            transition.to( I3,{ alpha = 0.7, time = 400, delay = 1000 } )
        elseif(tapCount == 10)then
            --Character Pose Control
            transition.to(A4,{ alpha = 0, time = 2500, delay = 500} )
            transition.to(A3,{ alpha = 1, time = 2000, delay = 500} )
        elseif(tapCount == 11)then                                                      -- Akbar Goes Back Gul comes Front
            --Character Speak
            transition.to(AkbarName,{alpha = 0, time = 400, delay = 400})
            transition.to(GulName,{alpha = 1, time = 400, delay = 1000})
            --Akbar transition to background area
            transition.scaleTo( A1,{ xScale=1, yScale=1, time = 500 } )
            transition.to( A1,{ y = 50, x = 300, time = 500})
            transition.scaleTo( A2,{ xScale=1, yScale=1, time = 500 } )
            transition.to( A2,{ y = 50, x = 300, time = 500})
            transition.scaleTo( A3,{ xScale=1, yScale=1, time = 500 } )
            transition.to( A3,{ y = 50, x = 300, time = 500})
            transition.scaleTo( A4,{ xScale=1, yScale=1, time = 500 } )
            transition.to( A4,{ y = 50, x = 300, time = 500})
            transition.to( A3,{ alpha = 0.7, time = 400, delay = 1000 } )
            --Gul sprite 1 disappears and sprite 2 appears
            transition.to( G1,{ alpha = 0, time = 50} )
            transition.to( G2,{ alpha = 1, time = 25 })
            --Gul sprites enlarges moves to main speaking area
            transition.scaleTo( G2,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( G2,{ y = 125, x = 460, time = 500, delay = 300})
            transition.scaleTo( G3,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( G3,{ y = 125, x = 460, time = 500, delay = 300})
            transition.scaleTo( G4,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( G4,{ y = 125, x = 460, time = 500, delay = 300})
        elseif(tapCount == 13)then                                                      
            --Character Speak
            transition.to(GulName,{alpha = 0, time = 400, delay = 400})
            transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})
            --Character Pose Control
            transition.to(I3,{ alpha = 0, time = 2500, delay = 500} )
            transition.to(I5,{ alpha = 1, time = 2000, delay = 500} )
            --Character Opacity Control
            transition.to( G2,{ alpha = 0.7, time = 400, delay = 1000 } )
        elseif(tapCount == 16)then                                                  --Gul khan moves to back Amir comes front                                  
            --Character Speak
            transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
            transition.to(AmirName,{alpha = 1, time = 400, delay = 1000})
            --Gul transition to background area
            transition.scaleTo( G1,{ xScale=1, yScale=1, time = 500 } )
            transition.to( G1,{ y = 50, x = 180, time = 500})
            transition.scaleTo( G2,{ xScale=1, yScale=1, time = 500 } )
            transition.to( G2,{ y = 50, x = 180, time = 500})
            transition.scaleTo( G3,{ xScale=1, yScale=1, time = 500 } )
            transition.to( G3,{ y = 50, x = 180, time = 500})
            --Amir sprites enlarges moves to main speaking area
            transition.scaleTo( Amir1,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( Amir1,{ y = 125, x = 460, time = 500, delay = 300})
            transition.scaleTo( Amir2,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( Amir2,{ y = 125, x = 460, time = 500, delay = 300})
            transition.scaleTo( Amir3,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( Amir3,{ y = 125, x = 460, time = 500, delay = 300})
            --Character Opacity Control
            transition.to( I5,{ alpha = 0.7, time = 400, delay = 1000 } )
        elseif(tapCount == 18)then 
            --Character Speak
            transition.to(AmirName,{alpha = 0, time = 400, delay = 400})
            transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})
            --Character Opacity Control
            transition.to( Amir1,{ alpha = 0.7, time = 400, delay = 1000 } )
            transition.to( I5,{ alpha = 1, time = 400, delay = 1000 } )
        elseif(tapCount == 20)then 
            --Character Speak
            transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
            transition.to(AmirName,{alpha = 1, time = 400, delay = 1000})
            --Character Control
            transition.to(Amir1,{ alpha = 0, time = 2500, delay = 500} )
            transition.to(Amir2,{ alpha = 1, time = 2000, delay = 500} )
            --Character Opacity Control
            transition.to( I5,{ alpha = 0.7, time = 400, delay = 1000 } )
        elseif(tapCount == 21)then 
            --Dialogue Box Goes away
            transition.to(dialogBox,{alpha = 0, time = 400, delay = 400})
            transition.to(AmirName,{alpha = 0, time = 400, delay = 400})
            --Character Control
            transition.to(I5,{ alpha = 0, time = 2500, delay = 500} )
            transition.to(I1,{ alpha = 1, time = 2000, delay = 500} )
            --Character Opacity Control
            transition.to( Amir2,{ alpha = 0.7, time = 400, delay = 1000 } )
        elseif(tapCount == 22)then                                          --Akbar Comes to Front
            --Dialog Box comes back
            transition.to(dialogBox,{alpha = 1, time = 400, delay = 1500})
            --Character Speak
            transition.to(AmirName,{alpha = 0, time = 400, delay = 400})
            transition.to(AkbarName,{alpha = 1, time = 400, delay = 1500})
            --Amir transition to background area
            transition.scaleTo( Amir1,{ xScale=1, yScale=1, time = 500 } )
            transition.to( Amir1,{ y = 50, x = 240, time = 500})
            transition.scaleTo( Amir2,{ xScale=1, yScale=1, time = 500 } )
            transition.to( Amir2,{ y = 50, x = 240, time = 500})
            transition.scaleTo( Amir3,{ xScale=1, yScale=1, time = 500 } )
            transition.to( Amir3,{ y = 50, x = 240, time = 500})
            --All Akbar sprite transitions to talk area
            transition.scaleTo( A1,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( A1,{ y = 125, x = 460, time = 500, delay = 300})
            transition.scaleTo( A2,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( A2,{ y = 125, x = 460, time = 500, delay = 300})
            transition.scaleTo( A3,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( A3,{ y = 125, x = 460, time = 500, delay = 300})
            transition.scaleTo( A4,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( A4,{ y = 125, x = 460, time = 500, delay = 300})
            --Character Control
            transition.to(A3,{ alpha = 0, time = 2500, delay = 500} )
            transition.to(A2,{ alpha = 1, time = 2000, delay = 500} )
            --Character Opacity Control
            transition.to( I1,{ alpha = 0.7, time = 400, delay = 1000 } )
        elseif(tapCount == 25)then                                          
            --Character Speak
            transition.to(AkbarName,{alpha = 0, time = 400, delay = 400})
            transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})
            --Character Control
            transition.to(I1,{ alpha = 0, time = 2500, delay = 500} )
            transition.to(I5,{ alpha = 1, time = 2000, delay = 500} )
            --Character Opacity Control
            transition.to( A2,{ alpha = 0.7, time = 400, delay = 1000 } )
        elseif(tapCount == 26)then                                          
            --Character Speak
            transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
            transition.to(AkbarName,{alpha = 1, time = 400, delay = 1000})
            --Character Opacity Control
            transition.to( I5,{ alpha = 0.7, time = 400, delay = 1000 } )
            transition.to( A2,{ alpha = 1 , time = 400, delay = 1000 } )
        elseif(tapCount == 28)then                                              --AKbar goes back gul comes front
            --Character Speak
            transition.to(AkbarName,{alpha = 0, time = 400, delay = 400})
            transition.to(GulName,{alpha = 1, time = 400, delay = 1000})                                         
            --Akbar transition to background area
            transition.scaleTo( A1,{ xScale=1, yScale=1, time = 500 } )
            transition.to( A1,{ y = 50, x = 300, time = 500})
            transition.scaleTo( A2,{ xScale=1, yScale=1, time = 500 } )
            transition.to( A2,{ y = 50, x = 300, time = 500})
            transition.scaleTo( A3,{ xScale=1, yScale=1, time = 500 } )
            transition.to( A3,{ y = 50, x = 300, time = 500})
            transition.scaleTo( A4,{ xScale=1, yScale=1, time = 500 } )
            transition.to( A4,{ y = 50, x = 300, time = 500})
            transition.to( A2,{ alpha = 0.7, time = 400, delay = 1000 } )
            --Gul sprites enlarges moves to main speaking area
            transition.scaleTo( G2,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( G2,{ y = 125, x = 460, time = 500, delay = 300})
            transition.scaleTo( G3,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( G3,{ y = 125, x = 460, time = 500, delay = 300})
            transition.scaleTo( G4,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( G4,{ y = 125, x = 460, time = 500, delay = 300})
            --Opacity control
            transition.to( G2,{ alpha = 1, time = 400, delay = 1000 } )
        elseif(tapCount == 29)then                                                 --Gull goes back Akbar comes front
             --Character Speak
             transition.to(GulName,{alpha = 0, time = 400, delay = 400})
             transition.to(AkbarName,{alpha = 1, time = 400, delay = 1000})    
             --Gul transition to background area
             transition.scaleTo( G2,{ xScale=1, yScale=1, time = 500 } )
             transition.to( G2,{ y = 50, x = 180, time = 500})
             transition.scaleTo( G3,{ xScale=1, yScale=1, time = 500 } )
             transition.to( G3,{ y = 50, x = 180, time = 500})
             transition.scaleTo( G4,{ xScale=1, yScale=1, time = 500 } )
             transition.to( G4,{ y = 50, x = 180, time = 500})
             transition.to(G2,{alpha = 0.7, time = 400, delay = 1000})    
             --All Akbar sprite transitions to talk area
             transition.scaleTo( A1,{ xScale=2, yScale=2, time = 500, delay = 300 } )
             transition.to( A1,{ y = 125, x = 460, time = 500, delay = 300})
             transition.scaleTo( A2,{ xScale=2, yScale=2, time = 500, delay = 300 } )
             transition.to( A2,{ y = 125, x = 460, time = 500, delay = 300})
             transition.scaleTo( A3,{ xScale=2, yScale=2, time = 500, delay = 300 } )
             transition.to( A3,{ y = 125, x = 460, time = 500, delay = 300})
             transition.scaleTo( A4,{ xScale=2, yScale=2, time = 500, delay = 300 } )
             transition.to( A4,{ y = 125, x = 460, time = 500, delay = 300})
             --Opacity control
            transition.to( A2,{ alpha = 1, time = 400, delay = 1000 } )
        elseif(tapCount == 31)then 
            --Character Speak
            transition.to(AkbarName,{alpha = 0, time = 400, delay = 400})
            transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})  
            --Opacity control
            transition.to( A2,{ alpha = 0.7, time = 400, delay = 1000 } )
            transition.to( I5,{ alpha = 1, time = 400, delay = 1000 } )
        elseif(tapCount == 32)then
            --Character Speak
            transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
            transition.to(AmirName,{alpha = 1, time = 400, delay = 1000}) 
            --Akbar transition to background area
            transition.scaleTo( A1,{ xScale=1, yScale=1, time = 500 } )
            transition.to( A1,{ y = 50, x = 300, time = 500})
            transition.scaleTo( A2,{ xScale=1, yScale=1, time = 500 } )
            transition.to( A2,{ y = 50, x = 300, time = 500})
            transition.scaleTo( A3,{ xScale=1, yScale=1, time = 500 } )
            transition.to( A3,{ y = 50, x = 300, time = 500})
            transition.scaleTo( A4,{ xScale=1, yScale=1, time = 500 } )
            transition.to( A4,{ y = 50, x = 300, time = 500})
            transition.to( A2,{ alpha = 0.7, time = 400, delay = 1000 } )
            --Amir sprites enlarges moves to main speaking area
            transition.scaleTo( Amir1,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( Amir1,{ y = 125, x = 460, time = 500, delay = 300})
            transition.scaleTo( Amir2,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( Amir2,{ y = 125, x = 460, time = 500, delay = 300})
            transition.scaleTo( Amir3,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( Amir3,{ y = 125, x = 460, time = 500, delay = 300})
            --Character Control
            transition.to(Amir2,{ alpha = 0, time = 2500, delay = 500} )
            transition.to(Amir1,{ alpha = 1, time = 2000, delay = 500} )
            --Opacity control
            transition.to( I5,{ alpha = 0.7, time = 400, delay = 1000 } )
        elseif(tapCount == 33)then
            --Character Speak
            transition.to(AmirName,{alpha = 0, time = 400, delay = 400})
            transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000}) 
            --Opacity control
            transition.to( Amir1,{ alpha = 0.7, time = 400, delay = 1000 } )
            transition.to( I5,{ alpha = 1, time = 400, delay = 1000 } )
        elseif(tapCount == 36)then                                   --Amir Goes back Akbar comes Front
            --Character Speak
            transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
            transition.to(AkbarName,{alpha = 1, time = 400, delay = 1000}) 
            --Amir transition to background area
            transition.scaleTo( Amir1,{ xScale=1, yScale=1, time = 500 } )
            transition.to( Amir1,{ y = 50, x = 240, time = 500})
            transition.scaleTo( Amir2,{ xScale=1, yScale=1, time = 500 } )
            transition.to( Amir2,{ y = 50, x = 240, time = 500})
            transition.scaleTo( Amir3,{ xScale=1, yScale=1, time = 500 } )
            transition.to( Amir3,{ y = 50, x = 240, time = 500})
            --All Akbar sprite transitions to talk area
            transition.scaleTo( A1,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( A1,{ y = 125, x = 460, time = 500, delay = 300})
            transition.scaleTo( A2,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( A2,{ y = 125, x = 460, time = 500, delay = 300})
            transition.scaleTo( A3,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( A3,{ y = 125, x = 460, time = 500, delay = 300})
            transition.scaleTo( A4,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( A4,{ y = 125, x = 460, time = 500, delay = 300})
            --Opacity control
            transition.to( A2,{ alpha = 1, time = 400, delay = 1000 } )
            transition.to( I5,{ alpha = 0.7, time = 400, delay = 1000 } )
        elseif(tapCount == 38)then
            --Character Speak
            transition.to(AkbarName,{alpha = 0, time = 400, delay = 400})
            transition.to(GulName,{alpha = 1, time = 400, delay = 1000})
            --Akbar transition to background area
            transition.scaleTo( A1,{ xScale=1, yScale=1, time = 500 } )
            transition.to( A1,{ y = 50, x = 300, time = 500})
            transition.scaleTo( A2,{ xScale=1, yScale=1, time = 500 } )
            transition.to( A2,{ y = 50, x = 300, time = 500})
            transition.scaleTo( A3,{ xScale=1, yScale=1, time = 500 } )
            transition.to( A3,{ y = 50, x = 300, time = 500})
            transition.scaleTo( A4,{ xScale=1, yScale=1, time = 500 } )
            transition.to( A4,{ y = 50, x = 300, time = 500})
            transition.to( A2,{ alpha = 0.7, time = 400, delay = 1000 } )
            --Gul sprites enlarges moves to main speaking area
            transition.scaleTo( G2,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( G2,{ y = 125, x = 460, time = 500, delay = 300})
            transition.scaleTo( G3,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( G3,{ y = 125, x = 460, time = 500, delay = 300})
            transition.scaleTo( G4,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( G4,{ y = 125, x = 460, time = 500, delay = 300})
            --Character Opacity
            transition.to( G2,{ alpha = 1, time = 400, delay = 1000 } )
        elseif(tapCount == 39)then
            --Character Speak
            transition.to(GulName,{alpha = 0, time = 400, delay = 400})
            transition.to(AkbarName,{alpha = 1, time = 400, delay = 1000})    
            --Gul transition to background area
            transition.scaleTo( G2,{ xScale=1, yScale=1, time = 500 } )
            transition.to( G2,{ y = 50, x = 180, time = 500})
            transition.scaleTo( G3,{ xScale=1, yScale=1, time = 500 } )
            transition.to( G3,{ y = 50, x = 180, time = 500})
            transition.scaleTo( G4,{ xScale=1, yScale=1, time = 500 } )
            transition.to( G4,{ y = 50, x = 180, time = 500})
            transition.to(G2,{alpha = 0.7, time = 400, delay = 1000})    
            --All Akbar sprite transitions to talk area
            transition.scaleTo( A1,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( A1,{ y = 125, x = 460, time = 500, delay = 300})
            transition.scaleTo( A2,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( A2,{ y = 125, x = 460, time = 500, delay = 300})
            transition.scaleTo( A3,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( A3,{ y = 125, x = 460, time = 500, delay = 300})
            transition.scaleTo( A4,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( A4,{ y = 125, x = 460, time = 500, delay = 300})
            --Character Opacity
            transition.to( A2,{ alpha = 1, time = 400, delay = 1000 } )
        elseif(tapCount == 40)then
            --Character Speak
            transition.to(AkbarName,{alpha = 0, time = 400, delay = 400})
            transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})  
            --Character Control
            transition.to(I5,{ alpha = 0, time = 2500, delay = 500} )
            transition.to(I4,{ alpha = 1, time = 2000, delay = 500} )
            --Character Opacity
            transition.to( A2,{ alpha = 0.7, time = 400, delay = 1000 } )
        elseif(tapCount == 41)then
            --Character Speak
            transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
            transition.to(AkbarName,{alpha = 1, time = 400, delay = 1000})
            --Character Opacity
            transition.to( A2,{ alpha = 1, time = 400, delay = 1000 } )
            transition.to( I4,{ alpha = 0.7, time = 400, delay = 1000 } )
        elseif(tapCount == 42)then
            --Character Speak
            transition.to(AkbarName,{alpha = 0, time = 400, delay = 400})
            transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})
            --Character Control
            transition.to(I4,{ alpha = 0, time = 2500, delay = 500} )
            transition.to(I5,{ alpha = 1, time = 2000, delay = 500} )
            --Character Opacity
            transition.to( A2,{ alpha = 0.7, time = 400, delay = 1000 } )
        elseif(tapCount == 43)then
            --Character Speak
            transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
            transition.to(AkbarName,{alpha = 1, time = 400, delay = 1000})
            --Character Control
            transition.to( Muavia,{ alpha = 1, time = 1000, delay = 2000 } )
            --Character Opacity
            transition.to( A2,{ alpha = 1, time = 400, delay = 1000 } )
            transition.to( I5,{ alpha = 0.7, time = 400, delay = 1000 } )
        elseif(tapCount == 45)then
            --Character Speak
            transition.to(AkbarName,{alpha = 0, time = 400, delay = 400})
            transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})
            --Character Control
            transition.to(I5,{ alpha = 0, time = 2500, delay = 500} )
            transition.to(I8,{ alpha = 1, time = 2000, delay = 500} )
            --Character Opacity
            transition.to( A2,{ alpha = 0.7, time = 400, delay = 1000 } )
        elseif(tapCount == 46)then
            --Character Speak
            transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
            transition.to(AkbarName,{alpha = 1, time = 400, delay = 1000})
            --Character Control
            transition.to(A2,{ alpha = 0, time = 2500, delay = 500} )
            transition.to(A3,{ alpha = 1, time = 2000, delay = 500} )
            --Character Opacity
            transition.to( I8,{ alpha = 0.7, time = 400, delay = 1000 } )
        elseif(tapCount == 47)then
            --Character Control
            transition.to(A3,{ alpha = 0, time = 2500, delay = 500} )
            transition.to(A2,{ alpha = 1, time = 2000, delay = 500} )
        elseif(tapCount == 48)then
            --Character Speak
            transition.to(AkbarName,{alpha = 0, time = 400, delay = 400})
            transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})
            --Character Control
            transition.to(I8,{ alpha = 0, time = 2500, delay = 500} )
            transition.to(I5,{ alpha = 1, time = 2000, delay = 500} )
            --Character Opacity
            transition.to( A2,{ alpha = 0.7, time = 400, delay = 1000 } )
        elseif(tapCount == 49)then
            --Character Speak
            transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
            transition.to(AkbarName,{alpha = 1, time = 400, delay = 1000})
            --Character Opacity
            transition.to( A2,{ alpha = 1, time = 400, delay = 1000 } )
            transition.to( I5,{ alpha = 0.7, time = 400, delay = 1000 } )
        elseif(tapCount == 50)then
            --Character Control
            transition.to(A2,{ alpha = 0, time = 2500, delay = 500} )
            transition.to(A1,{ alpha = 1, time = 2000, delay = 500} )
        elseif(tapCount == 51)then
            --Character Speak
            transition.to(AkbarName,{alpha = 0, time = 400, delay = 400})
            transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})
            --Character Opacity
            transition.to( A1,{ alpha = 0.7, time = 400, delay = 1000 } )
            transition.to( I5,{ alpha = 1, time = 400, delay = 1000 } )
        elseif(tapCount == 52)then
            --Character Speak
            transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
            transition.to(AkbarName,{alpha = 1, time = 400, delay = 1000})
            --Character Control
            transition.to(A1,{ alpha = 0, time = 2500, delay = 500} )
            transition.to(A2,{ alpha = 1, time = 2000, delay = 500} )
            transition.to( Muavia,{ alpha = 0, time = 1000, delay = 2000 } )
            --Character Opacity
            transition.to( I5,{ alpha = 0.7, time = 400, delay = 1000 } )
        elseif(tapCount == 53)then
            --Character Speak
            transition.to(AkbarName,{alpha = 0, time = 400, delay = 400})
            transition.to(AmirName,{alpha = 1, time = 400, delay = 1000})
            --Akbar transition to background area
            transition.scaleTo( A1,{ xScale=1, yScale=1, time = 500 } )
            transition.to( A1,{ y = 50, x = 300, time = 500})
            transition.scaleTo( A2,{ xScale=1, yScale=1, time = 500 } )
            transition.to( A2,{ y = 50, x = 300, time = 500})
            transition.scaleTo( A3,{ xScale=1, yScale=1, time = 500 } )
            transition.to( A3,{ y = 50, x = 300, time = 500})
            transition.scaleTo( A4,{ xScale=1, yScale=1, time = 500 } )
            transition.to( A4,{ y = 50, x = 300, time = 500})
            transition.to( A2,{ alpha = 0.7, time = 400, delay = 1000 } )
            --Amir sprites enlarges moves to main speaking area
            transition.scaleTo( Amir1,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( Amir1,{ y = 125, x = 460, time = 500, delay = 300})
            transition.scaleTo( Amir2,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( Amir2,{ y = 125, x = 460, time = 500, delay = 300})
            transition.scaleTo( Amir3,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( Amir3,{ y = 125, x = 460, time = 500, delay = 300})  
            --Opacity Control
            transition.to(Amir1,{time = 400, delay = 1000, alpha = 1})          
        elseif(tapCount == 54)then
            --Character Speak
            transition.to(AmirName,{alpha = 0, time = 400, delay = 400})
            transition.to(AkbarName,{alpha = 1, time = 400, delay = 1000})
            --Amir transition to background area
            transition.scaleTo( Amir1,{ xScale=1, yScale=1, time = 500 } )
            transition.to( Amir1,{ y = 50, x = 240, time = 500})
            transition.scaleTo( Amir2,{ xScale=1, yScale=1, time = 500 } )
            transition.to( Amir2,{ y = 50, x = 240, time = 500})
            transition.scaleTo( Amir3,{ xScale=1, yScale=1, time = 500 } )
            transition.to( Amir3,{ y = 50, x = 240, time = 500})
            --All Akbar sprite transitions to talk area
            transition.scaleTo( A1,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( A1,{ y = 125, x = 460, time = 500, delay = 300})
            transition.scaleTo( A2,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( A2,{ y = 125, x = 460, time = 500, delay = 300})
            transition.scaleTo( A3,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( A3,{ y = 125, x = 460, time = 500, delay = 300})
            transition.scaleTo( A4,{ xScale=2, yScale=2, time = 500, delay = 300 } )
            transition.to( A4,{ y = 125, x = 460, time = 500, delay = 300})
            --Character Control
            transition.to(A2,{ alpha = 0, time = 2500, delay = 500} )
            transition.to(A1,{ alpha = 1, time = 2000, delay = 500} )
            --Opacity Control
            transition.to(Amir1,{time = 400, delay = 1000, alpha = 0.7})
        elseif(tapCount == 55)then
            --Character Speak
            transition.to(AkbarName,{alpha = 0, time = 400, delay = 400})
            transition.to(IsaacName,{alpha = 1, time = 400, delay = 1000})
            --Character Control
            transition.to(I5,{ alpha = 0, time = 2500, delay = 500} )
            transition.to(I3,{ alpha = 1, time = 2000, delay = 500} )
            transition.to(A1,{time = 2000, delay = 3000, alpha = 0})
            transition.to(Amir1,{time = 2000, delay = 3000, alpha = 0})
            transition.to(G2,{time = 2000, delay = 3000, alpha = 0})
            --Opacity Control
            transition.to(I3,{time = 400, delay = 1000, alpha = 1})
            transition.to(A1,{time = 400, delay = 1000, alpha = 0.7})
        elseif(tapCount == 56)then
            transition.to(I3,{ alpha = 0, time = 2500, delay = 500} )
            transition.to(I2,{ alpha = 1, time = 2000, delay = 500} )
        elseif(tapCount == 57)then
            --Dialogue Box Goes away
            transition.to(dialogBox,{alpha = 0, time = 400, delay = 400})
            transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
        elseif(tapCount == 58)then
            --Dialog Box comes back
            transition.to(dialogBox,{alpha = 1, time = 400, delay = 1500})
            transition.to(IsaacName,{alpha = 1, time = 400, delay = 1500})
            --Character Control
            transition.to(I2,{ alpha = 0, time = 2500, delay = 500} )
            transition.to(I10,{ alpha = 1, time = 2000, delay = 500} )
        elseif(tapCount == 59)then
            --Character Control
            transition.to(I10,{ alpha = 0, time = 2500, delay = 500} )
            transition.to(I9,{ alpha = 1, time = 2000, delay = 500} )
        elseif(tapCount == 60)then
            --Character Control
            transition.to(I9,{ alpha = 0, time = 2500, delay = 500} )
            transition.to(I10,{ alpha = 1, time = 2000, delay = 500} )
        elseif(tapCount == 63)then
            --Dialogue Box Goes away
            transition.to(dialogBox,{alpha = 0, time = 400, delay = 400})
            transition.to(IsaacName,{alpha = 0, time = 400, delay = 400})
        elseif(tapCount == 64)then
            --Dialog Box comes back
            transition.to(dialogBox,{alpha = 1, time = 400, delay = 1500})
            transition.to(IsaacName,{alpha = 1, time = 400, delay = 1500})
            --Character Control
            transition.to(I10,{ alpha = 0, time = 2500, delay = 500} )
            transition.to(I11,{ alpha = 1, time = 2000, delay = 500} )
        end
end
 
local function bringToFront()
    dialogBox:toFront()
    button:toFront()
    buttonOuter:toFront()
end
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    background = display.newImageRect(sceneGroup, "Scene10Assets/bg_10.png", 565, 350)
    background.x = display.contentCenterX 
    background.y = display.contentCenterY
    background.alpha = 0

    --Scene Location Text
    LocationTextUpper = display.newText( sceneGroup,"Military Facility", 112, 250, "Scene3Assets/Fox", 14 )
    LocationTextUpper.alpha = 0
    LocationTextLower = display.newText( sceneGroup,"16:57", 112, 272, "UI_Elements/Digital-Clock", 16 )
    LocationTextLower.alpha = 0

    --Divider PNG Image
    LocationDivider = display.newImageRect( sceneGroup, "Scene3Assets/divider.png", 150, 8)
    LocationDivider.x =  600
    LocationDivider.y =  259

    --Dialog Box PNG 
    dialogBox = display.newImageRect( sceneGroup, "Scene3Assets/textbox.png", 560, 110)
    dialogBox.x = display.contentCenterX 
    dialogBox.y = display.contentCenterY + 99
    dialogBox.alpha = 0

    --Dialogue Strings
    DialogText1 = display.newText(Dialogue.Scene10[start]  , 240, 235, "UI_Elements/OpenSans-Light", 12)
    DialogText1:setFillColor( 0, 0, 0 )
    DialogText1.alpha = 0
    DialogText2 = display.newText(Dialogue.Scene10[mid1]  , 240, 255, "UI_Elements/OpenSans-Light", 12)
    DialogText2:setFillColor( 0, 0, 0 )
    DialogText2.alpha = 0
    DialogText3 = display.newText(Dialogue.Scene10[mid2]  , 240, 275, "UI_Elements/OpenSans-Light", 12)
    DialogText3:setFillColor( 0, 0, 0 )
    DialogText3.alpha = 0
    DialogText4 = display.newText(Dialogue.Scene10[finish]  , 240, 295, "UI_Elements/OpenSans-Light", 12)
    DialogText4:setFillColor( 0, 0, 0 )
    DialogText4.alpha = 0

    IsaacName = display.newText("Isaac", 15, 235, "UI_Elements/Ceria-Lebaran", 20)
    IsaacName:setFillColor(0,0,0)
    IsaacName.alpha = 0

    AkbarName = display.newText("Akbar", 15, 235, "UI_Elements/Ceria-Lebaran", 20)
    AkbarName:setFillColor(0,0,0)
    AkbarName.alpha = 0

    GulName = display.newText("Gul Khan", 20, 235, "UI_Elements/Ceria-Lebaran", 20)
    GulName:setFillColor(0,0,0)
    GulName.alpha = 0

    AmirName = display.newText("Amir", 15, 235, "UI_Elements/Ceria-Lebaran", 20)
    AmirName:setFillColor(0,0,0)
    AmirName.alpha = 0

    --Isaac Poses
    I1 = display.newImageRect( sceneGroup, objectSheet2, 1, 175, 225 ) -- Isaac Slightly pissed
	I1.x = display.contentCenterX - 200
	I1.y = display.contentCenterY + 10
	I1.myName = "I1"
	I1.alpha = 0

	I2 = display.newImageRect( sceneGroup, objectSheet2, 2, 175, 225 ) -- Isaac Aggressive
	I2.x = display.contentCenterX - 200
	I2.y = display.contentCenterY + 10
	I2.myName = "I2"
	I2.alpha = 0

	I3 = display.newImageRect( sceneGroup, objectSheet2, 3, 175, 225 ) -- Isaac Normal
	I3.x = display.contentCenterX - 200
	I3.y = display.contentCenterY + 10
	I3.myName = "I3"
    I3.alpha = 0

    I4 = display.newImageRect( sceneGroup, objectSheet2, 4, 175, 225 ) -- Isaac Oppressed
	I4.x = display.contentCenterX - 200
	I4.y = display.contentCenterY + 10
	I4.myName = "I4"
	I4.alpha = 0

	I5 = display.newImageRect( sceneGroup, objectSheet2, 5, 175, 225 ) -- Isaac Determined
	I5.x = display.contentCenterX - 200
	I5.y = display.contentCenterY + 10
	I5.myName = "I5"
	I5.alpha = 0

	I6 = display.newImageRect( sceneGroup, objectSheet2, 6, 175, 225 ) -- Isaac listening
	I6.x = display.contentCenterX - 200
	I6.y = display.contentCenterY + 10
	I6.myName = "I6"
    I6.alpha = 0

    I7 = display.newImageRect( sceneGroup, objectSheet2, 7, 175, 225 ) -- Isaac Threatening
	I7.x = display.contentCenterX - 200
	I7.y = display.contentCenterY + 10
	I7.myName = "I7"
	I7.alpha = 0

	I8 = display.newImageRect( sceneGroup, objectSheet2, 8, 175, 225 ) -- Isaac crooked eyebrow
	I8.x = display.contentCenterX - 200
	I8.y = display.contentCenterY + 10
	I8.myName = "I8"
    I8.alpha = 0

    I9 = display.newImageRect( sceneGroup, objectSheet3, 1, 175, 225 ) -- Isaac Phone Crooked eyebrow
	I9.x = display.contentCenterX - 200
	I9.y = display.contentCenterY + 10
	I9.myName = "I9"
    I9.alpha = 0

    I10 = display.newImageRect( sceneGroup, objectSheet3, 2, 175, 225 ) -- Isaac Phone Determined
	I10.x = display.contentCenterX - 200
	I10.y = display.contentCenterY + 10
	I10.myName = "I10"
    I10.alpha = 0

    I11 = display.newImageRect( sceneGroup, objectSheet3, 3, 175, 225 ) -- Isaac Phone Angry
	I11.x = display.contentCenterX - 200
	I11.y = display.contentCenterY + 10
	I11.myName = "I11"
    I11.alpha = 0

    A1 = display.newImageRect( sceneGroup, objectSheet, 1, 50, 80 ) -- Akbar Smiles
	A1.x = 300
	A1.y = 50
	A1.myName = "A1"
    A1.alpha = 0

    A2 = display.newImageRect( sceneGroup, objectSheet, 2, 50, 80 ) -- Akbar unhappy
	A2.x = 300
	A2.y = 50
	A2.myName = "A2"
    A2.alpha = 0

    A3 = display.newImageRect( sceneGroup, objectSheet, 3, 50, 80 )
	A3.x = 300
	A3.y = 50
	A3.myName = "A3"
    A3.alpha = 0

    A4 = display.newImageRect( sceneGroup, objectSheet, 4, 50, 80 ) --Akbar sweating
	A4.x = 300
	A4.y = 50
	A4.myName = "A4"
    A4.alpha = 0

    --Gul first sprite
    G1 = display.newImageRect( sceneGroup, objectSheet, 8 ,50, 80 )
    G1.x = 180
    G1.y = 50
    G1.alpha = 0
    
    G2 = display.newImageRect( sceneGroup, objectSheet, 9, 50, 80 )
    G2.x = 180
    G2.y = 50
    G2.alpha = 0

    G3 = display.newImageRect( sceneGroup, objectSheet, 10, 50, 80 )
    G3.x = 180
    G3.y = 50
    G3.alpha = 0

    G4 = display.newImageRect( sceneGroup, objectSheet, 11, 50, 80 )
    G4.x = 180
    G4.y = 50
    G4.alpha = 0

    --Amir first sprite
    Amir1 = display.newImageRect( sceneGroup, objectSheet, 5, 50, 80 )
    Amir1.x = 240
    Amir1.y = 50
    Amir1.alpha = 0

    --Amir first sprite
    Amir2 = display.newImageRect( sceneGroup, objectSheet, 6, 50, 80 )
    Amir2.x = 240
    Amir2.y = 50
    Amir2.alpha = 0

    --Amir first sprite
    Amir3 = display.newImageRect( sceneGroup, objectSheet, 7, 50, 80 )
    Amir3.x = 240
    Amir3.y = 50
    Amir3.alpha = 0

    --Muavia
    Muavia = display.newImageRect( sceneGroup, "Scene10Assets/Muavia.png", 120, 120 ) -- Muavia Target Image
	Muavia.x = display.contentCenterX 
	Muavia.y = display.contentCenterY - 20
	Muavia.alpha = 0
    
    --Button
    button = display.newImageRect( sceneGroup, "Scene3Assets/blue.png", 20, 20 )
    button.x = display.contentCenterX + 240
    button.y = display.contentCenterY + 105
    button.alpha = 0

    --Button Outer
    buttonOuter = display.newImageRect( sceneGroup, "Scene3Assets/blueOuter.png", 30, 30 )
    buttonOuter.x = display.contentCenterX + 240
    buttonOuter.y = display.contentCenterY + 105
    buttonOuter.alpha = 0

    bringToFront()

    --Location Text Appears Function Call
    timer.performWithDelay(5000, LocationTextAppear)

    --Background transitions into the scene
    transition.to(background,{time = 5000, delay = 8500, alpha = 1})

    --Isaac appears in the scene with first pose
    transition.to( I3,{ alpha = 1, time = 2000, delay = 16000 } )

    --Button Appears
    timer.performWithDelay( 16000 , buttonReappear)
    transition.to(buttonOuter,{time = 1, delay = 19000, alpha = 1})

    button:addEventListener( "tap", dialogFunction)
    button:addEventListener( "tap", CharControl)
    button:addEventListener( "tap", buttonReappear)
    button:addEventListener( "tap", outerRotate)
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