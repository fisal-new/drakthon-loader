-- Drakthon loader
-- Reads the manifest, then prints the two paste lines. It runs nothing itself:
-- nothing executes a script until you paste one of the lines it prints.
local M = [[{"version":"1.0.0","hub":"https://raw.githubusercontent.com/fisal-new/drakthontest/main/drakthon-ui.lua","spy":"https://raw.githubusercontent.com/fisal-new/drakthon-spy/main/DrakthonSpy.lua"}]]

local function get(url)
    local g = (getgenv and getgenv()) or _G
    local req = request or (g and g.request)
    if req then
        local ok, res = pcall(req, { Url = url })
        if ok and res and (res.Body or res.body) then return res.Body or res.body end
    end
    if game and game.HttpGet then
        local ok, body = pcall(function() return game:HttpGet(url, true) end)
        if ok and body then return body end
    end
    return nil
end

local body = get(M) or M

local function field(s, k)
    return s:match('"' .. k .. '"%s*:%s*"([^"]*)"')
end

local v  = field(body, "version") or "?"
local hu = field(body, "hub") or "https://raw.githubusercontent.com/fisal-new/drakthontest/main/drakthon-ui.lua"
local sp = field(body, "spy") or "https://raw.githubusercontent.com/fisal-new/drakthon-spy/main/DrakthonSpy.lua"

print("Drakthon loader " .. v)
print("")
print("Hub:")
print('loadstring(game:HttpGet("' .. hu .. '"))()')
print("")
print("Spy:")
print('loadstring(game:HttpGet("' .. sp .. '"))()')
