local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local TextBox = Instance.new("TextBox")
local vf = Instance.new("VideoFrame")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Frame.BackgroundTransparency = 0.750
Frame.Draggable = true
Frame.Position = UDim2.new(0.226854697, 0, 0.333702862, 0)
Frame.Size = UDim2.new(0, 551, 0, 324)
Frame.BorderSizePixel = 0
Frame.Active = true

vf.Parent = Frame
vf.Looped = true
vf.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
vf.BackgroundTransparency = 0.750
vf.Position = UDim2.new(0, 0, 0.100000001, 0)
vf.Size = UDim2.new(0, 551, 0, 241)
vf.BorderSizePixel = 0

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Size = UDim2.new(0, 550, 0, 30)
TextLabel.Font = Enum.Font.Gotham
TextLabel.Text = "Lava's TV"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 18.000
TextLabel.BorderSizePixel = 0

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.827586234, 0, 0.864197493, 0)
TextButton.Size = UDim2.new(0, 78, 0, 35)
TextButton.Font = Enum.Font.GothamBold
TextButton.Text = "Play"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 14.000

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.457764119, 0, 0.863999963, 0)
TextBox.Size = UDim2.new(0, 192, 0, 35)
TextBox.ClearTextOnFocus = false
TextBox.Font = Enum.Font.Gotham
TextBox.Text = "5608368298"
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 14.000

TextButton.MouseButton1Click:Connect(function()
	local gvi = tonumber(TextBox.Text)
	vf.Video = "rbxassetid://"..gvi
	vf.Playing = true
end)
