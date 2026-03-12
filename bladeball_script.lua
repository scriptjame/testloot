local correctKey = "shiba123"

local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui

local frame = Instance.new("Frame",gui)
frame.Size = UDim2.new(0,300,0,200)
frame.Position = UDim2.new(0.5,-150,0.5,-100)

local box = Instance.new("TextBox",frame)
box.Size = UDim2.new(0.8,0,0,30)
box.Position = UDim2.new(0.1,0,0.4,0)

local verify = Instance.new("TextButton",frame)
verify.Text = "Verify"
verify.Size = UDim2.new(0.5,0,0,30)
verify.Position = UDim2.new(0.25,0,0.7,0)

verify.MouseButton1Click:Connect(function()

if box.Text == correctKey then

gui:Destroy()

loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptjame/testloot/main/bladeball_script.lua"))()

end

end)
