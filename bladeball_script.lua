-- SHIBA KEY SYSTEM

local keyURL = "https://raw.githubusercontent.com/scriptjame/key/main/key.txt"
local getKeyLink = "https://lootdest.org/s?zY7I2x6A"

local correctKey = game:HttpGet(keyURL)
correctKey = correctKey:gsub("%s+","")

-- nếu đã có key đúng thì chạy script luôn
if getgenv().ShibaKey == correctKey then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptjame/testloot/main/testloot.lua"))()
	return
end

-- GUI
local TweenService = game:GetService("TweenService")

local gui = Instance.new("ScreenGui")
gui.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0,340,0,200)
frame.Position = UDim2.new(0.5,-170,0.5,-100)
frame.BackgroundColor3 = Color3.fromRGB(20,20,25)

Instance.new("UICorner",frame)

local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "Shiba"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.new(1,1,1)

local box = Instance.new("TextBox")
box.Parent = frame
box.Size = UDim2.new(0.75,0,0,35)
box.Position = UDim2.new(0.12,0,0.35,0)
box.PlaceholderText = "Enter key"
box.BackgroundColor3 = Color3.fromRGB(30,30,35)
box.TextColor3 = Color3.new(1,1,1)

Instance.new("UICorner",box)

local get = Instance.new("TextButton")
get.Parent = frame
get.Size = UDim2.new(0.35,0,0,35)
get.Position = UDim2.new(0.1,0,0.7,0)
get.Text = "Get Key"

Instance.new("UICorner",get)

get.MouseButton1Click:Connect(function()

	if setclipboard then
		setclipboard(getKeyLink)
	end

	game.StarterGui:SetCore("SendNotification",{
		Title = "Shiba",
		Text = "Key link copied",
		Duration = 4
	})

end)

local verify = Instance.new("TextButton")
verify.Parent = frame
verify.Size = UDim2.new(0.45,0,0,35)
verify.Position = UDim2.new(0.5,0,0.7,0)
verify.Text = "Verify"

Instance.new("UICorner",verify)

verify.MouseButton1Click:Connect(function()

	if box.Text == correctKey then

		getgenv().ShibaKey = correctKey

		gui:Destroy()

		loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptjame/testloot/main/testloot.lua"))()

	else

		game.StarterGui:SetCore("SendNotification",{
			Title = "Shiba",
			Text = "Invalid Key",
			Duration = 4
		})

	end

end)
