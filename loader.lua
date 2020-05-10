--[[
  @author: ceg#0550
  @updated: 5/8/2020 8:08 PM
  @description: Main loader for zero-hub.
]]--

local BASE_URL = "https://raw.githubusercontent.com/Vzurxy/zerohub/master/"
local MarketplaceService = game:GetService("MarketplaceService")
local StarterGui = game:GetService("StarterGui")

local PlaceId = tostring(game.PlaceId)
local Games = loadstring(game:HttpGet(BASE_URL .. "/data/games.lua"))()

local Game = Games[PlaceId] ; if not Game then loadstring(game:HttpGet(Games["Universal"].Script))() end
local LastSaveUpdated = Game.Timestamp
local LastUpdated = tostring(MarketplaceService:GetProductInfo(PlaceId).Updated)

local BindWarning = Instance.new("BindableFunction")
local WarningAccepted = nil

BindWarning.OnInvoke = function(Option)
    if Option == "Run" then
        WarningAccepted = true
    elseif Option == "Cancel" then
        WarningAccepted = true
    end
end

if LastSaveUpdated ~= LastUpdated then
    StarterGui:SetCore("SendNotification", {
        Title = "[WARNING]",
        Text = "This game has updated recently, and scripts may be patched.",
        Icon = "rbxassetid://5003495802",
        Duration = math.huge,
        Callback = BindWarning,
        Button1 = "Run",
        Button2 = "Cancel"
    })

    repeat wait(0.1) until WarningAccepted ~= nil

    if WarningAccepted then
        loadstring(game:HttpGet(Game.Script))()
    else
        warn("User has cancelled the action.")
    end
elseif LastSaveUpdated == LastUpdated then
    loadstring(game:HttpGet(Game.Script))()
    warn("User has ran the loader and accepted.")
end
