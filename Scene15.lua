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
local sheetOptionsViviana =
{
    
    frames = {
    
        {
            -- V1
            x=579,
            y=1,
            width=438,
            height=1000,

        },
        {
            -- V2
            x=1,
            y=1003,
            width=551,
            height=1000,

        },
        {
            -- V3
            x=554,
            y=1003,
            width=523,
            height=1000,

        },
        {
            -- V4
            x=1,
            y=1,
            width=576,
            height=1000,

        },
    },

    sheetContentWidth = 1078,
    sheetContentHeight = 2004
}

--Conigure Image Sheet
local sheetOptionsGoons =
{
    
    frames = {
    
        {
            -- G1
            x=1,
            y=1,
            width=607,
            height=650,

        },
        {
            -- G2
            x=610,
            y=1,
            width=607,
            height=650,

        },
        {
            -- G3
            x=1219,
            y=1,
            width=607,
            height=650,

        },
        {
            -- G4
            x=1,
            y=653,
            width=607,
            height=650,

        },
        {
            -- G5
            x=610,
            y=653,
            width=607,
            height=650,

        },
        {
            -- G6
            x=1219,
            y=653,
            width=607,
            height=650,

        },
    },

    sheetContentWidth = 1827,
    sheetContentHeight = 1304
}

--------------------------------------------------------------------------------------------------------------------
local objectSheet = graphics.newImageSheet( "Scene15Assets/ViviSpriteSheet.png", sheetOptionsViviana ) 

