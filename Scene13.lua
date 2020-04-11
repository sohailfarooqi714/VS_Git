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
local sheetOptionsKS =
{
    
    frames = 
    {
    
        {
            -- 1
            x=429,
            y=803,
            width=411,
            height=800,

        },
        {
            -- 2
            x=842,
            y=803,
            width=399,
            height=800,

        },
        {
            -- 3
            x=876,
            y=1,
            width=328,
            height=800,

        },
        {
            -- 4
            x=448,
            y=1,
            width=426,
            height=800,

        },
        {
            -- 5
            x=1,
            y=803,
            width=426,
            height=800,

        },
        {
            -- 6
            x=1,
            y=1,
            width=445,
            height=800,

        },
    },

    sheetContentWidth = 1242,
    sheetContentHeight = 1604
}

-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

local objectSheet = graphics.newImageSheet( "Scene13Assets/KamaliSaadatSpriteSheet.png", sheetOptionsKS )
 
local dataTable = {}
 
local filePath = system.pathForFile( "dialog1.json", system.ResourceDirectory ) 	--Specify path of interaction

local contents

local tapCount = 0
 
local start = 1
local mid1 = 2
local mid2 = 3
local finish = 4

local nstart = 1
local nmid1 = 2
local nmid2 = 3
local nfinish = 4 

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

function Dance(event)
    transition.to( Dancers,{ time = 150, y = 185, onComplete=Dance_repeat } )
end

function Dance_repeat(event)
    transition.to( Dancers,{ time = 150 , y = 180, onComplete=Dance } )
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
      DialogText1 = display.newText(Dialogue.Scene13[start]  , 240, 240, "UI_Elements/OpenSans-Light", 12)
      DialogText1:setFillColor( 0, 0, 0 )
      DialogText1.alpha = 0
      DialogText2 = display.newText(Dialogue.Scene13[mid1]  , 240, 260, "UI_Elements/OpenSans-Light", 12)
      DialogText2:setFillColor( 0, 0, 0 )
      DialogText2.alpha = 0
      DialogText3 = display.newText(Dialogue.Scene13[mid2]  , 240, 280, "UI_Elements/OpenSans-Light", 12)
      DialogText3:setFillColor( 0, 0, 0 )
      DialogText3.alpha = 0
      DialogText4 = display.newText(Dialogue.Scene13[finish]  , 240, 300, "UI_Elements/OpenSans-Light", 12)
      DialogText4:setFillColor( 0, 0, 0 )
      DialogText4.alpha = 0
    --New Dialogues Appear
    transition.to(DialogText1,{alpha = 1, time = 400, delay = 1000})
    transition.to(DialogText2,{alpha = 1, time = 400, delay = 1500})
    transition.to(DialogText3,{alpha = 1, time = 400, delay = 2000})
    transition.to(DialogText4,{alpha = 1, time = 400, delay = 2500})
end

function narationFunction(event)
    --Increment values
    nstart = nstart + 4
    nmid1 = nmid1 + 4
    nmid2 = nmid2 + 4
    nfinish = nfinish + 4
	--Previous Narations Text Disappear
    transition.to(narationText1,{alpha = 0, time = 800, delay = 10})
    transition.to(narationText2,{alpha = 0, time = 800, delay = 10})
    transition.to(narationText3,{alpha = 0, time = 800, delay = 10})
    transition.to(narationText4,{alpha = 0, time = 800, delay = 10})
        narationText1 = display.newText(Dialogue.Scene13_Narations[nstart]  , 240, 40, "UI_Elements/bargain", 12)
        narationText1:setFillColor( 1, 1, 1 )
        narationText1.alpha = 0
        narationText2 = display.newText(Dialogue.Scene13_Narations[nmid1]  , 240, 60, "UI_Elements/bargain", 12)
        narationText2:setFillColor( 1, 1, 1 )
        narationText2.alpha = 0
        narationText3 = display.newText(Dialogue.Scene13_Narations[nmid2]  , 240, 80, "UI_Elements/bargain", 12)
        narationText3:setFillColor( 1, 1, 1 )
        narationText3.alpha = 0
        narationText4 = display.newText(Dialogue.Scene13_Narations[nfinish]  , 240, 100, "UI_Elements/bargain", 12)
        narationText4:setFillColor( 1, 1, 1 )
        narationText4.alpha = 0
    --New Narations Appear
    transition.to(narationText1,{alpha = 1, time = 800, delay = 1000})
    transition.to(narationText2,{alpha = 1, time = 800, delay = 2000})
    transition.to(narationText3,{alpha = 1, time = 800, delay = 3000})
    transition.to(narationText4,{alpha = 1, time = 800, delay = 4000})
