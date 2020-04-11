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

 --Image initializations for menu
 local GameLogo
 local RedBlip
 local RedCircle
 local Divider
 local Particles

 --Text initializations for menu
 local StartMainGame
 local AIGame
 local BonusContent
 local Options
 local Credits

 --Sound initializations
 local MenuBackgroundSound = audio.loadStream( "MenuAssets/Venus-Main-Theme.mp3" )

function PlayBackgroundSound(event)
    BackGroundMusicChannel = audio.play(MenuBackgroundSound, { channel = 5, loops = -1 } )
    BackGroundMusicChannel = audio.setVolume(0.5 ,{channel = 5})
end

--Manage Layers
function BringToFront()
    GameLogo:toFront()
    RedBlip:toFront()
end

--Main Menu Animation Functions
function RedBlip_Glow(event)
    transition.to( RedBlip,{ time = 1500, alpha = 1, x = RedBlip.x, y = RedBlip.y, onComplete = RedBlip_Glow_Repeat } )
end

function RedBlip_Glow_Repeat(event)
    transition.to( RedBlip,{ time = 1500, alpha = 0, x = RedBlip.x, y = RedBlip.y, onComplete = RedBlip_Glow } )
end

function RedCircle_Glow(event)
    transition.to( RedCircle,{ time = 1500, alpha = 1, x = RedCircle.x, y = RedCircle.y, onComplete = RedCircle_Glow_Repeat } )
end

function RedCircle_Glow_Repeat(event)
    transition.to( RedCircle,{ time = 1500, alpha = 0, x = RedCircle.x, y = RedCircle.y, onComplete = RedCircle_Glow } )
end

function Particle_Movement(event)
    transition.to( Particles,{ time = 90000, y = 950 })
end

--Main Menu Appears Function
function MenuAppears(event)
    transition.to( StartMainGame,{alpha = 1})
    transition.to( AIGame,{alpha = 1})
    transition.to( BonusContent,{alpha = 1})
    transition.to( Options,{alpha = 1})
    transition.to( Credits,{alpha = 1})
end

local function startGame()
    composer.gotoScene("Scene1", {effect="fade", time = 0})
    audio.fadeOut({channel = 5, time = 2000})
end
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    --All Main Menu Images Here

    GameLogo = display.newImageRect("MenuAssets/Venus-Logo.png", 595, 330)
    GameLogo.x = display.contentCenterX 
    GameLogo.y = display.contentCenterY
    sceneGroup:insert(GameLogo)

    Divider = display.newImage("MenuAssets/Divider.png")
    Divider.x = 400
    Divider.y = 200
    Divider:scale( 0.5 , 0.5 )
    Divider.rotation = - 90
    Divider.alpha = 1
    sceneGroup:insert(Divider)

    RedBlip =   display.newImageRect("MenuAssets/RedBlip.png", 60, 60)
    RedBlip.x = display.contentCenterX + 1
    RedBlip.y = display.contentCenterY - 11.5
    RedBlip.alpha = 0
    sceneGroup:insert(RedBlip)

    RedCircle =   display.newImageRect("MenuAssets/RedCircle.png", 25, 25)
    RedCircle.x = display.contentCenterX + 1
    RedCircle.y = display.contentCenterY - 11.5
    RedCircle.alpha = 0
    sceneGroup:insert(RedCircle)

    Particles = display.newImage("MenuAssets/Particles1.png")
    Particles.x = display.contentCenterX + 250
    Particles.y = - 600
    Particles:scale( 1 , 4 )
    Particles.alpha = 0.3
    sceneGroup:insert(Particles)

    --All Main Menu texts here

    StartMainGame = display.newText(sceneGroup ,"Start", 421, 180, "MenuAssets/CeriaLebaran.otf", 18)
    StartMainGame.alpha = 0

    AIGame = display.newText(sceneGroup,"Play AI Game", 447, 210, "MenuAssets/CeriaLebaran.otf", 18)
    AIGame.alpha = 0

    BonusContent = display.newText(sceneGroup,"Bonus Content", 448, 240, "MenuAssets/CeriaLebaran.otf", 18)
    BonusContent.alpha = 0

    Options = display.newText(sceneGroup,"Options", 428, 270, "MenuAssets/CeriaLebaran.otf", 18)
    Options.alpha = 0

    Credits = display.newText(sceneGroup,"Credits", 428, 300, "MenuAssets/CeriaLebaran.otf", 18)
    Credits.alpha = 0

    --Call to bring relevant things to front
    BringToFront()

    --Function calls for Main Menu animation
    RedBlip_Glow()
    timer.performWithDelay( 1600, RedCircle_Glow )

    --Function call for playing background music
    timer.performWithDelay( 1000, PlayBackgroundSound )

    --Function call for particles effects in Main Menu
    timer.performWithDelay( 1000, Particle_Movement )

    --Function Call to Display main Menu items
    timer.performWithDelay( 1000, MenuAppears )

    StartMainGame:addEventListener("tap", startGame)
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