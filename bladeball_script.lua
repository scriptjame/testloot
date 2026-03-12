-- SHIBA GET KEY GUI

local correctKey = "shiba123"
local getKeyLink = "https://loot-link.com/s?On71Kevv"

local gui = Instance.new("ScreenGui")
gui.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0,340,0,200)
frame.Position = UDim2.new(0.5,-170,0.5,-100)
frame.BackgroundColor3 = Color3.fromRGB(20,20,25)

Instance.new("UICorner",frame).CornerRadius = UDim.new(0,10)

-- TITLE
local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "Shiba"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
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
box.PlaceholderText = "Paste your key here"
box.BackgroundColor3 = Color3.fromRGB(30,30,35)
box.TextColor3 = Color3.new(1,1,1)

Instance.new("UICorner",box)

-- COPY
local copy = Instance.new("TextButton")
copy.Parent = frame
copy.Size = UDim2.new(0,30,0,30)
copy.Position = UDim2.new(0.88,0,0.38,2)
copy.Text = "📋"
copy.BackgroundTransparency = 1

copy.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard(getKeyLink)
	end
end)

-- LOOTLAB TEXT
local loot = Instance.new("TextLabel")
loot.Parent = frame
loot.Position = UDim2.new(0.1,0,0.58,0)
loot.Size = UDim2.new(0.4,0,0,20)
loot.BackgroundTransparency = 1
loot.Text = "🟣 Lootlab"
loot.Font = Enum.Font.Gotham
loot.TextSize = 14
loot.TextColor3 = Color3.fromRGB(200,200,200)

-- GET KEY
local get = Instance.new("TextButton")
get.Parent = frame
get.Size = UDim2.new(0.35,0,0,35)
get.Position = UDim2.new(0.1,0,0.72,0)
get.Text = "Get Key"
get.BackgroundColor3 = Color3.fromRGB(40,40,45)
get.TextColor3 = Color3.new(1,1,1)

Instance.new("UICorner",get)

get.MouseButton1Click:Connect(function()

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
verify.BackgroundColor3 = Color3.fromRGB(70,90,255)
verify.TextColor3 = Color3.new(1,1,1)

Instance.new("UICorner",verify)

verify.MouseButton1Click:Connect(function()

	local entered = box.Text

	if entered == correctKey then

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
