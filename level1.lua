-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------
local fruits = require("fruits")

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "physics" library
local physics = require "physics"
--物理エンジンをスタートさせる
physics.start(); 
-- 重力を設定
physics.setGravity(0,9)
--物理エンジンを一時停止させる
physics.stop()
--物理エンジンの表示モード
--physics.setDrawMode("normal")
physics.setDrawMode("hybrid")
--physics.setDrawMode("debug")
--------------------------------------------

-- forward declarations and other locals
local screenW, screenH, halfW = display.contentWidth, display.contentHeight, display.contentWidth*0.5

--背景と芝生を追加する関数
function scene:create( event )

-- Called when the scene's view does not exist.
-- 
-- INSERT code here to initialize the scene
-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

local sceneGroup = self.view
 
 
 function settimer()
--　タイマーのアイコン
  timerIcon = display.newImageRect( "images/clock.png", 50 , 50)
  timerIcon.anchorX= 0
  timerIcon.anchorY= 0
  timerIcon.x, timerIcon.y = 10, 0
  
  -- カウントダウンタイマーの変数
  CountDownTimer = 30
  time_limit = CountDownTimer
  timerLabel = display.newText(CountDownTimer, 0, 0)
  timerLabel.anchorX = 0
  timerLabel.anchorY = 0
  timerLabel.size= 30
  timerLabel.x, timerLabel.y = 70, 8
  timerLabel:setTextColor(255, 255, 255)
   
   
  
end

 settimer()

 
 --背景と芝生設置処理
function setbackground()
-- create a grey rectangle as the backdrop
  background = display.newImageRect( "images/background1.png" ,screenW, 398)
background.anchorX = 0
background.anchorY = 0
  background.x = 0
background.y = 0
--background:setFillColor( .5 )
background2 = display.newImageRect( "images/background4.png" ,200, 100)
background2.anchorX = 0
background2.anchorY = 1
background2.x,background2.y = 60, display.contentHeight


-- create a grass object and add physics (with custom shape)
grass = display.newImageRect( "images/background2.png", screenW, 82 )
grass.anchorX = 0
grass.anchorY = 1
grass.x,grass.y = 0, display.contentHeight

-- define a shape that's slightly shorter than image bounds (set draw mode to "hybrid" or "debug" to see)

--　-32 を芝部の高さ/2にする
local grassShape = { -halfW,-grass.contentHeight/2, halfW,-grass.contentHeight/2, halfW,grass.contentHeight/2, -halfW,grass.contentHeight/2}
--physics.addBody( grass, "static", { friction=0.3, shape=grassShape } )

end
setbackground()
--左右の透明な壁 跳ね返り止め
function setwall()
  w1 = display.newRect(0, display.contentHeight / 2, 5, display.contentHeight)
  w1:setFillColor(255, 0, 0)
  w2 = display.newRect(display.contentWidth, display.contentHeight / 2, 5, display.contentHeight)
  w2:setFillColor(255, 0, 0)
  --physics.addBody(w1,"static")
  --physics.addBody(w2,"static")
  return setwall
  end
local wall = setwall()

--score表示の初期設定
fruits.setScore()


--ボール（円）を追加 半径10
--local ball = display.newCircle(halfW,0,10)

--ball:setFillColor(math.random(255),math.random(255),math.random(255))
----円の剛体（半径 10）をボールにくっつける bounce:弾性
--physics.addBody(ball,{bounce = 0.75, radius = 10})
--ball:applyTorque(360)
--四角の追加
--local square = display.newRect(display.contentWidth/2 , display.contentHeight-grass.contentHeight , 25,50)
-- square.anchorX = 0.5
-- square.anchorY = 1
--square:setFillColor(math.random(255),math.random(255),math.random(255))

--四角の剛体  {}←初データを入れれる        densityは密度　1=水
--physics.addBody(square,"dynamic", {density = 10, friction = 0.03, bounce = 0.3})

