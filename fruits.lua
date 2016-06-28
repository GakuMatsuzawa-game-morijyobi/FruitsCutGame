-- fruits.lua
-- 呪文　fruits モジュール  ...はこのファイルのこと
module(..., package.seeall)

-- ランダムの種を時間に設定する
math.randomseed( os.time() )

-- 物理エンジンを導入
physics = require "physics"

-- 画像フォルダ
IMAGE_DIR = "images/"

-- 効果音フォルダ
SE_DIR = "se/"

-- 効果音を読み込む
local SE_Cut1 = audio.loadSound(SE_DIR.."SE_Cut1.mp3")
local SE_Cut2 = audio.loadSound(SE_DIR.."SE_Cut2.mp3")

--グループ作成
local myGroup = display.newGroup()

--スコア
local score=0

-- スコアの初期設定をする
function setScore()
   --scoreで与えられた得点と表示させる
     tfScoreDisplay = display.newText(score,
       display.contentWidth -50 , display.contentHeight*0.05,native.systemFont,30)
         tfScoreDisplay.align = "right"
	   
	     return  tfScoreDisplay
	     end

	     -- スコアを加算し表示する
	     function addScore(point)
	       --print(point)
	          score = score + point
		     tfScoreDisplay.text = score
		      
		       return score
		       end

