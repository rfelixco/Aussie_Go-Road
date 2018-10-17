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

local function gotosearch()
	--this function should creat the search bar
	--the search bar interaction should then appear in the show event stage
		--if the input is a target link to load info
	composer.gotoScene( "search" )
end

local function gotoGPS()
	--GPS functionality should be added here
	--the pop up for the GPS coordinates should go in show scene
	composer.gotoScene( "GPS" )
end

local function gotoMenu18()
	composer.gotoScene( "menu18" )
end

local function gotoWarning()
	--Warning functionality should be added here
	--the Warning pop up should check if there is a valid warning
		-- if yes it should should show warnin
		--goes in show scene
					
		-- Handler that gets notified when the alert closes
		--local function onComplete( event )
		--	if ( event.action == "clicked" ) then
		--		local i = event.index
		--		if ( i == 1 ) then
					-- Do nothing; dialog will disply the no warnings message
		--			local noWarning = display.newText("No current warnings in your vicinity", 160, 240, "Arial", 35)
		--			noWarning:setFillColor(0.0, 0.5, 0.9)
		--		elseif ( i == 2 ) then
					-- Open URL if "Learn More" (second button) was clicked
					--get warning
					--
		--		end
		--	end
		--end
		  
		-- Show alert with two buttons
		--local alert = native.showAlert( "Corona", "Dream. Build. Ship.", { "OK", "Learn More" }, onComplete )
		
 --new stuff end
		
	composer.gotoScene( "Warnings" )
end

local function gotoSOS()
	composer.gotoScene( "SOS" )	
end

local function gotoQuit()
	composer.gotoScene( "Quit" )	
end

-----ERRROOORRRR

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

	local title = display.newImageRect( sceneGroup, "title.png" , 125, 50 )
	title.x = display.contentCenterX
	title.y =-20
	
-- -------------------------------------------------------------------------------------
-- Buttons
-- -------------------------------------------------------------------------------------	
	
	local SearchButton = display.newText( sceneGroup, "Search", 50, -20, native.systemFont, 20 )
	SearchButton:setFillColor( 0, 1, 0 )
	
	local GPSButton = display.newImageRect( sceneGroup, "gps.png", 35, 35 )
	GPSButton.x = 270
	GPSButton.y = -20

	local menuButton = display.newText( sceneGroup, "MENU", display.contentCenterX, 500, native.systemFont, 28 )
	menuButton:setFillColor( 0, 1, 0 )
	
	local WarningButton = display.newImageRect( sceneGroup, "warn.png", 45, 45 )
	WarningButton.x = 50
	WarningButton.y = 425
	
	local SOSButton = display.newImageRect( sceneGroup, "SOS.png", 50, 40 )
	SOSButton.x = 50
	SOSButton.y = 500
	
	local QuitButton = display.newImageRect( sceneGroup, "quit.png", 40, 40 )
	QuitButton.x = 270
	QuitButton.y = 500
	
-- -------------------------------------------------------------------------------------

	SearchButton:addEventListener( "tap", Search)
	GPSButton:addEventListener( "tap", GPS)
	menuButton:addEventListener( "tap", menu18)
	WarningButton:addEventListener( "tap", warn)
	SOSButton:addEventListener( "tap", SOS)
	QuitButton:addEventListener( "tap", quit)
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