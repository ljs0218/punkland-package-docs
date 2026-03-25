-- UIKit/ServerScripts/ScoreManager.lua
-- 점수 관리 모듈 (서버)

-- 다른 패키지 참조
local Math = require("@MathLib/MathHelper")

-- 패키지 내부 설정 참조
local Config = require("Config")

-- 패키지 내부 JSON 파일 읽기
local scoreConfig = Utility.JSONParseFromFile("score_config.json")

local playerScores = {}

function AddScore(player, amount)
    local playerId = player.id

    if not playerScores[playerId] then
        playerScores[playerId] = 0
    end

    -- MathLib의 clamp 함수 사용
    local maxScore = scoreConfig and scoreConfig.maxScore or 99999
    playerScores[playerId] = Math.clamp(playerScores[playerId] + amount, 0, maxScore)

    print("[ScoreManager] " .. player.name .. " 점수: " .. playerScores[playerId])
    return playerScores[playerId]
end

function GetScore(player)
    return playerScores[player.id] or 0
end

function ResetScore(player)
    playerScores[player.id] = 0
end
