-----------------------------------------------------------------------------------------
--
-- Interesting Facts_scene.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local function gotoIntro()
    composer.gotoScene( "scenes.intro" )
end

-- -------------------------------------------------------------------------------------
-- Scene event functions
-- -------------------------------------------------------------------------------------

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

        -- Your code here
    local widget = require( "widget" )

    -- ScrollView listener
    local function scrollListener( event )
        local phase = event.phase
        local direction = event.direction

        -- In the event a scroll limit is reached...
    if event.limitReached then
          if "up" == direction then
          print ( "Reached top limit")
          elseif "down" == direction then
          print ( "Reached bottom limit")
          end
    end

        return true
    end

    -- Create the widget
    local scrollView = widget.newScrollView(
        {
            left = 0,
            top = 50,
            width = display.contentWidth,
            height = 380,
            topPadding = 280,
            bottomPadding = -280,
            horizontalScrollDisable = true,
            verticalScrollDisable = false,
            listener = scrollListener,
            backgroundColor = { 0, 0, 0}
        }
    )

    -- Create large text string
    -- Create a image and insert it into the scroll view
    local background = display.newImageRect( "/assets/facts.png", display.actualContentWidth, display.actualContentHeight )
    background.x = display.contentCenterX
    scrollView:insert (background)

    local title = display.newImageRect( sceneGroup, "/assets/title.png" , 150, 60 )
    title.x = display.contentCenterX
    title.y = 10

    local backButton = display.newImageRect( sceneGroup, "/assets/back.png", 150, 60 )
    backButton.x = display.contentCenterX
    backButton.y = 468

    backButton:addEventListener( "tap", gotoIntro)

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
