-- SHIBA GET KEY GUI

local linkvertiseLink = "https://link-center.net/4248703/7sIsVJuQAVLG"
local lootlabsLink = "https://lootdest.org/s?zY7I2x6A"

local keyURL = "https://raw.githubusercontent.com/scriptjame/key/main/key.txt"

local correctKey = game:HttpGet(keyURL)
correctKey = correctKey:gsub("%s+","")

local keyFile = "ShibaKey.txt"

if isfile and isfile(keyFile) then
	local savedKey = readfile(keyFile)

	if savedKey == correctKey then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptjame/test2/refs/heads/main/loot.lua"))()
		return
	end
end

local TweenService = game:GetService("TweenService")

local clickSound = Instance.new("Sound")
clickSound.SoundId = "rbxassetid://12221967"
clickSound.Volume = 1
clickSound.Parent = game:GetService("CoreGui")

local gui = Instance.new("ScreenGui")
gui.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0,0,0,0)
frame.Position = UDim2.new(0.5,-170,0.5,-110)
frame.BackgroundColor3 = Color3.fromRGB(20,20,25)

Instance.new("UICorner",frame).CornerRadius = UDim.new(0,10)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(90,100,255)
stroke.Thickness = 1
stroke.Transparency = 0.5

TweenService:Create(
	frame,
	TweenInfo.new(0.35, Enum.EasingStyle.Quad),
	{Size = UDim2.new(0,340,0,230)}
):Play()

local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "Shiba"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.new(1,1,1)

local close = Instance.new("TextButton")
close.Parent = frame
close.Size = UDim2.new(0,25,0,25)
close.Position = UDim2.new(1,-30,0,8)
close.Text = "X"
close.BackgroundTransparency = 1
close.TextColor3 = Color3.new(1,1,1)

close.MouseButton1Click:Connect(function()
	clickSound:Play()
	gui:Destroy()
end)

local info = Instance.new("TextLabel")
info.Parent = frame
info.Position = UDim2.new(0,0,0.18,0)
info.Size = UDim2.new(1,0,0,25)
info.BackgroundTransparency = 1
info.Text = "Enter your key to begin."
info.TextColor3 = Color3.fromRGB(180,180,180)
info.Font = Enum.Font.Gotham
info.TextSize = 14

local box = Instance.new("TextBox")
box.Parent = frame
box.Size = UDim2.new(0.75,0,0,35)
box.Position = UDim2.new(0.12,0,0.33,0)

box.PlaceholderText = "Paste your key"
box.BackgroundColor3 = Color3.fromRGB(30,30,35)
box.TextColor3 = Color3.new(1,1,1)
box.Font = Enum.Font.GothamBold
box.TextSize = 16

box.ClearTextOnFocus = false
box.Text = ""

Instance.new("UICorner",box)

local paste = Instance.new("TextButton")
paste.Parent = frame
paste.Size = UDim2.new(0,30,0,30)
paste.Position = UDim2.new(0.88,0,0.33,2)
paste.Text = "📋"
paste.BackgroundTransparency = 1

paste.MouseButton1Click:Connect(function()

	clickSound:Play()

	if getclipboard then
		box.Text = getclipboard()
	end

end)

-- LINKVERTISE BUTTON
local linkv = Instance.new("TextButton")
linkv.Parent = frame
linkv.Size = UDim2.new(0.35,0,0,35)
linkv.Position = UDim2.new(0.1,0,0.55,0)
linkv.Text = "Linkvertise"
linkv.BackgroundColor3 = Color3.fromRGB(40,40,45)
linkv.TextColor3 = Color3.new(1,1,1)

Instance.new("UICorner",linkv)

linkv.MouseButton1Click:Connect(function()

	clickSound:Play()

	if setclipboard then
		setclipboard(linkvertiseLink)
	end

	game.StarterGui:SetCore("SendNotification",{
		Title = "Shiba",
		Text = "Linkvertise copied",
		Duration = 4
	})

end)

-- LOOTLABS BUTTON
local loot = Instance.new("TextButton")
loot.Parent = frame
loot.Size = UDim2.new(0.35,0,0,35)
loot.Position = UDim2.new(0.55,0,0.55,0)
loot.Text = "LootLabs"
loot.BackgroundColor3 = Color3.fromRGB(40,40,45)
loot.TextColor3 = Color3.new(1,1,1)

Instance.new("UICorner",loot)

loot.MouseButton1Click:Connect(function()

	clickSound:Play()

	if setclipboard then
		setclipboard(lootlabsLink)
	end

	game.StarterGui:SetCore("SendNotification",{
		Title = "Shiba",
		Text = "LootLabs copied",
		Duration = 4
	})

end)

local verify = Instance.new("TextButton")
verify.Parent = frame
verify.Size = UDim2.new(0.8,0,0,35)
verify.Position = UDim2.new(0.1,0,0.78,0)
verify.Text = "Verify Key"
verify.Font = Enum.Font.GothamBold
verify.TextSize = 15
verify.TextColor3 = Color3.new(1,1,1)
verify.BackgroundColor3 = Color3.fromRGB(70,90,255)

Instance.new("UICorner",verify)

verify.MouseButton1Click:Connect(function()

	clickSound:Play()

	local entered = box.Text

	if entered == correctKey then

		if writefile then
			writefile(keyFile, correctKey)
		end

		gui:Destroy()

		loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptjame/test2/refs/heads/main/loot.lua"))()

	else

		game.StarterGui:SetCore("SendNotification",{
			Title = "Shiba",
			Text = "Invalid Key",
			Duration = 4
		})

	end

end)
