function scene:show( event )
local sceneGroup = self.view
local phase = event.phase

if phase == "will" then
-- Called when the scene is still off screen and is about to move on screen
elseif phase == "did" then
-- Called when the scene is now on screen
-- 
-- INSERT code here to make the scene come alive
-- e.g. start timers, begin animation, play audio, etc.
end	
end

function scene:hide( event )
local sceneGroup = self.view
local phase = event.phase

if event.phase == "will" then
-- Called when the scene is on screen and is about to move off screen
--
-- INSERT code here to pause the scene
-- e.g. stop timers, stop animation, unload sounds, etc.)
elseif phase == "did" then
-- Called when the scene is now off screen
end	
end

function scene:destroy( event )
local sceneGroup = self.view

-- Called prior to the removal of scene's "view" (sceneGroup)
-- 
-- INSERT code here to cleanup the scene
-- e.g. remove display objects, remove touch listeners, save state, etc.

if playBtn then
playBtn:removeSelf()	-- widgets must be manually removed
playBtn = nil
end
end

