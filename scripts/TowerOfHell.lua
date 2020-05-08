local StartTick = tick()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local TextService = game:GetService("TextService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

local function SetupUI()
    local Zero = Instance.new("ScreenGui")
    local PrimaryContainer = Instance.new("Frame")
    local Log = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    local UIPadding = Instance.new("UIPadding")
    local Input = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local Input_2 = Instance.new("TextBox")
    local AutoFill = Instance.new("Frame")
    local Main = Instance.new("Frame")
    local UIPadding_2 = Instance.new("UIPadding")
    local UIListLayout_2 = Instance.new("UIListLayout")
    local Text = Instance.new("TextLabel")
    local Description = Instance.new("TextLabel")
    local Current = Instance.new("TextLabel")

    Zero.Name = HttpService:GenerateGUID(true)
    Zero.Parent = CoreGui:FindFirstChild("RobloxGui")
    Zero.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Zero.ResetOnSpawn = false
    
    PrimaryContainer.Name = "PrimaryContainer"
    PrimaryContainer.Parent = Zero
    PrimaryContainer.BackgroundColor3 = Color3.new(1, 1, 1)
    PrimaryContainer.BackgroundTransparency = 1
    PrimaryContainer.Size = UDim2.new(1, 0, 0.155072466, 0)
    
    Log.Name = "Log"
    Log.Parent = PrimaryContainer
    Log.BackgroundColor3 = Color3.new(0, 0, 0)
    Log.BackgroundTransparency = 0.5
    Log.BorderSizePixel = 0
    Log.Position = UDim2.new(0.00811209437, 0, 0.0747663528, 0)
    Log.Size = UDim2.new(0.983038366, 0, 0.841121495, 0)
    Log.ScrollBarThickness = 5
    
    UIListLayout.Parent = Log
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    UIListLayout.Padding = UDim.new(0, -3)
    
    UIPadding.Parent = Log
    UIPadding.PaddingBottom = UDim.new(0, 4)
    UIPadding.PaddingLeft = UDim.new(0, 4)
    
    Input.Name = "Input"
    Input.Parent = PrimaryContainer
    Input.BackgroundColor3 = Color3.new(0, 0, 0)
    Input.BackgroundTransparency = 0.5
    Input.Position = UDim2.new(0.00811209437, 0, 0.99065423, 0)
    Input.Size = UDim2.new(0.983038366, 0, 0.214953274, 0)
    
    Title.Name = "Title"
    Title.Parent = Input
    Title.BackgroundColor3 = Color3.new(1, 1, 1)
    Title.BackgroundTransparency = 1
    Title.BorderSizePixel = 0
    Title.Position = UDim2.new(0.00300075021, 0, 0, 0)
    Title.Size = UDim2.new(0.140573353, 0, 0.99999994, 0)
    Title.Font = Enum.Font.Code
    Title.Text = (Players.LocalPlayer.Name) .. "@ZeroHub$"
    Title.TextColor3 = Color3.fromRGB(255, 0, 50)
    Title.TextSize = 14
    Title.TextXAlignment = Enum.TextXAlignment.Left
    
    Input_2.Name = "Input"
    Input_2.Parent = Input
    Input_2.BackgroundColor3 = Color3.new(1, 1, 1)
    Input_2.BackgroundTransparency = 1
    Input_2.Position = UDim2.new(0.141785443, 0, 0, 0)
    Input_2.Size = UDim2.new(0.858214557, 0, 1, 0)
    Input_2.Font = Enum.Font.Code
    Input_2.Text = ""
    Input_2.TextColor3 = Color3.new(1, 1, 1)
    Input_2.TextSize = 14
    Input_2.TextXAlignment = Enum.TextXAlignment.Left
    
    AutoFill.Name = "AutoFill"
    AutoFill.Parent = Input
    AutoFill.BackgroundColor3 = Color3.new(0, 0, 0)
    AutoFill.BackgroundTransparency = 0.5
    AutoFill.Position = UDim2.new(0, 227, 0, 45)
    AutoFill.Size = UDim2.new(0, 210, 0, 108)
    AutoFill.Visible = false
    
    Main.Name = "Main"
    Main.Parent = AutoFill
    Main.BackgroundColor3 = Color3.new(1, 1, 1)
    Main.BackgroundTransparency = 1
    Main.Size = UDim2.new(1, 0, 1, 0)
    
    UIPadding_2.Parent = Main
    UIPadding_2.PaddingLeft = UDim.new(0, 4)
    UIPadding_2.PaddingTop = UDim.new(0, 4)
    
    UIListLayout_2.Parent = Main
    UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
    
    Text.Name = "Text"
    Text.Parent = Main
    Text.BackgroundColor3 = Color3.new(1, 1, 1)
    Text.BackgroundTransparency = 1
    Text.BorderSizePixel = 0
    Text.Position = UDim2.new(0.0190452114, 0, 0.0368806422, 0)
    Text.Size = UDim2.new(0.92311424, 0, 0.215146273, 0)
    Text.Font = Enum.Font.SourceSansBold
    Text.Text = ""
    Text.TextColor3 = Color3.new(1, 1, 1)
    Text.TextSize = 20
    Text.TextWrapped = true
    Text.TextXAlignment = Enum.TextXAlignment.Left
    Text.TextYAlignment = Enum.TextYAlignment.Top
    
    Description.Name = "Description"
    Description.Parent = Main
    Description.BackgroundColor3 = Color3.new(1, 1, 1)
    Description.BackgroundTransparency = 1
    Description.BorderSizePixel = 0
    Description.Position = UDim2.new(0.0190451387, 0, 0.244092137, 0)
    Description.Size = UDim2.new(0.9231143, 0, 0.546334565, 0)
    Description.Font = Enum.Font.SourceSans
    Description.Text = ""
    Description.TextColor3 = Color3.new(1, 1, 1)
    Description.TextSize = 17
    Description.TextWrapped = true
    Description.TextXAlignment = Enum.TextXAlignment.Left
    Description.TextYAlignment = Enum.TextYAlignment.Top
    
    Current.Name = "Current"
    Current.Parent = AutoFill
    Current.BackgroundColor3 = Color3.new(1, 1, 1)
    Current.BackgroundTransparency = 1
    Current.BorderSizePixel = 0
    Current.Position = UDim2.new(0.0190452114, 0, 0.790426791, 0)
    Current.Size = UDim2.new(0.947625697, 0, 0.200171411, 0)
    Current.Font = Enum.Font.Code
    Current.Text = ""
    Current.TextColor3 = Color3.new(0.835294, 0.835294, 0.835294)
    Current.TextSize = 14
    Current.TextWrapped = true
    Current.TextXAlignment = Enum.TextXAlignment.Left
    
    return Zero
end

local Player = Players.LocalPlayer
local Character = Player.Character
local PlayerGui = Player.PlayerGui
local Mouse = Player:GetMouse()

local PlaceId = game.PlaceId

local Gui = SetupUI()

local PrimaryContainer = Gui:WaitForChild("PrimaryContainer")
local InputF = PrimaryContainer:WaitForChild("Input")
local Input = InputF:WaitForChild("Input")
local LogFrame = PrimaryContainer:WaitForChild("Log")
local AutoFill = InputF:WaitForChild("AutoFill")
local AF_Main = AutoFill:WaitForChild("Main")
local AF_Text = AF_Main:WaitForChild("Text")
local AF_Desc = AF_Main:WaitForChild("Description")
local AF_Current = AutoFill:WaitForChild("Current")

local SelectedCommand, SelectedArgs = nil, {}
local Processing = false
local Focused
local AwaitingActivationKey, AwaitingFocusKey = false, false
local ActiveCommandSet = nil

local TempData = { -- This is for commands to write data that they need to access later. (things like on/off values, etc...)
    Waypoints = {}  
}

local ActivateKey, FocusKey = Enum.KeyCode.Quote, Enum.KeyCode.Period
local MouseDown = false

local function GetTextSize(text, label, size)
    return TextService:GetTextSize(text, label.TextSize, label.Font, size or Vector2.new(label.AbsoluteSize.X, 0))
end

local function Log(msg, sys)
    local Card = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local Text = Instance.new("TextLabel")
    
    Card.Name = "Card"
    Card.Parent = LogFrame
    Card.BackgroundColor3 = Color3.new(1, 1, 1)
    Card.BackgroundTransparency = 1
    Card.BorderSizePixel = 0
    Card.Position = UDim2.new(0, 4, 0, 67)
    Card.Size = UDim2.new(0, 1330, 0, 19)
    
    Title.Name = "Title"
    Title.Parent = Card
    Title.BackgroundColor3 = Color3.new(1, 1, 1)
    Title.BackgroundTransparency = 1
    Title.BorderSizePixel = 0
    Title.Size = UDim2.new(0.140573353, 0, 0.99999994, 0)
    Title.Font = Enum.Font.Code
    Title.Text = ""
    Title.TextColor3 = Color3.new(1, 0.694118, 0.160784)
    Title.TextSize = 14
    Title.TextXAlignment = Enum.TextXAlignment.Left
    
    Text.Name = "Text"
    Text.Parent = Card
    Text.BackgroundColor3 = Color3.new(1, 1, 1)
    Text.BackgroundTransparency = 1
    Text.BorderSizePixel = 0
    Text.Position = UDim2.new(0.140573353, 0, 0, 0)
    Text.Size = UDim2.new(0.16336903, 0, 0.99999994, 0)
    Text.Font = Enum.Font.Code
    Text.Text = ""
    Text.TextColor3 = Color3.new(1, 1, 1)
    Text.TextSize = 14
    Text.TextXAlignment = Enum.TextXAlignment.Left
    
    Text.Text = msg
    
    if not sys then
        Title.Text = Player.Name .. "@ZeroHub$"
        Text.Position = Title.Position + UDim2.new(0, GetTextSize(Title.Text, Title).X + 4, 0, 0)
    else
        Title.Text = ""
        Text.Position = Title.Position
    end
end

Log("Loading Command Line...", true)

Input.Position = InputF.Title.Position + UDim2.new(0, GetTextSize(InputF.Title.Text, InputF.Title).X + 4, 0, 0)
LogFrame.CanvasPosition = Vector2.new(0, 250000)

local function NewCommandSet(tbl)
    ActiveCommandSet = tbl
    
    if ActiveCommandSet[PlaceId] and ActiveCommandSet[PlaceId].Init and ActiveCommandSet.Main then
        ActiveCommandSet[PlaceId].Init()
    end
end

local function CopyDeep(orig)
    local Type = type(orig)
    local Copy
    if Type == "table" then
        Copy = {}
        for Key, Value in pairs(orig) do
            Copy[CopyDeep(Key)] = CopyDeep(Value)
        end
        setmetatable(Copy, CopyDeep(getmetatable(orig)))
    else
        Copy = orig
    end

    return Copy
end

local function TableContains(tbl, value)
	for Key, Value in pairs(tbl) do
		if Value == value then
			return true
		end
	end
	return false
end

local Commands = nil

Commands = {
    Main = true,
    Game = {
        Commands = {
            {
                Name = "help",
                Description = "Lists available commands to use.",
                Aliases = {"cmds"},
                Args = {},
                Run = function(args)
                   Log([[
                   
                   ]], true)
                end
            },
            {
                Name = "acbypass",
                Description = "Bypasses the anti cheat.",
                Aliases = {},
                Args = {},
                Run = function(args)
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
            },
            {
                Name = "modifier",
                Description = "Lists available commands to use.",
                Aliases = {},
                Args = {
                    {
                        Name = "Modifier",
                        Description = "The name of the modifier (CLIENT). (gravity, negative, speed, fog, bunny, invincibility, checkpoints)",
                        Type = "string",
                    }
                },
                Run = function(args)
                    local Modifier = game:GetService("ReplicatedStorage").Mutators:FindFirstChild(args.Modifier)
                    if Modifier then
                        Modifier.mutate()
                    else
                        Log("Invalid mutator...", true)
                    end
                end
            },
	          {
                Name = "revert"
                Description = "Reverts a modifier."
                Aliases = {},
                Args = {
                    {
                        Name = "Revert"
                        Description = "The name of the modifier to revert (CLIENT). (gravity, negative, speed, fog, bunny, invincibility, checkpoints)",
                        Type = "string",
                    }
                },
                Run = function(args)
                    local Modifier = game:GetService("ReplicatedStorage").Mutators:FindFirstChild(args.Revert)
                    if Modifier then
                        Modifier.revert()
                    else
                        Log("Invalid mutator...", true)
                    end
                end
            },
            {
                Name = "win",
                Description = "Teleports you to the red carpet.",
                Aliases = {},
                Args = {},
                Run = function(args)
                  Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").tower.sections.finish.exit.carpet.CFrame
                end
            }
        } -- End of Commands (easier to track)
    },
}

local function GetCommandInfo(str)
    if str then
        str = string.lower(str)
    else
        return nil
    end
    
    for _,cmd in pairs(ActiveCommandSet.Game.Commands) do
        if string.lower(cmd.Name) == str then
            return cmd  
        end
    end
    
    if ActiveCommandSet[PlaceId] then       
        for _,cmd in pairs(ActiveCommandSet[PlaceId].Commands) do
            if string.lower(cmd.Name) == str or TableContains(cmd.Aliases, str) then
                return cmd  
            end
        end
    end
    
    return nil
end

local function GetClosestCommand(str)
    if str then
        str = string.lower(str)
    else
        return nil
    end
    
    if GetCommandInfo(str) then
        return GetCommandInfo(str)
    end
    
    for _,cmd in pairs(ActiveCommandSet.Game.Commands) do
        if string.sub(string.lower(cmd.Name), 1, #str) == str then
            return cmd
        else
            if cmd and cmd.Aliases then
                for _, alias in pairs(cmd.Aliases) do
                    if string.sub(string.lower(alias), 1, #str) == str then
                        return cmd
                    end
                end
            end
        end
    end
    
    if ActiveCommandSet[PlaceId] then       
        for _,cmd in pairs(ActiveCommandSet[PlaceId].Commands) do
            if string.sub(string.lower(cmd.Name), 1, #str) == str then
                return cmd
            else
                for _, alias in pairs(cmd.Aliases) do
                    if string.sub(string.lower(alias), 1, #str) == str then
                        return cmd
                    end
                end
            end
        end
    end
    
    return nil
end

local function GetClosestPlayerName(str)
    for _,v in pairs(Players:GetPlayers()) do
        if string.sub(string.lower(v.Name), 1, #str) == str then
            return v
        end
    end
    
    return nil
end

local function GetClosestTeam(str)
    for _,v in pairs(game:GetService("Teams"):GetChildren()) do
        if string.sub(string.lower(v.Name), 1, #str) == str then
            return v
        end
    end
    
    return nil
end

local function GetDictionaryLen(tbl)
    local len = 0
    for i,v in pairs(tbl) do
        len = len + 1
    end
    return len
end

local function GetArgByName(name, cmd)
    for _,v in pairs(cmd.Args) do
        if v.Name == name then
            return v
        end
    end
end

local function ParseString(str)
    local words = {}
    
    for w in str:gmatch("(%S+)") do
        table.insert(words, w)
    end
    
    return words
end

function FindNearestPlayer(pos, notl)
	-- notl (true = accept local player, false = disallow local player)
    local nearest
    local players = Players:GetPlayers()
    
    if notl then
        nearest = players[2]
    
        for i,v in pairs(players) do
            if v.Character and v ~= Player then
                local nearestpos = (pos - nearest.Character.PrimaryPart.Position).magnitude
                local currentpos = (pos - v.Character.PrimaryPart.Position).magnitude
    
                if currentpos < nearestpos then
                    nearest = v
                end
            end
        end
    else
        nearest = players[1]
    
        for i,v in pairs(players) do
            if v.Character then
                local nearestpos = (pos - nearest.Character.PrimaryPart.Position).magnitude
                local currentpos = (pos - v.Character.PrimaryPart.Position).magnitude
    
                if currentpos < nearestpos then
                    nearest = v
                end
            end
        end
    end

    return nearest
end

Input.Focused:Connect(function()
    Focused = true
    
    if AwaitingFocusKey or AwaitingActivationKey then
        AwaitingFocusKey = false
        AwaitingActivationKey = false
        Log("Keyset cancelled!", true)
    end
end)

Input.FocusLost:Connect(function()
    wait(0.01)
    Focused = false
end)

Input.Changed:Connect(function(c)
    if Processing then return end
    
    if c == "Text" then
        local text = Input.Text
        if string.sub(text, #text, #text) == " " or text == "" then AutoFill.Visible = false return end
        local TParsed = ParseString(text)
        local NearestCommand = GetClosestCommand(ParseString(text)[1])
        
        AF_Current.Text = text
        
        if NearestCommand and #TParsed == 1 and string.lower(NearestCommand.Name) ~= text then
            SelectedCommand = nil
            
            AutoFill.Visible = true
            AF_Text.Text = tostring(NearestCommand.Name)
            AF_Desc.Text =  tostring(NearestCommand.Description)
        elseif NearestCommand and not SelectedCommand and TParsed[1] == text and #TParsed == 1 and string.lower(GetClosestCommand(TParsed[1]).Name) == string.lower(text) then
            SelectedCommand = GetClosestCommand(TParsed[1])
            AutoFill.Visible = false
        elseif not NearestCommand then
            AutoFill.Visible = false
        end
        
        table.remove(TParsed, 1)
        
        if SelectedCommand then
            local CurrentArg = TParsed[#TParsed]
            local RealArgInfo = SelectedCommand.Args[#TParsed]
            AutoFill.Visible = true
                    
            if RealArgInfo then
                AF_Current.Text = CurrentArg
                
                AF_Text.Text = tostring(RealArgInfo.Name .. " [" .. RealArgInfo.Type .. "]")
                AF_Desc.Text =  tostring(RealArgInfo.Description)
                
                if RealArgInfo.Type == "player" then
                    if string.lower(CurrentArg) == "me" then
                        SelectedArgs[#TParsed] = Player
                    elseif string.lower(CurrentArg) == "all" then
                        SelectedArgs[#TParsed] = "all"
                    elseif string.lower(CurrentArg) == "others" then
                        SelectedArgs[#TParsed] = "others"
                    elseif string.sub(string.lower(CurrentArg), 1, 1) == "%" then
                        SelectedArgs[#TParsed] = CurrentArg
                    elseif string.sub(string.lower(CurrentArg), 1, 9) == "distance:" then
                        local distance = string.sub(string.lower(CurrentArg), 10, #CurrentArg)
                        
                        if #distance >= 1 then
                            SelectedArgs[#TParsed] = CurrentArg
                        end
                    else
                        if GetClosestPlayerName(string.lower(CurrentArg)) then
                            AF_Current.Text = GetClosestPlayerName(CurrentArg).Name or CurrentArg
                            
                            SelectedArgs[#TParsed] = GetClosestPlayerName(CurrentArg) or CurrentArg
                        end

                        if GetClosestPlayerName(CurrentArg) and GetClosestPlayerName(CurrentArg).Name == CurrentArg then
                            AutoFill.Visible = false
                        end
                    end
                elseif RealArgInfo.Type == "int" then
                    SelectedArgs[#TParsed] = tonumber(CurrentArg)
                elseif RealArgInfo.Type == "string" then
                    SelectedArgs[#TParsed] = CurrentArg
                elseif RealArgInfo.Type == "bool" then
                    if string.lower(CurrentArg) == "true" then
                        SelectedArgs[#TParsed] = true
                    elseif string.lower(CurrentArg) == "false" then
                        SelectedArgs[#TParsed] = false
                    end
                end
            end
        end
        
        local ts = GetTextSize(Input.Text, Input)
        AutoFill.Position = Input.Position + UDim2.new(0, ts.X, 0, 37)
    end
end)

UserInputService.InputBegan:Connect(function(input, gpe)
    if input.KeyCode == Enum.KeyCode.Unknown then return end
    
    if input.KeyCode == ActivateKey and not gpe then
        Gui.Enabled = not Gui.Enabled
        
        if Gui.Enabled then
            Input:CaptureFocus()
        end
    end
    
    if input.KeyCode == FocusKey and not gpe then
        if Gui.Enabled then
            Input:CaptureFocus()
        end
    end
    
    if input.KeyCode == Enum.KeyCode.Return then
        if Focused then
            AutoFill.Visible = false
            Processing = true
            
            Log(Input.Text)
            
            Input.Text = ""
            
            if SelectedCommand then
                local ArgsToSend = {}
                local Ran = false
                local Custom = false
                
                for i,v in pairs(SelectedArgs) do
                    if SelectedCommand and SelectedCommand.Args and SelectedCommand.Args[i] and SelectedCommand.Args[i].Name then
                        ArgsToSend[SelectedCommand.Args[i].Name] = v
                    end
                end
                
                if #SelectedArgs < GetDictionaryLen(SelectedCommand.Args) then
                    Log("Missing argument(s).", true)
                else
                    for i,v in pairs(ArgsToSend) do
                        local ArgInfo = ArgsToSend[i]
                        local RealArgInfo = GetArgByName(i, SelectedCommand)
                        if RealArgInfo.Type == "player" then
                            if type(v) == "string" and string.lower(v) == "all" then
                                Custom = true
                                for _,targ in pairs(Players:GetPlayers()) do
                                    local NewArgsToSend = {}
                                    for i1,v1 in pairs(ArgsToSend) do
                                        if i1 == i then
                                            NewArgsToSend[i1] = targ
                                        else
                                            NewArgsToSend[i1] = v1
                                        end
                                    end
                                    SelectedCommand.Run(NewArgsToSend)
                                    Ran = true
                                end
                            elseif type(v) == "string" and string.lower(v) == "others" then
                                Custom = true
                                for _,targ in pairs(Players:GetPlayers()) do
                                    if targ ~= Player then
                                        local NewArgsToSend = {}
                                        for i1,v1 in pairs(ArgsToSend) do
                                            if i1 == i then
                                                NewArgsToSend[i1] = targ
                                            else
                                                NewArgsToSend[i1] = v1
                                            end
                                        end
                                        SelectedCommand.Run(NewArgsToSend)
                                        Ran = true
                                    end
                                end
                            elseif type(v) == "string" and string.sub(v, 1, 1) == "%" then
                                Custom = true
                                local team = GetClosestTeam(string.sub(v, 2, #v))
                                print(team)
                                print(string.sub(v, 2, #v))
                                if team then
                                    for _,targ in pairs(Players:GetPlayers()) do
                                        if targ.Team == team then
                                            print(targ)
                                            local NewArgsToSend = {}
                                            for i1,v1 in pairs(ArgsToSend) do
                                                if i1 == i then
                                                    NewArgsToSend[i1] = targ
                                                else
                                                    NewArgsToSend[i1] = v1
                                                end
                                            end
                                            SelectedCommand.Run(NewArgsToSend)
                                            Ran = true
                                        end
                                    end
                                end
                            elseif type(v) == "string" and string.sub(v, 1, 9) == "distance:" then
                                Custom = true
                                for _, p in pairs(Players:GetPlayers()) do
                                    if p.Character and p ~= Player then
                                        local dist = Player:DistanceFromCharacter(p.Character:GetPrimaryPartCFrame().Position)
                                        if dist <= tonumber(string.sub(v, 10, #v)) then
                                            local NewArgsToSend = {}
                                            for i1, v1 in pairs(ArgsToSend) do
                                                if i1 == i then
                                                    NewArgsToSend[i1] = p
                                                else
                                                    NewArgsToSend[i1] = v1
                                                end
                                            end
                                            
                                            if SelectedCommand then
                                                SelectedCommand.Run(NewArgsToSend)
                                            end
                                            Ran = true
                                        end
                                    end
                                end
                            end
                        end
                    end
                    
                    if not Ran and not Custom then
                        SelectedCommand.Run(ArgsToSend)
                    end
                end
                
                AutoFill.Visible = false
            elseif not Input.Text == "" then
                Log("Unknown command.", true)
            end
            
            Processing = false
            SelectedCommand = nil
            SelectedArgs = {}
        end
    end
    
    if AwaitingActivationKey and not gpe then
        AwaitingActivationKey = false
        
        if input.KeyCode == Enum.KeyCode.Return then
            Log("Error: Keybind cannot be enter/return key.", true)
        elseif input.KeyCode == FocusKey then
            Log("Error: Keybind cannot be the focus key.", true)
        else
            ActivateKey = input.KeyCode
            Log("Success! Set keybind to " .. input.KeyCode.Name .. " key.", true)
        end
    end
    
    if AwaitingFocusKey and not gpe then
        AwaitingFocusKey = false
        
        if input.KeyCode == Enum.KeyCode.Return then
            Log("Error: Keybind cannot be enter/return key.", true)
        elseif input.KeyCode == ActivateKey then
            Log("Error: Keybind cannot be the hide/show key.", true)
        else
            FocusKey = input.KeyCode
            Log("Success! Set focus keybind to " .. input.KeyCode.Name .. " key.", true)
        end
    end
end)

Mouse.Button1Down:Connect(function()
    MouseDown = true
end)

Mouse.Button1Up:Connect(function()
    MouseDown = false
end)

local TimeTook = ("(%.2f seconds)"):format(tostring(tick() - StartTick))

Log("ZeroHub Command Line - Successfully loaded! (" .. TimeTook .. " seconds)", true)
Log("", true)

NewCommandSet(Commands)
