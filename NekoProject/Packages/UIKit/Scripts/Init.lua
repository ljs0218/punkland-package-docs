-- UIKit/Scripts/Init.lua
-- UIKit 패키지 진입점 (클라이언트)

-- 패키지 내부 모듈 참조 (같은 패키지)
local Config = require("Config")

-- 다른 패키지 모듈 참조 (@패키지명/모듈명)
local Math = require("@MathLib/MathHelper")

-- 루트 모듈 참조 (root: 접두사)
-- local GlobalUtil = require("root:GlobalUtil")

print("[UIKit] 초기화 시작")
print("[UIKit] HUD 투명도:", Config.hudOpacity)
print("[UIKit] Math.add(10, 20) =", Math.add(10, 20))
print("[UIKit] Math.clamp(150, 0, 100) =", Math.clamp(150, 0, 100))

-- UIKit 전역 테이블 등록
UIKit = {}

function UIKit.CreateHUD()
    local hud = Panel(Rect(Client.width/2, Client.height/2, 200, 50))
    hud.color = Color(0, 0, 0, Config.hudOpacity)
    return hud
end

function UIKit.FadeValue(from, to, progress)
    return Math.lerp(from, to, progress)
end

print("[UIKit] 초기화 완료")
