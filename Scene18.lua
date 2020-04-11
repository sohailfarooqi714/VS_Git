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
      DialogText1 = display.newText(Dialogue.Scene16[start]  , 240, 240, "UI_Elements/OpenSans-Light", 12)
      DialogText1:setFillColor( 0, 0, 0 )
      DialogText1.alpha = 0
      DialogText2 = display.newText(Dialogue.Scene16[mid1]  , 240, 260, "UI_Elements/OpenSans-Light", 12)
      DialogText2:setFillColor( 0, 0, 0 )
      DialogText2.alpha = 0
      DialogText3 = display.newText(Dialogue.Scene16[mid2]  , 240, 280, "UI_Elements/OpenSans-Light", 12)
      DialogText3:setFillColor( 0, 0, 0 )
      DialogText3.alpha = 0
      DialogText4 = display.newText(Dialogue.Scene16[finish]  , 240, 300, "UI_Elements/OpenSans-Light", 12)
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
     background = display.newImageRect( sceneGroup, "Scene16Assets/bg_16.png", 565, 350)
     background.x = display.contentCenterX 
     background.y = display.contentCenterY
     background.alpha = 1
 
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
     DialogText1 = display.newText(Dialogue.Scene16[start]  , 240, 240, "UI_Elements/OpenSans-Light", 12)
     DialogText1:setFillColor( 0, 0, 0 )
     DialogText1.alpha = 0
     DialogText2 = display.newText(Dialogue.Scene16[mid1]  , 240, 260, "UI_Elements/OpenSans-Light", 12)
     DialogText2:setFillColor( 0, 0, 0 )
     DialogText2.alpha = 0
     DialogText3 = display.newText(Dialogue.Scene16[mid2]  , 240, 280, "UI_Elements/OpenSans-Light", 12)
     DialogText3:setFillColor( 0, 0, 0 )
     DialogText3.alpha = 0
     DialogText4 = display.newText(Dialogue.Scene16[finish]  , 240, 300, "UI_Elements/OpenSans-Light", 12)
     DialogText4:setFillColor( 0, 0, 0 )
     DialogText4.alpha = 0

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