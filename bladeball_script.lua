-- SHIBA GET KEY GUI

local getKeyLink = "https://lootdest.org/s?zY7I2x6A"

local TweenService = game:GetService("TweenService")

-- CLICK SOUND
local clickSound = Instance.new("Sound")
clickSound.SoundId = "rbxassetid://12221967"
clickSound.Volume = 1
clickSound.Parent = game:GetService("CoreGui")

-- GENERATE DAILY KEY (MATCH WEBSITE)
local charset = "abcdefghijklmnopqrstuvwxyz0123456789"
local date = os.date("!*t")

local day = date.day
local month = date.month
local year = date.year

local seed = day + (month * 50) + (year * 1000)

local dailyKey = ""

for i = 1,12 do

	local index = (seed + i * 7) % #charset
	
	if index == 0 then
		index = #charset
	end
	
	dailyKey = dailyKey .. charset:sub(index,index)

end

local gui = Instance.new("ScreenGui")
gui.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0,0,0,0)
frame.Position = UDim2.new(0.5,-170,0.5,-100)
frame.BackgroundColor3 = Color3.fromRGB(20,20,25)

Instance.new("UICorner",frame).CornerRadius = UDim.new(0,10)

-- BORDER
local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(90,100,255)
stroke.Thickness = 1
stroke.Transparency = 0.5

-- OPEN ANIMATION
TweenService:Create(
	frame,
	TweenInfo.new(0.35, Enum.EasingStyle.Quad),
	{Size = UDim2.new(0,340,0,200)}
):Play()

-- TITLE
local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "Shiba"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.new(1,1,1)

-- CLOSE
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

-- INFO
local info = Instance.new("TextLabel")
info.Parent = frame
info.Position = UDim2.new(0,0,0.2,0)
info.Size = UDim2.new(1,0,0,25)
info.BackgroundTransparency = 1
info.Text = "Enter your key to begin."
info.TextColor3 = Color3.fromRGB(180,180,180)
info.Font = Enum.Font.Gotham
info.TextSize = 14

-- KEY BOX
local box = Instance.new("TextBox")
box.Parent = frame
box.Size = UDim2.new(0.75,0,0,35)
box.Position = UDim2.new(0.12,0,0.38,0)

box.PlaceholderText = "Paste your key"
box.BackgroundColor3 = Color3.fromRGB(30,30,35)
box.TextColor3 = Color3.new(1,1,1)
box.Font = Enum.Font.GothamBold
box.TextSize = 16

box.ClearTextOnFocus = false
box.Text = ""

Instance.new("UICorner",box)

-- PASTE BUTTON
local paste = Instance.new("TextButton")
paste.Parent = frame
paste.Size = UDim2.new(0,30,0,30)
paste.Position = UDim2.new(0.88,0,0.38,2)
paste.Text = "📋"
paste.BackgroundTransparency = 1

paste.MouseButton1Click:Connect(function()

	clickSound:Play()

	if getclipboard then
		box.Text = getclipboard()
	end

end)

-- LOOTLAB TEXT
local loot = Instance.new("TextLabel")
loot.Parent = frame
loot.Position = UDim2.new(0.1,0,0.58,0)
loot.Size = UDim2.new(0.4,0,0,20)
loot.BackgroundTransparency = 1
loot.Text = "LootLabs"
loot.Font = Enum.Font.GothamBold
loot.TextSize = 15
loot.TextColor3 = Color3.fromRGB(170,120,255)

-- GET KEY BUTTON
local get = Instance.new("TextButton")
get.Parent = frame
get.Size = UDim2.new(0.35,0,0,35)
get.Position = UDim2.new(0.1,0,0.72,0)
get.Text = "Get Key"
get.BackgroundColor3 = Color3.fromRGB(40,40,45)
get.TextColor3 = Color3.new(1,1,1)

Instance.new("UICorner",get)

get.MouseButton1Click:Connect(function()

	clickSound:Play()

	if setclipboard then
		setclipboard(getKeyLink)
	end

	pcall(function()
		game.StarterGui:SetCore("SendNotification",{
			Title = "Shiba",
			Text = "Key link copied",
			Duration = 4
		})
	end)

end)

-- VERIFY BUTTON
local verify = Instance.new("TextButton")
verify.Parent = frame
verify.Size = UDim2.new(0.45,0,0,35)
verify.Position = UDim2.new(0.50,0,0.72,0)
verify.Text = "Verify Key"
verify.Font = Enum.Font.GothamBold
verify.TextSize = 15
verify.TextColor3 = Color3.new(1,1,1)
verify.BackgroundColor3 = Color3.fromRGB(70,90,255)

Instance.new("UICorner",verify)

-- VERIFY GRADIENT
local grad = Instance.new("UIGradient")
grad.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(100,130,255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(60,80,255))
}
grad.Parent = verify

verify.MouseButton1Click:Connect(function()

	clickSound:Play()

	local entered = box.Text

	if entered == dailyKey then

		gui:Destroy()

		loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptjame/testloot/main/testloot.lua"))()

	else

		pcall(function()
			game.StarterGui:SetCore("SendNotification",{
				Title = "Shiba",
				Text = "Invalid Key",
				Duration = 4
			})
		end)

	end

end)