local objectSheet2 = graphics.newImageSheet( "Scene15Assets/GoonsSpriteSheet.png", sheetOptionsGoons ) 


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
      DialogText1 = display.newText(Dialogue.Scene15[start]  , 240, 240, "UI_Elements/OpenSans-Light", 12)
      DialogText1:setFillColor( 0, 0, 0 )
      DialogText1.alpha = 0
      DialogText2 = display.newText(Dialogue.Scene15[mid1]  , 240, 260, "UI_Elements/OpenSans-Light", 12)
      DialogText2:setFillColor( 0, 0, 0 )
      DialogText2.alpha = 0
      DialogText3 = display.newText(Dialogue.Scene15[mid2]  , 240, 280, "UI_Elements/OpenSans-Light", 12)
      DialogText3:setFillColor( 0, 0, 0 )
      DialogText3.alpha = 0
      DialogText4 = display.newText(Dialogue.Scene15[finish]  , 240, 300, "UI_Elements/OpenSans-Light", 12)
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
        transition.to(dialogBox,{time = 400, delay = 1000, alpha = 0.95})
        transition.to(VivianaName,{time = 400, delay = 1000, alpha = 1 })
        transition.to(V1,{time = 2500, delay = 500, alpha = 1})
    elseif(tapCount == 2)then
        transition.to(V1,{  time = 2500, delay = 500, alpha = 0} )
        transition.to(V4,{  time = 2000, delay = 500, alpha = 1}) 
        transition.to(V4,{ x = 120, time = 2000, delay = 2500 })
    elseif(tapCount == 3)then
        transition.to(V1,{ x = 100, time = 1})
        transition.to(V2,{ x = 100, time = 1})
        transition.to(V3,{ x = 100, time = 1})
        transition.to(V4,{time = 2500, delay = 500, alpha = 0})
        transition.to(V1,{time = 2000, delay = 500, alpha = 1})
    elseif(tapCount == 6)then
        transition.to(dialogBox,{ time = 400, delay = 400, alpha = 0})
        transition.to(VivianaName,{time = 400, delay = 400, alpha = 0})
        transition.to(G2,{time = 2500, delay = 500, alpha = 1})
        transition.to(V1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 7)then
        transition.to(dialogBox,{time = 400, delay = 1000, alpha = 0.95})
        transition.to(VivianaName,{time = 1000, delay = 400, alpha = 1})
        transition.to(V1,{time = 1000, delay = 400, alpha = 1} )
        transition.to(G2,{time = 2500, delay = 500, alpha = 0.75})
    elseif(tapCount == 8)then
        transition.to(VivianaName,{time = 400, delay = 400, alpha = 0})
        transition.to(GoonsName,{time = 400, delay = 1000, alpha = 1})
        transition.to(G2,{time = 2500, delay = 500, alpha = 0})
        transition.to(G1,{time = 2000, delay = 500, alpha = 1})
        transition.to(V1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 9)then
        transition.to(GoonsName,{time = 400, delay = 400, alpha = 0})
        transition.to(VivianaName,{time = 400, delay = 1000, alpha = 1})
        transition.to(V1,{time = 2000, delay = 500, alpha = 1})
        transition.to(G1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 10)then
        transition.to(V1,{time = 2500, delay = 500, alpha = 0})
        transition.to(V2,{time = 2000, delay = 500, alpha = 1})
    elseif(tapCount == 11)then
        transition.to(VivianaName,{time = 400, delay = 400, alpha = 0})
        transition.to(GoonsName,{time = 400, delay = 1000, alpha = 1})
        transition.to(G1,{time = 2500, delay = 500, alpha = 0})
        transition.to(G5,{time = 2000, delay = 500, alpha = 1})
        transition.to(V2,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 12)then
        transition.to(GoonsName,{time = 400, delay = 400, alpha = 0})
        transition.to(VivianaName,{time = 400, delay = 1000, alpha = 1})
        transition.to(V2,{time = 2500, delay = 500, alpha = 0})
        transition.to(V3,{time = 2000, delay = 500, alpha = 1})
        transition.to(G5,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 14)then
        transition.to(VivianaName,{time = 400, delay = 400, alpha = 0})
        transition.to(GoonsName,{time = 400, delay = 1000, alpha = 1})
        transition.to(G5,{time = 2500, delay = 500, alpha = 0})
        transition.to(G1,{time = 2000, delay = 500, alpha = 1})
        transition.to(V3,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 15)then
        transition.to(GoonsName,{time = 400, delay = 400, alpha = 0})
        transition.to(VivianaName,{time = 400, delay = 1000, alpha = 1})
        transition.to(V3,{time = 2500, delay = 500, alpha = 0})
        transition.to(V1,{time = 2000, delay = 500, alpha = 1})
        transition.to(G1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 16)then
        transition.to(VivianaName,{time = 400, delay = 400, alpha = 0})
        transition.to(GoonsName,{time = 400, delay = 1000, alpha = 1})
        transition.to(G1,{time = 2500, delay = 500, alpha = 0})
        transition.to(G3,{time = 2000, delay = 500, alpha = 1})
        transition.to(V1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 18)then
        transition.to(GoonsName,{time = 400, delay = 400, alpha = 0})
        transition.to(VivianaName,{time = 400, delay = 1000, alpha = 1})
        transition.to(V1,{time = 1000, delay = 400, alpha = 1} )
        transition.to(G3,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 19)then
        transition.to(VivianaName,{time = 400, delay = 400, alpha = 0})
        transition.to(GoonsName,{time = 400, delay = 1000, alpha = 1})
        transition.to(G3,{time = 1000, delay = 400, alpha = 1} )
        transition.to(V1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 21)then
        transition.to(GoonsName,{time = 400, delay = 400, alpha = 0})
        transition.to(VivianaName,{time = 400, delay = 1000, alpha = 1})
        transition.to(V1,{time = 1000, delay = 400, alpha = 1} )
        transition.to(G3,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 22)then
        transition.to(VivianaName,{time = 400, delay = 400, alpha = 0})
        transition.to(GoonsName,{time = 400, delay = 1000, alpha = 1})
        transition.to(G3,{time = 2500, delay = 500, alpha = 0})
        transition.to(G2,{time = 2000, delay = 500, alpha = 1})
        transition.to(V1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 24)then
        transition.to(GoonsName,{time = 400, delay = 400, alpha = 0})
        transition.to(VivianaName,{time = 400, delay = 1000, alpha = 1})
        transition.to(V1,{time = 2000, delay = 500, alpha = 1})
        transition.to(G2,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 25)then
        transition.to(VivianaName,{time = 400, delay = 400, alpha = 0})
        transition.to(GoonsName,{time = 400, delay = 1000, alpha = 1})
        transition.to(G2,{time = 2000, delay = 500, alpha = 1})
        transition.to(V1,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 26)then
        transition.to(GoonsName,{time = 400, delay = 400, alpha = 0})
        transition.to(VivianaName,{time = 400, delay = 1000, alpha = 1})
        transition.to(V1,{time = 2500, delay = 500, alpha = 0})
        transition.to(V4,{time = 2000, delay = 500, alpha = 1})
        transition.to(V4,{x = 50, time = 2000, delay = 500})
        transition.to(V4,{time = 2500, delay = 3000, alpha = 0})
        transition.to(G2,{time = 1000, delay = 400, alpha = 0.75} )
    elseif(tapCount == 27)then
        transition.to(VivianaName,{time = 400, delay = 400, alpha = 0})
        transition.to(GoonsName,{time = 400, delay = 1000, alpha = 1})
        transition.to(G2,{time = 2000, delay = 500, alpha = 1})
        transition.to(G4,{time = 2500, delay = 3000, alpha = 0})
    elseif(tapCount == 29)then
        transition.to(G4,{time = 2500, delay = 500, alpha = 0})
        transition.to(G6,{time = 2000, delay = 500, alpha = 1})
    elseif(tapCount == 30)then
        transition.to(G6,{time = 2500, delay = 500, alpha = 0})
        transition.to(G2,{time = 2000, delay = 500, alpha = 1})
    elseif(tapCount == 32)then
        transition.to(G2,{time = 2500, delay = 500, alpha = 0})
        transition.to(G1,{time = 2000, delay = 500, alpha = 1})
    end
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    --Scene Background
    background = display.newImageRect( sceneGroup, "Scene15Assets/15_bg.png", 940, 550)
    background.x = display.contentCenterX + 65
    background.y = display.contentCenterY
    background.alpha = 1

    --Scene Location Text
    LocationTextUpper = display.newText( sceneGroup,"Bazaar - Near China Border", 110, 250, "Scene3Assets/Fox", 14 )
    LocationTextUpper.alpha = 0
    LocationTextLower = display.newText( sceneGroup,"02:00 PM", 110, 272, "UI_Elements/Digital-Clock", 16 )
    LocationTextLower.alpha = 0

    --Divider PNG Image
    LocationDivider = display.newImageRect( sceneGroup, "Scene3Assets/divider.png", 150, 8)
    LocationDivider.x =  600
    LocationDivider.y =  259

    --Viviana Poses
    V1 = display.newImageRect( sceneGroup, objectSheet, 1, 140, 300 )
	V1.x = display.contentCenterX + 160
	V1.y = display.contentCenterY + 10
	V1.myName = "V1"
    V1.alpha = 0

    V2 = display.newImageRect( sceneGroup, objectSheet, 2, 170, 300 )
	V2.x = display.contentCenterX + 170
	V2.y = display.contentCenterY + 10
	V2.myName = "V2"
    V2.alpha = 0

    V3 = display.newImageRect( sceneGroup, objectSheet, 3, 175, 350 )
	V3.x = display.contentCenterX + 160
	V3.y = display.contentCenterY - 10
	V3.myName = "V3"
    V3.alpha = 0

    V4 = display.newImageRect( sceneGroup, objectSheet, 4, 155, 290 ) --Side Pose
	V4.x = display.contentCenterX + 160
	V4.y = display.contentCenterY + 14
	V4.myName = "V4"
    V4.alpha = 0
    
    --Goons Poses
    G1 = display.newImageRect( sceneGroup, objectSheet2, 1, 280, 320 )
	G1.x = display.contentCenterX + 160
	G1.y = display.contentCenterY 
	G1.myName = "G1"
    G1.alpha = 0

    G2 = display.newImageRect( sceneGroup, objectSheet2, 2, 280, 320 )
	G2.x = display.contentCenterX + 160
	G2.y = display.contentCenterY 
	G2.myName = "G2"
    G2.alpha = 0

    G3 = display.newImageRect( sceneGroup, objectSheet2, 3, 280, 320 ) -- Angry
	G3.x = display.contentCenterX + 160
	G3.y = display.contentCenterY 
	G3.myName = "G3"
    G3.alpha = 0                        

    G4 = display.newImageRect( sceneGroup, objectSheet2, 4, 280, 320 ) -- scared
	G4.x = display.contentCenterX + 160
	G4.y = display.contentCenterY 
	G4.myName = "G4"
    G4.alpha = 0

    G5 = display.newImageRect( sceneGroup, objectSheet2, 5, 280, 320 )--Sweaty
	G5.x = display.contentCenterX + 160
	G5.y = display.contentCenterY 
	G5.myName = "G5"
    G5.alpha = 0

    G6 = display.newImageRect( sceneGroup, objectSheet2, 6, 280, 320 )
	G6.x = display.contentCenterX + 160
	G6.y = display.contentCenterY 
	G6.myName = "G6"
    G6.alpha = 0

    --Dialog Box PNG 
    dialogBox = display.newImageRect( sceneGroup, "Scene3Assets/textbox.png", 550, 110)
    dialogBox.x = display.contentCenterX 
    dialogBox.y = display.contentCenterY + 100
    dialogBox.alpha = 0

    --Dialogue Strings
    DialogText1 = display.newText(Dialogue.Scene15[start]  , 240, 240, "UI_Elements/OpenSans-Light", 12)
    DialogText1:setFillColor( 0, 0, 0 )
    DialogText1.alpha = 0
    DialogText2 = display.newText(Dialogue.Scene15[mid1]  , 240, 260, "UI_Elements/OpenSans-Light", 12)
    DialogText2:setFillColor( 0, 0, 0 )
    DialogText2.alpha = 0
    DialogText3 = display.newText(Dialogue.Scene15[mid2]  , 240, 280, "UI_Elements/OpenSans-Light", 12)
    DialogText3:setFillColor( 0, 0, 0 )
    DialogText3.alpha = 0
    DialogText4 = display.newText(Dialogue.Scene15[finish]  , 240, 300, "UI_Elements/OpenSans-Light", 12)
    DialogText4:setFillColor( 0, 0, 0 )
    DialogText4.alpha = 0

    --Vivi Name
    VivianaName = display.newText(sceneGroup,"Viviana", 20, 235, "UI_Elements/Ceria-Lebaran", 20)
    VivianaName:setFillColor( 0, 0, 0)
    VivianaName.alpha = 0

    --Goons Name
    GoonsName = display.newText(sceneGroup,"Goons", 30, 235, "UI_Elements/Ceria-Lebaran", 20)
    GoonsName:setFillColor( 0, 0, 0)
    GoonsName.alpha = 0

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

    LocationTextAppear()

    transition.to(button,{time = 1, delay = 9000, alpha = 1})
    transition.to(buttonOuter,{time = 1, delay = 9000, alpha = 1})

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