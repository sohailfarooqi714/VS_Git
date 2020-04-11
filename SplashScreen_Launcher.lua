-----------------------------------------------------------------------------------------
--
-- main.lua
--
----------------------------------------------------------------------------------------

-- Your code here

local composer = require( "composer" )
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 local Background
 local MetalSeinen

 local BackgroundMusic0 = audio.loadStream( "Scene0Assets/0audio.mp3" )  

 function PlayBackgroundSound(event)
    audio.play(BackgroundMusic0)
 end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    Background = display.newImageRect("Scene0Assets/LauncherTexture.jpg", 595, 330)
    Background.x = display.contentCenterX 
    Background.y = display.contentCenterY
    Background.alpha = 1
    sceneGroup:insert(Background)

    MetalSeinen = display.newImage("Scene0Assets/MetalSeinenLogo.png")
    MetalSeinen.x = display.contentCenterX - 10
    MetalSeinen.y = display.contentCenterY
    MetalSeinen.alpha = 1
    MetalSeinen:scale( 0.20, 0.20)
    sceneGroup:insert(MetalSeinen)

    --Call background audio function
    timer.performWithDelay( 2000, PlayBackgroundSound)
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
        composer.gotoScene("SplashScreen_Disclaimer", {effect = "fade", time = 4000})
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
    composer.removeScene("SplashScreen_Launcher", false);
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