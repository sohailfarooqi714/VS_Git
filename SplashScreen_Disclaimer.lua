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
 local Disclaimer

 --Move to Main Menu Function
 --[[local function MainMenu(event)
    composer.gotoScene("Game-Menu", {effect = "fade", time = 4000})
 end]]
 
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

    Disclaimer = display.newImage("Scene0Assets/Disclaimer.png")
    Disclaimer.x = display.contentCenterX 
    Disclaimer.y = display.contentCenterY
    Disclaimer:scale( 0.5, 0.5)
    Disclaimer.alpha = 1
    sceneGroup:insert(Disclaimer)
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
        composer.gotoScene("Scene2", {effect = "fade", time = 2000})
        --Fade out previous audio channel
        audio.fadeOut({channel = 2, time = 2000})
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
    composer.removeScene("SplashScreen_Disclaimer", false);
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