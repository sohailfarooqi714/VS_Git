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
 
local TapClickSound = audio.loadStream( "Scene3Assets/click1.wav" )
local SceneChangeAudio = audio.loadStream( "Scene3Assets/Swoosh.wav" )

local dataTable = {}
 
local filePath = system.pathForFile( "dialog1.json", system.ResourceDirectory ) 	--Specify path of interaction

local contents

 local DialogText1, Kamali_Name, Sarah_Name

 local tapCount = 0

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

local function changeScenes()
    composer.gotoScene("Scene3B", {effect="slideLeft", time = 800})
    audio.play(SceneChangeAudio)
end

function ClickSound(event)
    audio.play(TapClickSound)
end

 function dialogFunction(event)
    tapCount = tapCount + 1
    print(tapCount)
    --Previous Dialogue Disappears
	transition.to(DialogText,{alpha = 0, time = 600, delay = 600})

    DialogText = display.newText(Dialogue.Scene3_CG[tapCount]  , 240, 300, "UI_Elements/OpenSans-Light", 12)
    DialogText:setFillColor( 0, 0, 0 )
    DialogText.alpha = 0

    --New Dialogue Appears
    transition.to(DialogText,{ time = 800, delay = 1500, alpha = 1})

    if(tapCount == 1) then
        transition.to( dialogBox,{time = 800, delay = 1500, alpha = 1})
        transition.to( Kamali_Name,{time = 800, delay = 1500, alpha = 1})
    elseif(tapCount == 3) then
        transition.to( dialogBox,{time = 600, delay = 600, alpha = 0})
        transition.to( Kamali_Name,{time = 600, delay = 600, alpha = 0})
        --transition.to( DialogText,{delay = 1200 ,alpha = 0})
        transition.to( DialogText,{y = 110, x = 16, time= 1})
        transition.to( dialogBox,{ y = 110, x = 16, time= 1, delay = 1500 } )
        transition.scaleTo( dialogBox,{ xScale=0.26, yScale=2.8,time=1, delay = 1500 } )

        transition.to( dialogBox,{ time = 500, delay = 1650, alpha = 1})
        transition.to( Sarah_Name,{ time = 500, delay = 1650, alpha = 1})
        --transition.to( DialogText,{ time = 800, delay = 3000, alpha = 1})
    elseif(tapCount == 4) then
        transition.to( DialogText,{y = 110, x = 16, time= 1})
    elseif(tapCount == 5) then
        transition.to( DialogText,{y = 110, x = 16, time= 1})
    elseif(tapCount == 6) then
        transition.to( DialogText,{y = 110, x = 16, time= 1})
    elseif(tapCount == 7) then
        transition.to( Sarah_Name,{time = 600, delay = 600, alpha = 0})
        transition.to( dialogBox,{time = 600, delay = 600, alpha = 0})
        transition.to( dialogBox,{ y = 295, x = 240, time= 1, delay = 1500 } )
        transition.scaleTo( dialogBox,{ xScale=1, yScale=1,time=1, delay = 1500 } )
        transition.to( Kamali_Name,{ time = 500, delay = 1650, alpha = 1})
        transition.to( dialogBox,{ time = 500, delay = 1650, alpha = 1})
    elseif(tapCount == 9) then
        transition.to( Kamali_Name,{time = 800, delay = 1000, alpha = 0})
        transition.to( dialogBox,{time = 800, delay = 1000, alpha = 0})
        transition.to( nextButton,{time = 1000, delay = 1000, alpha = 1})
        display.remove(button)
        display.remove(buttonOuter)
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
    backgroundCG = display.newImageRect( sceneGroup, "Scene3Assets/cg.png", 595, 330)
    backgroundCG.x = display.contentCenterX 
    backgroundCG.y = display.contentCenterY
    backgroundCG.alpha = 1

    --Dialog Box For Kamali PNG 
    dialogBox = display.newImageRect( sceneGroup, "Scene3Assets/textbox.png", 450, 60)
    dialogBox.x = display.contentCenterX 
    dialogBox.y = display.contentCenterY + 130
    dialogBox.alpha = 0

     --Dialog Box For Sarah PNG 
    dialogBoxSarah = display.newImageRect( sceneGroup, "Scene3Assets/textbox.png", 120, 150)
    dialogBoxSarah.x = display.contentCenterX - 222
    dialogBoxSarah.y = display.contentCenterY - 50
    dialogBoxSarah.alpha = 0

    --Sarah Name
    Sarah_Name = display.newText(sceneGroup,"Sarah", 17, 70, "UI_Elements/Ceria-Lebaran", 20)
    Sarah_Name:setFillColor( 0, 0, 0)
    Sarah_Name.alpha = 0
 
    --Kamali Name
    Kamali_Name = display.newText(sceneGroup,"Kamali", 248, 276, "UI_Elements/Ceria-Lebaran", 20)
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

    --Button Appears first time in scene
    transition.to( button,{time = 1 , delay = 2500 ,alpha = 1})
    transition.to(buttonOuter,{time = 1, delay = 2500, alpha = 1})

    --Call to function
    button:addEventListener( "tap", dialogFunction )
    button:addEventListener( "tap", outerRotate )
    button:addEventListener( "tap", buttonReappear)
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