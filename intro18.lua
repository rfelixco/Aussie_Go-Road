-----------------------------------------------------------------------------------------
--
-- intro_scene.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
local function gotoMenu()
	composer.gotoScene( "menu" )
end

-- -------------------------------------------------------------------------------------
-- Scene event functions
-- -------------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	local background = display.newImageRect( sceneGroup, "australia.jpg", 320, 580 )
	background.x = display.contentCenterX
	background.y = display.contentCenterY

	local title = display.newImageRect( sceneGroup, "title.png" , 125, 70 )
	title.x = display.contentCenterX
	title.y =-20
	
-- -------------------------------------------------------------------------------------
-- Buttons
-- -------------------------------------------------------------------------------------	
	local menuButton = display.newText( sceneGroup, "MENU", display.contentCenterX, 500, native.systemFont, 28 )
	menuButton:setFillColor( 0, 1, 0 )
	
--	local GPSButton = display.newText( sceneGroup, "MENU", display.contentCenterX, 10, native.systemFont, 28 )
--	menuButton:setFillColor( 0, 1, 0 )
	
--	local GPSButton = display.newImageRect( sceneGroup, "gps.png", 100, 20 )
--	GPSButton.x = display.contentRightX
--	GPSButton.y = display.contentCenterY
	
--	local SOSButton = display.newText( sceneGroup, "SOS", display.contentCenterX, 500, native.systemFont, 28 )
--	menuButton:setFillColor( 0, 1, 0 )
	
--	local ExitButton = display.newText( sceneGroup, "Exit", display.contentCenterX, 530, native.systemFont, 28 )
--	menuButton:setFillColor( 0, 1, 0 )
	
-- -------------------------------------------------------------------------------------

	menuButton:addEventListener( "tap", menu)

end

-- -------------------------------------------------------------------------------------
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