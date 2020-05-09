local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/Vzurxy/zerohub/master/uilib.lua"))()
local Library = UILibrary.UI
local Data = UILibrary.Data
local ScreenGui = UILibrary.Gui
local Save = UILibrary.Save
local Color = UILibrary.Color
local Theme = UILibrary.Theme

local ZeroHub = Library:create("Container" , {
	Name = "Zero Hub"
})

ZeroHub.self:create("Execute", {
	Name = "Bypass",
	Callback = function()
	        local Environment = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.LocalScript)
            debug.setconstant(Environment.kick, 8, 9e9)

            local MT = getrawmetatable(game)
            local Namecall = rawget(MT, "__namecall")

            setreadonly(MT, false);

            MT.__namecall = newcclosure(function(self, ...)
	            local Method = getnamecallmethod()

	            if Method == "Kick" then
		            return "Gay Ass Moments"
	            end

	            return Namecall(self, ...);
            end)

            game:GetService("ReplicatedStorage").lag:Destroy()
	end
})

ZeroHub.self:create("Text", {
	Name = "Modifier",
	Placeholder = "nil",
	ClearTextOnClick = true,
	Callback = function(Mod)
	        local Modifier = require(game:GetService("ReplicatedStorage").Mutators:FindFirstChild(Mod))
            if Modifier then
                Modifier.mutate()
            else
                warn("not a valid member")
            end
	end
})

ZeroHub.self:create("Text", {
	Name = "Revert",
	Placeholder = "nil",
	ClearTextOnClick = true,
	Callback = function(Mod)
	        local Modifier = require(game:GetService("ReplicatedStorage").Mutators:FindFirstChild(Mod))
            if Modifier then
                Modifier.revert()
            else
                warn("not a valid member")
            end
	end
})

ZeroHub.self:create("Execute", {
	Name = "Win",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").tower.sections.finish.exit.carpet.CFrame + Vector3.new(0, 3, 0)
	end
})
