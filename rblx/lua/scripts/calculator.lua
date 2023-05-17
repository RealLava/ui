local lua = Instance.new("ScreenGui")
local ui = Instance.new("Frame")
local label = Instance.new("TextLabel")
local output = Instance.new("TextBox")
local sort = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local add = Instance.new("TextButton")
local subtract = Instance.new("TextButton")
local divide = Instance.new("TextButton")
local times = Instance.new("TextButton")
local number1 = Instance.new("TextBox")
local number2 = Instance.new("TextBox")
local function calculate(operation, num1, num2)
	if operation == "addition" then
		return num1 + num2
	elseif operation == "subtraction" then
		return num1 - num2
	elseif operation == "multiplication" then
		return num1 * num2
	elseif operation == "division" then
		if num2 == 0 then
			return
		else
			return num1 / num2
		end
	else
		return
	end
end
lua.Name = "lua"
lua.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
lua.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ui.Name = "ui"
ui.Parent = lua
ui.Active = true
ui.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ui.Draggable = true
ui.Position = UDim2.new(0.137952179, 0, 0.562318861, 0)
ui.Size = UDim2.new(0, 360, 0, 200)
label.Name = "label"
label.Parent = ui
label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
label.Position = UDim2.new(-4.23855262e-08, 0, 0, 0)
label.Size = UDim2.new(0, 360, 0, 29)
label.Font = Enum.Font.SourceSans
label.Text = "Lua Calculator"
label.TextColor3 = Color3.fromRGB(0, 0, 0)
label.TextSize = 14.000
output.Name = "output"
output.Parent = ui
output.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
output.Position = UDim2.new(0.138888896, 0, 0.840000033, 0)
output.Size = UDim2.new(0, 260, 0, 20)
output.Font = Enum.Font.SourceSans
output.PlaceholderText = "output"
output.Text = ""
output.TextColor3 = Color3.fromRGB(0, 0, 0)
output.TextSize = 14.000
sort.Name = "sort"
sort.Parent = ui
sort.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sort.BackgroundTransparency = 1.000
sort.Position = UDim2.new(0.075000003, 0, 0.560000002, 0)
sort.Size = UDim2.new(0, 305, 0, 50)
UIListLayout.Parent = sort
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout.Padding = UDim.new(0.0350000001, 0)
add.Name = "add"
add.Parent = sort
add.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
add.Position = UDim2.new(0.819444478, 0, 0.560000002, 0)
add.Size = UDim2.new(0, 50, 0, 50)
add.Font = Enum.Font.SourceSans
add.Text = "+"
add.TextColor3 = Color3.fromRGB(0, 0, 0)
add.TextSize = 40.000
add.TextWrapped = true
subtract.Name = "subtract"
subtract.Parent = sort
subtract.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
subtract.Position = UDim2.new(0.819444478, 0, 0.560000002, 0)
subtract.Size = UDim2.new(0, 50, 0, 50)
subtract.Font = Enum.Font.SourceSans
subtract.Text = "-"
subtract.TextColor3 = Color3.fromRGB(0, 0, 0)
subtract.TextSize = 40.000
subtract.TextWrapped = true
divide.Name = "divide"
divide.Parent = sort
divide.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
divide.Position = UDim2.new(0.819444478, 0, 0.560000002, 0)
divide.Size = UDim2.new(0, 50, 0, 50)
divide.Font = Enum.Font.SourceSans
divide.Text = "/"
divide.TextColor3 = Color3.fromRGB(0, 0, 0)
divide.TextSize = 40.000
divide.TextWrapped = true
times.Name = "times"
times.Parent = sort
times.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
times.Position = UDim2.new(0.819444478, 0, 0.560000002, 0)
times.Size = UDim2.new(0, 50, 0, 50)
times.Font = Enum.Font.SourceSans
times.Text = "x"
times.TextColor3 = Color3.fromRGB(0, 0, 0)
times.TextSize = 40.000
times.TextWrapped = true
number1.Name = "number1"
number1.Parent = ui
number1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
number1.Position = UDim2.new(0.0527777784, 0, 0.204999998, 0)
number1.Size = UDim2.new(0, 138, 0, 50)
number1.Font = Enum.Font.SourceSans
number1.Text = "1"
number1.TextColor3 = Color3.fromRGB(0, 0, 0)
number1.TextSize = 20.000
number2.Name = "number2"
number2.Parent = ui
number2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
number2.Position = UDim2.new(0.558333337, 0, 0.204999998, 0)
number2.Size = UDim2.new(0, 138, 0, 50)
number2.Font = Enum.Font.SourceSans
number2.PlaceholderText = "number 2"
number2.Text = "2"
number2.TextColor3 = Color3.fromRGB(0, 0, 0)
number2.TextSize = 20.000
add.MouseButton1Click:Connect(function()
	output.Text = calculate("addition", tonumber(number1.Text), tonumber(number2.Text))
end)
subtract.MouseButton1Click:Connect(function()
	output.Text = calculate("subtraction", tonumber(number1.Text), tonumber(number2.Text))
end)
times.MouseButton1Click:Connect(function()
	output.Text = calculate("multiplication", tonumber(number1.Text), tonumber(number2.Text))
end)
divide.MouseButton1Click:Connect(function()
	output.Text = calculate("division", tonumber(number1.Text), tonumber(number2.Text))
end)
