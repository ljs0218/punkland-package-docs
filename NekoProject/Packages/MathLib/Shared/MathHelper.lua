-- MathLib/Shared/MathHelper.lua
-- 수학 유틸리티 모듈

local M = {}

function M.add(a, b)
    return a + b
end

function M.subtract(a, b)
    return a - b
end

function M.clamp(value, min, max)
    if value < min then return min end
    if value > max then return max end
    return value
end

function M.lerp(a, b, t)
    return a + (b - a) * t
end

function M.randomRange(min, max)
    return math.random(min, max)
end

return M
