-- ServerScripts/Main.lua
-- 루트 서버 스크립트

print("[ServerMain] 서버 시작")

-- 패키지에서 등록한 전역 함수 사용 가능
-- AddScore, GetScore, ResetScore 등은 UIKit/ServerScripts/ScoreManager.lua에서 등록됨

-- 루트 JSON 파일 읽기
local serverConfig = Utility.JSONParseFromFile("server_config.json")
if serverConfig then
    print("[ServerMain] 서버 설정 로드됨")
    print("[ServerMain] 최대 플레이어:", serverConfig.maxPlayers)
end

-- 플레이어 접속 이벤트 예시
Server.onJoinPlayer.Add(function(player)
    print("[ServerMain] " .. player.name .. " 접속")

    -- UIKit 패키지의 점수 관리 함수 사용
    ResetScore(player)
    AddScore(player, 100)  -- 접속 보너스
end)

Server.onLeavePlayer.Add(function(player)
    print("[ServerMain] " .. player.name .. " 퇴장")
    print("[ServerMain] 최종 점수:", GetScore(player))
end)
