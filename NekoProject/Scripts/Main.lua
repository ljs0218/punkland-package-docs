-- Scripts/Main.lua
-- 루트 클라이언트 스크립트

-- 패키지가 먼저 로드되므로 UIKit 전역 변수 사용 가능
print("[Main] 게임 시작")

-- UIKit 패키지의 함수 사용
local hud = UIKit.CreateHUD()
print("[Main] HUD 생성 완료")

-- 다른 패키지 모듈 직접 참조 (루트에서도 가능)
local Math = require("@MathLib/MathHelper")
print("[Main] 랜덤 값:", Math.randomRange(1, 100))

-- 루트 JSON 파일 읽기
local gameConfig = Utility.JSONParseFromFile("game_config.json")
if gameConfig then
    print("[Main] 게임 설정 로드됨 - 버전:", gameConfig.version)
end
