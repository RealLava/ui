-- scripted by lava
local Commands = {}
local c = game.Players.LocalPlayer.PlayerGui:FindFirstChild("Proton")
local search = c.ProtonCommandList.Commands.Search
local cmdlist = c.ProtonCommandList.Commands.ScrollingFrame.ProtonCommandListText.Text
local CMDBar = c.ProtonCommandBar.ProtonCommandBarTextbox
local ProtonC = c.ProtonCommandBar
local SearchResults = CMDBar.SearchResults
local Example = CMDBar.CommandExample
local SBar = CMDBar.SBar
local Focus = CMDBar["Focus"]
local List = c.ProtonCommandList.Commands.List
local e = c.ProtonCommandList.Commands.Example
function addcmd(name)
	Commands[#Commands+1] = { NAME = name }
end
for _, line in ipairs(string.split(cmdlist, "\n")) do
	addcmd(line)
end
for i, Command in next, Commands do
	local New = e:Clone()
	New.Name = Command.NAME
	New.Text = Command.NAME:upper()
	New.CmdName.Text = "Name: "..Command.NAME
	New.Visible = true
	New.Parent = List
end
function findCMD(nameOrAlias)
	for _, cmd in ipairs(Commands) do
		if string.lower(cmd.NAME) == string.lower(nameOrAlias) then
			return cmd
		end
	end
end
function getResults(word)
	local results = {}
	for _, cmd in ipairs(Commands) do
		-- Check if the command name matches the word
		if string.lower(cmd.NAME:sub(1, #word)) == string.lower(word) then
			table.insert(results, cmd.NAME)
		end
		-- Check if any of the command aliases match the word
		for _, alias in ipairs(cmd.ALIAS or {}) do
			if string.lower(alias:sub(1, #word)) == string.lower(word) then
				table.insert(results, alias)
			end
		end
	end
	return results
end
CMDBar:GetPropertyChangedSignal("Text"):Connect(function()
	while CMDBar.Text:sub(1, 1):match("%s") do
		CMDBar.Text = CMDBar.Text:sub(2)
	end

	SearchResults:ClearAllChildren()
	SBar.Text = ""

	local command	= CMDBar.Text:match("%S+")
	local Pos		= UDim2.new(-0, 0, 0, -36)

	for index, value in pairs(getResults(command)) do
		local Result 	= Example:Clone()
		Result.Visible = true
		local uh = findCMD(value)
		Result.Text = value.." | No description."
		Result.Position = Pos
		Result.Parent = SearchResults
		Pos = Pos - UDim2.new(0, 0, 0, 36)
	end
end)
search.Changed:Connect(function(Prop)
	if Prop == "Text" then
		local Amount = 0
		for i, Object in next, List:GetChildren() do
			if Object.ClassName == "TextLabel" then
				if string.sub(string.lower(Object.Name), 1, #search.Text) == string.lower(search.Text) then
					Object.Visible = true
					Amount = Amount + 1
				else
					Object.Visible = false
				end
			end
		end
	end
end)
function Tween(Object, Time, Customization)
	game:GetService("TweenService"):Create(Object, TweenInfo.new(Time), Customization):Play()
end
CMDBar.Focused:connect(function()
	CMDBar.Text = ""
	game:GetService("RunService").RenderStepped:wait()
	Tween(ProtonC, .25, {Position = UDim2.new(.435, -345, .95, -35)})
	wait(.25)
	Tween(Focus, .55, {Position = UDim2.new(-.038, 0, 1.029, 0), Size = UDim2.new(0, 986, 0, 5)})
end)
CMDBar.FocusLost:connect(function(enterPressed)
	local Rem = CMDBar.Text
	game:GetService("RunService").RenderStepped:wait()
	Tween(Focus, .55, {Position = UDim2.new(.473, 0, 1.029, 0), Size = UDim2.new(0, 0, 0, 5)})
	wait(.55)
	Tween(ProtonC, .25, {Position = UDim2.new(.435, -345, 1, 0)})
	CMDBar.Text = ""
end)
game:GetService("Players").LocalPlayer:GetMouse().KeyDown:connect(function(input)
	if (input == ";") then
		CMDBar:CaptureFocus()
	end
end)