end
 
function CharControl()
    tapCount = tapCount + 1
    print(tapCount)
    if(tapCount == 1)then
        transition.to(KamaliName,{time = 400, delay = 400, alpha = 0})
        transition.to(SaadatName,{time = 400, delay = 1000, alpha = 1})
        transition.to(K1 ,{time = 1000, delay = 400, alpha = 0.7})
        transition.to(S1 ,{time = 2500, delay = 400, alpha = 1})
    elseif(tapCount == 2)then
        transition.to(blackdialogBox,{ time = 800, delay = 10,alpha = 0,})
        transition.to(SaadatName,{time = 400, delay = 400, alpha = 0})
        transition.to(KamaliName,{time = 400, delay = 1000, alpha = 1})
        transition.to(K1 ,{time = 2500, delay = 400, alpha = 0})
        transition.to(K2 ,{time = 2000, delay = 400, alpha = 1})
    elseif(tapCount == 3)then
        transition.to(KamaliName,{time = 400, delay = 400, alpha = 0})
        transition.to(SaadatName,{time = 400, delay = 1000, alpha = 1})
        transition.to(K2 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 5)then
        transition.to(SaadatName,{time = 400, delay = 400, alpha = 0})
        transition.to(KamaliName,{time = 400, delay = 1000, alpha = 1})
        transition.to(K2 ,{time = 1000, delay = 400, alpha = 1})
        transition.to(S1 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 6)then
        transition.to(KamaliName,{time = 400, delay = 400, alpha = 0})
        transition.to(SaadatName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S1 ,{time = 1000, delay = 400, alpha = 1})
        transition.to(K2 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 9)then
        transition.to(SaadatName,{time = 400, delay = 400, alpha = 0})
        transition.to(KamaliName,{time = 400, delay = 1000, alpha = 1})
        transition.to(K2 ,{time = 1000, delay = 400, alpha = 1})
        transition.to(S1 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 10)then
        transition.to(KamaliName,{time = 400, delay = 400, alpha = 0})
        transition.to(SaadatName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S1 ,{time = 2500, delay = 400, alpha = 0})
        transition.to(S2 ,{time = 2000, delay = 400, alpha = 1})
        transition.to(K2 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 12)then
        transition.to(SaadatName,{time = 400, delay = 400, alpha = 0})
        transition.to(KamaliName,{time = 400, delay = 1000, alpha = 1})
        transition.to(K2 ,{time = 1000, delay = 400, alpha = 1})
        transition.to(S2 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 13)then
        transition.to(KamaliName,{time = 400, delay = 400, alpha = 0})
        transition.to(SaadatName,{time = 400, delay = 1000, alpha = 1})
        transition.to(S2 ,{time = 2500, delay = 400, alpha = 0})
        transition.to(S1 ,{time = 2000, delay = 400, alpha = 1})
        transition.to(K2 ,{time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 14)then
        transition.to(S1 ,{time = 2500, delay = 400, alpha = 0})
        transition.to(S3 ,{time = 2000, delay = 400, alpha = 1})
    elseif(tapCount == 15)then
        transition.to(dialogBox,{time = 400, delay = 400, alpha = 0})
        transition.to(SaadatName,{time = 400, delay = 400, alpha = 0})
        transition.to(blackdialogBox,{ time = 2000, delay = 10,alpha = 1})
        transition.to(S3 ,{time = 2500, delay = 400, alpha = 0})
        transition.to(K2 ,{time = 2500, delay = 400, alpha = 0})
        transition.to(Dancers , {time = 2500, delay = 3000, alpha = 1})
        Dance()
    elseif(tapCount == 16)then
        transition.to(blackdialogBox,{ time = 2000, delay = 10,alpha = 0})
        transition.to(SaadatName,{time = 400, delay = 1000, alpha = 1})
        transition.to(dialogBox,{time = 1000, delay = 400, alpha = 0.85})
        transition.to( S1, {x = 130, time = 100})
        transition.to( S2, {x = 130, time = 100})
        transition.to( S1, {time = 2500, delay = 400, alpha = 1})
    elseif(tapCount == 17)then
        transition.to(SaadatName,{time = 400, delay = 400, alpha = 0})
        transition.to(KamaliName,{time = 400, delay = 1000, alpha = 1})
        transition.to( K3, {time = 2500, delay = 400, alpha = 1})
        transition.to( S1, {time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 18)then
        transition.to(KamaliName,{time = 400, delay = 400, alpha = 0})
        transition.to(SaadatName,{time = 400, delay = 1000, alpha = 1})
        transition.to( S1, {time = 1000, delay = 400, alpha = 1})
        transition.to( K3, {time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 19)then
        transition.to(SaadatName,{time = 400, delay = 400, alpha = 0})
        transition.to(KamaliName,{time = 400, delay = 1000, alpha = 1})
        transition.to( K3, {time = 1000, delay = 400, alpha = 1})
        transition.to( S1, {time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 20)then
        transition.to(KamaliName,{time = 400, delay = 400, alpha = 0})
        transition.to(SaadatName,{time = 400, delay = 1000, alpha = 1})
        transition.to( S1, {time = 1000, delay = 400, alpha = 1})
        transition.to( K3, {time = 1000, delay = 400, alpha = 0.7})
    elseif(tapCount == 21)then
        transition.to(dialogBox,{time = 400, delay = 400, alpha = 0})
        transition.to(blackdialogBox,{ time = 2000, delay = 10,alpha = 1})
        transition.to(SaadatName,{time = 400, delay = 400, alpha = 0})
        transition.to( S1, {time = 2000, delay = 400, alpha = 0})
        transition.to( K3, {time = 2000, delay = 400, alpha = 0})
        transition.to( Dancers,{x = 240, time = 1500, delay = 2000} )
        transition.scaleTo( Dancers ,{xScale = 1.2, yScale = 1.2, time = 1500, delay = 2000})
    end
end

function bringToFront()
    dialogBox:toFront()
    button:toFront()
    buttonOuter:toFront()
    KamaliName:toFront()
    SaadatName:toFront()
    DialogText2:toFront()
    DialogText3:toFront()
end
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    --Scene Background
    background = display.newImageRect( sceneGroup, "Scene13Assets/bg13.png", 565, 350)
    background.x = display.contentCenterX 
    background.y = display.contentCenterY
    background.alpha = 1

    --Dialog Box PNG 
    dialogBox = display.newImageRect( sceneGroup, "Scene3Assets/textbox.png", 550, 110)
    dialogBox.x = display.contentCenterX 
    dialogBox.y = display.contentCenterY + 100
    dialogBox.alpha = 0

    --Black Dialog Box Box PNG 
    blackdialogBox = display.newImageRect( sceneGroup, "UI_Elements/blacktextbox.png", 420, 110)
    blackdialogBox.x = display.contentCenterX 
    blackdialogBox.y = display.contentCenterY - 100
    blackdialogBox.alpha = 0

     --Scene Location Text
     LocationTextUpper = display.newText( sceneGroup,"Urs Lal Shahbaz Qalandar Shrine", 112, 250, "Scene3Assets/Fox", 14 )
     LocationTextUpper.alpha = 0
     LocationTextLower = display.newText( sceneGroup,"Many Years Ago", 112, 272, "UI_Elements/Digital-Clock", 16 )
     LocationTextLower.alpha = 0
 
     --Divider PNG Image
     LocationDivider = display.newImageRect( sceneGroup, "Scene3Assets/divider.png", 150, 8)
     LocationDivider.x =  600
     LocationDivider.y =  259

    --Kamali Poses
    K1 = display.newImageRect( sceneGroup, objectSheet, 1, 130, 220 )
	K1.x = display.contentCenterX - 250
	K1.y = display.contentCenterY + 60
	K1.myName = "K1"
	K1.alpha = 0

	K2 = display.newImageRect( sceneGroup, objectSheet, 2, 125, 230 )
	K2.x = display.contentCenterX - 20
	K2.y = display.contentCenterY + 60
	K2.myName = "K2"
    K2.alpha = 0
    
    K3 = display.newImageRect( sceneGroup, objectSheet, 3, 105, 230 )
	K3.x = display.contentCenterX - 210
	K3.y = display.contentCenterY + 60
	K3.myName = "K3"
    K3.alpha = 0

    --Saadat Poses
    S1 = display.newImageRect( sceneGroup, objectSheet, 4, 170, 300 )
	S1.x = display.contentCenterX + 200
	S1.y = display.contentCenterY + 10
	S1.myName = "S1"
    S1.alpha = 0

    --Saadat Poses
    S2 = display.newImageRect( sceneGroup, objectSheet, 5, 170, 300 )
	S2.x = display.contentCenterX + 200
	S2.y = display.contentCenterY + 10
	S2.myName = "S2"
    S2.alpha = 0

    --Saadat Poses
    S3 = display.newImageRect( sceneGroup, objectSheet, 6, 170, 300 )
	S3.x = display.contentCenterX + 200
	S3.y = display.contentCenterY + 10
	S3.myName = "S3"
	S3.alpha = 0
    

    --Dancers
    Dancers = display.newImageRect( sceneGroup, "Scene13Assets/dancers.png", 280, 280)
    Dancers.x = display.contentCenterX + 120
    Dancers.y = display.contentCenterY 
    Dancers.alpha = 0

    --Naration Strings
    narationText1 = display.newText(Dialogue.Scene13_Narations[nstart]  , 240, 40, "UI_Elements/bargain", 12)
    narationText1:setFillColor( 1, 1, 1 )
    narationText1.alpha = 0
    narationText2 = display.newText(Dialogue.Scene13_Narations[nmid1]  , 240, 60, "UI_Elements/bargain", 12)
    narationText2:setFillColor( 1, 1, 1 )
    narationText2.alpha = 0
    narationText3 = display.newText(Dialogue.Scene13_Narations[nmid2]  , 240, 80, "UI_Elements/bargain", 12)
    narationText3:setFillColor( 1, 1, 1 )
    narationText3.alpha = 0
    narationText4 = display.newText(Dialogue.Scene13_Narations[nfinish]  , 240, 100, "UI_Elements/bargain", 12)
    narationText4:setFillColor( 1, 1, 1 )
    narationText4.alpha = 0

    --Dialogue Strings
    DialogText1 = display.newText(sceneGroup,Dialogue.Scene13[start]  , 240, 240, "UI_Elements/OpenSans-Light", 12)
    DialogText1:setFillColor( 0, 0, 0 )
    DialogText1.alpha = 0
    DialogText2 = display.newText(sceneGroup,Dialogue.Scene13[mid1]  , 240, 260, "UI_Elements/OpenSans-Light", 12)
    DialogText2:setFillColor( 0, 0, 0 )
    DialogText2.alpha = 0
    DialogText3 = display.newText(sceneGroup,Dialogue.Scene13[mid2]  , 240, 280, "UI_Elements/OpenSans-Light", 12)
    DialogText3:setFillColor( 0, 0, 0 )
    DialogText3.alpha = 0
    DialogText4 = display.newText(sceneGroup , Dialogue.Scene13[finish]  , 240, 300, "UI_Elements/OpenSans-Light", 12)
    DialogText4:setFillColor( 0, 0, 0 )
    DialogText4.alpha = 0

     --Kamali Name
     KamaliName = display.newText(sceneGroup,"Kamali", 15, 238, "UI_Elements/Ceria-Lebaran", 20)
     KamaliName.alpha = 0
     KamaliName:setFillColor( 0, 0, 0)
     --Sarah Name
     SaadatName = display.newText(sceneGroup,"Saadat", 15, 238, "UI_Elements/Ceria-Lebaran", 20)
     SaadatName.alpha = 0
     SaadatName:setFillColor( 0, 0, 0) 

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

    bringToFront()

    --Black Dialog box and narration text Appears
    transition.to(blackdialogBox,{time = 800, delay = 16000, alpha = 0.70})
    transition.to(narationText1,{alpha = 1, time = 800, delay = 16000})
    transition.to(narationText2,{alpha = 1, time = 800, delay = 17000})

    transition.to( K1,{ alpha = 1, time = 1500, delay = 13000 } )
    transition.to( K1,{  x = 100, time = 1500, delay = 13000 } )

    --Normal Dialog Box with Normal Dialogue Appears
    transition.to(KamaliName,{time = 400, delay = 13000, alpha = 1})
    transition.to(dialogBox,{time = 400, delay = 13000, alpha = 0.85})
    transition.to(DialogText2,{time = 400, delay = 13000 ,alpha = 1})

    transition.to(button ,{time = 200, delay = 15000, alpha = 1})
    transition.to(buttonOuter ,{time = 200, delay = 15000, alpha = 1})

    button:addEventListener("tap" , CharControl)
    button:addEventListener("tap" , dialogFunction)
    button:addEventListener("tap" , narationFunction)
    button:addEventListener("tap" , buttonReappear)
    button:addEventListener("tap" , outerRotate)
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