-- 剛体に直線的なベクトルの速度を与える
--square:setLinearVelocity( 0,-300)

--力を加える方向のx,yと力を与える位置を設定
--square:applyForce(0.25,0,0,-25)

--瞬間的な衝撃を与える
--square:applyLinearImpulse( 0.009, 0, 0, -25)

--斜めの衝撃
--square:applyAngularImpulse(45)

--回転力を加える
--square:applyTorque(3600)

-- all display objects must be inserted into group
sceneGroup:insert( background )
sceneGroup:insert( grass)
--ボールをシーン追加
--sceneGroup:insert(ball)
--四角をシーン追加
--sceneGroup:insert(square)
end



--生成された果物を管理するための配列 #はテーブルの中のオブジェクトの数
local fruitsTable = {}

-- 1秒ごとに実行される関数　　
function update(event)
  --print(os.clock())
  local fruit = fruits.newFruit()
  
end


--リザルト画面

local finish = display.newImageRect( "images/finish2.png", 264, 90 )
finish.x = display.contentWidth * 0.5
finish.y = 200
--finish.anchorX = 0
--finish.anchorY = 0
--finish.x, finish.y = 0, 0
finish.isVisible = false


--ゲームオーバーの文字表示
local result = display.newImageRect( "images/result.jpg", display.contentWidth, display.contentHeight )
--finish.x = display.contentWidth * 0.5
--finish.y = 100
result.anchorX = 0
result.anchorY = 0
result.x, result.y = 0, 0
result.isVisible = false


local title_b = display.newImageRect( "images/title_back.png", 264, 90 )
title_b.anchorX = 0
title_b.anchorY = 0
title_b.x, title_b.y = 30, 160
title_b.isVisible = false


  --タイトルボタンを押すとなる関数
function titleback(event)
   if ("ended" == event.phase) then
     --ボタンのタッチイベント感知をとめる
     title_b:removeEventListener("touch",titleback)
     --さうんど
     media.playEventSound(se_decide)
     
  end
end

title_b:addEventListener("touch",titleback)


--　GameOverが押されたら実行する関数
function Ending(event)
  if ("ended" == event.phase) then
    --gameoverTextボタンのタッチイベント感知をとめる
    finish:removeEventListener("touch",Ending)
    finish.isVisible = false
    --　タイトルに戻るボタンとリプレイボタンを表示させる
    result.isVisible = true
    title_b.isVisible = true
 
    --ゲームBGMを停止
    media.stopSound()
    --　エンディングBGMを再生
    local ending_bgm = media.playSound("bgm/wav/result.wav")
 end
end


local function timeCheck()
  
  CountDownTimer = CountDownTimer-1
  if CountDownTimer>=10 then
    timerLabel.text = CountDownTimer
  elseif (CountDownTimer>0) then
    timerLabel.text = "0" .. CountDownTimer
  elseif (CountDownTimer==0) then
    timerLabel.text = "0" .. CountDownTimer
    media.playEventSound(se_finish)
    finish.isVisible = true  
 -- Game Over タッチイベントが感知されたらEnding関数を実行する
    finish:addEventListener("touch",Ending)
  end

  end
 
--1秒ごとにtimeCheck関数を呼び出す　呼び出し間隔、呼び出すfunction名、繰返し回数:time_limit
GameTimer1 = timer.performWithDelay(1000,timeCheck,60)
--timer.pause(GameTimer1)



 -- 1.5秒ごとにupdate関数を実行する
 tm = timer.performWithDelay(1500,update,0)
 
 
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
physics.start()
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
physics.stop()
elseif phase == "did" then
-- Called when the scene is now off screen
end	

end

function scene:destroy( event )

-- Called prior to the removal of scene's "view" (sceneGroup)
-- 
-- INSERT code here to cleanup the scene
-- e.g. remove display objects, remove touch listeners, save state, etc.
local sceneGroup = self.view

package.loaded[physics] = nil
physics = nil
end


---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
