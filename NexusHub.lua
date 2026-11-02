local TS = game:GetService("TweenService")
local P = game:GetService("Players")
local LP = P.LocalPlayer 
local RunService = game:GetService("RunService")

local S = Instance.new("ScreenGui", game:GetService("CoreGui"))
S.ZIndexBehavior = Enum.ZIndexBehavior.Sibling 

local M = Instance.new("Frame", S)
M.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
M.Position = UDim2.new(0.3, 0, 0.2, 0)
M.Size = UDim2.new(0, 410, 0, 270)
M.Active = true 
M.Draggable = true 
Instance.new("UICorner", M).CornerRadius = UDim.new(0, 12)

local Stroke = Instance.new("UIStroke", M)
Stroke.Color = Color3.fromRGB(40, 40, 50)
Stroke.Thickness = 1 

local SideBar = Instance.new("Frame", M)
SideBar.BackgroundColor3 = Color3.fromRGB(10, 10, 13)
SideBar.Size = UDim2.new(0, 120, 1, 0)
Instance.new("UICorner", SideBar).CornerRadius = UDim.new(0, 12)

local SBFix = Instance.new("Frame", SideBar)
SBFix.BackgroundColor3 = Color3.fromRGB(10, 10, 13)
SBFix.BorderSizePixel = 0 
SBFix.Position = UDim2.new(0.9, 0, 0, 0)
SBFix.Size = UDim2.new(0, 15, 1, 0)

local Logo = Instance.new("TextLabel", SideBar)
Logo.BackgroundTransparency = 1 
Logo.Position = UDim2.new(0, 12, 0, 15)
Logo.Size = UDim2.new(1, -12, 0, 25)
Logo.Font = Enum.Font.GothamBold 
Logo.Text = "NEXUS HUB" 
Logo.TextColor3 = Color3.fromRGB(0, 210, 255)
Logo.TextSize = 14 
Logo.TextXAlignment = Enum.TextXAlignment.Left 

local CB = Instance.new("TextButton", M)
CB.BackgroundTransparency = 1 
CB.Position = UDim2.new(1, -35, 0, 10)
CB.Size = UDim2.new(0, 25, 0, 25)
CB.Font = Enum.Font.GothamBold 
CB.Text = "—" 
CB.TextColor3 = Color3.fromRGB(150, 150, 150)
CB.TextSize = 14 

local ModeText = Instance.new("TextLabel", M)
ModeText.BackgroundTransparency = 1 
ModeText.Position = UDim2.new(0, 140, 0, 15)
ModeText.Size = UDim2.new(0, 200, 0, 25)
ModeText.Font = Enum.Font.GothamSemibold 
ModeText.Text = "The Button • Premium UI" 
ModeText.TextColor3 = Color3.fromRGB(200, 200, 200)
ModeText.TextSize = 12 
ModeText.TextXAlignment = Enum.TextXAlignment.Left 

local O = Instance.new("TextButton", S)
O.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
O.Position = UDim2.new(0.02, 0, 0.2, 0)
O.Size = UDim2.new(0, 0, 0, 0)
O.Font = Enum.Font.GothamBold 
O.Text = "N" 
O.TextColor3 = Color3.fromRGB(0, 210, 255)
O.TextSize = 16 
O.Active = true 
O.Draggable = true 
Instance.new("UICorner", O).CornerRadius = UDim.new(0, 25)

local OS = Instance.new("UIStroke", O)
OS.Color = Color3.fromRGB(0, 210, 255)
OS.Thickness = 1 
local MobileFlyFrame = Instance.new("ScreenGui", game:GetService("CoreGui"))
local FlyUp = Instance.new("TextButton", MobileFlyFrame)
local FlyDown = Instance.new("TextButton", MobileFlyFrame)
Instance.new("UICorner", FlyUp).CornerRadius = UDim.new(0, 8)
Instance.new("UICorner", FlyDown).CornerRadius = UDim.new(0, 8)

local function SetupMobileButton(btn, text, pos)
    btn.Size = UDim2.new(0, 65, 0, 50)
    btn.Position = pos 
    btn.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    btn.BackgroundTransparency = 0.3 
    btn.Font = Enum.Font.GothamBold 
    btn.Text = text 
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 13 
    btn.Visible = false 
    Instance.new("UIStroke", btn).Color = Color3.fromRGB(50, 50, 60)
end 
SetupMobileButton(FlyUp, "ВВЕРХ", UDim2.new(0.85, 0, 0.45, 0))
SetupMobileButton(FlyDown, "ВНИЗ", UDim2.new(0.85, 0, 0.56, 0))

local Tabs = {
    PLAYER = Instance.new("ScrollingFrame", M),
    COMBAT = Instance.new("ScrollingFrame", M),
    MAIN = Instance.new("ScrollingFrame", M),
    SETTING = Instance.new("ScrollingFrame", M)
}
local TabButtons = {}
local currentTab = "PLAYER"

local function StyleTabContainer(f)
    f.BackgroundTransparency = 1 
    f.Position = UDim2.new(0, 140, 0, 50)
    f.Size = UDim2.new(1, -150, 1, -65)
    f.CanvasSize = UDim2.new(0, 0, 0, 0)
    f.AutomaticCanvasSize = Enum.AutomaticCanvasSize.Y 
    f.ScrollBarThickness = 3 
    f.ScrollBarImageColor3 = Color3.fromRGB(0, 210, 255)
    f.Visible = false 
    local l = Instance.new("UIListLayout", f)
    l.SortOrder = Enum.SortOrder.LayoutOrder 
    l.Padding = UDim.new(0, 6)
end 

for name, frame in pairs(Tabs) do 
    StyleTabContainer(frame)
end 
Tabs.PLAYER.Visible = true 

local function CreateTabSelector(name, yPos)
    local btn = Instance.new("TextButton", SideBar)
    btn.BackgroundTransparency = 1 
    btn.Position = UDim2.new(0, 12, 0, yPos)
    btn.Size = UDim2.new(1, -12, 0, 30)
    btn.Font = Enum.Font.GothamBold 
    btn.Text = name 
    btn.TextColor3 = name == "PLAYER" and Color3.fromRGB(0, 210, 255) or Color3.fromRGB(120, 120, 130)
    btn.TextSize = 12 
    btn.TextXAlignment = Enum.TextXAlignment.Left 
    btn.MouseButton1Click:Connect(function()
        Tabs[currentTab].Visible = false 
        TabButtons[currentTab].TextColor3 = Color3.fromRGB(120, 120, 130)
        currentTab = name 
        Tabs[currentTab].Visible = true 
        btn.TextColor3 = Color3.fromRGB(0, 210, 255)
    end)
    TabButtons[name] = btn 
end 

CreateTabSelector("PLAYER", 55)
CreateTabSelector("COMBAT", 90)
CreateTabSelector("MAIN", 125)
CreateTabSelector("SETTING", 160)

local function AddToggle(tabName, text, callback)
    local f = Instance.new("Frame", Tabs[tabName])
    f.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
    f.Size = UDim2.new(1, -5, 0, 38)
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 6)
    
    local label = Instance.new("TextLabel", f)
    label.BackgroundTransparency = 1 
    label.Position = UDim2.new(0, 10, 0, 0)
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Font = Enum.Font.GothamSemibold 
    label.Text = text 
    label.TextColor3 = Color3.fromRGB(180, 180, 180)
    label.TextSize = 11 
    label.TextXAlignment = Enum.TextXAlignment.Left 
    
    local btn = Instance.new("TextButton", f)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
    btn.Position = UDim2.new(0.75, 0, 0.2, 0)
    btn.Size = UDim2.new(0, 45, 0, 22)
    btn.Font = Enum.Font.GothamBold 
    btn.Text = "OFF" 
    btn.TextColor3 = Color3.fromRGB(150, 150, 150)
    btn.TextSize = 10 
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
    
    local act = false 
    btn.MouseButton1Click:Connect(function()
        act = not act 
        callback(act)
        btn.BackgroundColor3 = act and Color3.fromRGB(0, 150, 100) or Color3.fromRGB(35, 35, 40)
        btn.TextColor3 = act and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(150, 150, 150)
        btn.Text = act and "ON" or "OFF" 
    end)
end 

local function AddSliderLike(tabName, text, defaultVal, callback)
    local frame = Instance.new("Frame", Tabs[tabName])
    frame.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
    frame.Size = UDim2.new(1, -5, 0, 38)
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)
    
    local label = Instance.new("TextLabel", frame)
    label.BackgroundTransparency = 1 
    label.Position = UDim2.new(0, 10, 0, 0)
    label.Size = UDim2.new(0.6, 0, 1, 0)
    label.Font = Enum.Font.GothamSemibold 
    label.Text = text 
    label.TextColor3 = Color3.fromRGB(180, 180, 180)
    label.TextSize = 11 
    label.TextXAlignment = Enum.TextXAlignment.Left 
    
    local box = Instance.new("TextBox", frame)
    box.BackgroundColor3 = Color3.fromRGB(32, 32, 40)
    box.Position = UDim2.new(0.75, 0, 0.2, 0)
    box.Size = UDim2.new(0, 45, 0, 22)
    box.Font = Enum.Font.GothamBold 
    box.Text = tostring(defaultVal)
    box.TextColor3 = Color3.fromRGB(0, 210, 255)
    box.TextSize = 11 
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 4)
    
    box.FocusLost:Connect(function()
        local val = tonumber(box.Text)
        if val then callback(val) else box.Text = tostring(defaultVal) end
    end)
end 
local cSpeed = 16 
local speedLoop = false 
AddToggle("PLAYER", "Toggle Speed", function(state) speedLoop = state end)
AddSliderLike("PLAYER", "Speed Value", 60, function(v) cSpeed = v end)

RunService.RenderStepped:Connect(function()
    if speedLoop and LP.Character and LP.Character:FindFirstChild("Humanoid") then 
        LP.Character.Humanoid.WalkSpeed = cSpeed 
    elseif not speedLoop and LP.Character and LP.Character:FindFirstChild("Humanoid") then 
        if LP.Character.Humanoid.WalkSpeed == cSpeed then LP.Character.Humanoid.WalkSpeed = 16 end 
    end 
end)

local cJump = 50 
local jumpActive = false 
AddToggle("PLAYER", "Toggle Jump", function(state) 
    jumpActive = state 
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.JumpPower = state and cJump or 50 end 
end)
AddSliderLike("PLAYER", "Jump Value", 120, function(v) 
    cJump = v 
    if jumpActive and LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.JumpPower = cJump end 
end)

LP.CharacterAdded:Connect(function(char)
    wait(1)
    if jumpActive and char:FindFirstChild("Humanoid") then char.Humanoid.JumpPower = cJump end 
end)

local flying = false 
local flySpeed = 45 
local fUp, fDown = false, false 
FlyUp.MouseButton1Down:Connect(function() fUp = true end)
FlyUp.MouseButton1Up:Connect(function() fUp = false end)
FlyDown.MouseButton1Down:Connect(function() fDown = true end)
FlyDown.MouseButton1Up:Connect(function() fDown = false end)

AddToggle("PLAYER", "Toggle Fly (iPhone)", function(state)
    flying = state 
    FlyUp.Visible = state 
    FlyDown.Visible = state 
    local torso = LP.Character:FindFirstChild("HumanoidRootPart")
    if not torso or not state then 
        if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.PlatformStand = false end 
        return 
    end 
    local bg = Instance.new("BodyGyro", torso)
    bg.P = 9e4 bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) bg.cframe = torso.CFrame 
    local bv = Instance.new("BodyVelocity", torso)
    bv.velocity = Vector3.new(0, 0.1, 0) bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
    
    coroutine.wrap(function()
        while flying and torso and torso.Parent do 
            RunService.RenderStepped:wait()
            LP.Character.Humanoid.PlatformStand = true 
            local vel = Vector3.new(0, 0, 0)
            if LP.Character.Humanoid.MoveDirection.Magnitude > 0 then vel = LP.Character.Humanoid.MoveDirection * flySpeed end 
            if fUp then vel = vel + Vector3.new(0, flySpeed, 0) end 
            if fDown then vel = vel + Vector3.new(0, -flySpeed, 0) end 
            bv.velocity = vel 
            bg.cframe = workspace.CurrentCamera.CoordinateFrame 
        end 
        bg:Destroy()
        bv:Destroy()
        if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.PlatformStand = false end 
    end)()
end)
AddSliderLike("PLAYER", "Fly Value", 45, function(v) flySpeed = v end)

local noclip = false 
AddToggle("COMBAT", "NoClip (Wallpass)", function(state) noclip = state end)
RunService.Stepped:Connect(function()
    if noclip and LP.Character then 
        for _, part in pairs(LP.Character:GetChildren()) do 
            if part:IsA("BasePart") then part.CanCollide = false end 
        end 
    end 
end)

local itemAura = false 
AddToggle("MAIN", "Item Aura (Auto Pick)", function(state) itemAura = state end)
coroutine.wrap(function()
    while true do 
        wait(0.5)
        if itemAura and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then 
            for _, v in pairs(workspace:GetChildren()) do 
                if v:IsA("BackpackItem") or v:FindFirstChild("TouchTransmitter") then 
                    firetouchinterest(LP.Character.HumanoidRootPart, v, 0)
                    firetouchinterest(LP.Character.HumanoidRootPart, v, 1)
                end 
            end 
        end 
    end 
end)()

local fullBright = false 
AddToggle("SETTING", "Fullbright (No Shadows)", function(state) 
    fullBright = state 
    game:GetService("Lighting").Brightness = state and 4 or 2 
    game:GetService("Lighting").GlobalShadows = not state 
end)

local col = false 
CB.MouseButton1Click:Connect(function()
    if not col then 
        col = true 
        for _, f in pairs(Tabs) do f.Visible = false end 
        ModeText.Visible = false 
        CB.Visible = false 
        SideBar.Visible = false 
        local t = TS:Create(M, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 0, 0, 0), Position = M.Position + UDim2.new(0, 205, 0, 135)})
        t.Completed:Connect(function()
            M.Visible = false 
            O.Visible = true 
            TS:Create(O, TweenInfo.new(0.25, Enum.EasingStyle.Back), {Size = UDim2.new(0, 45, 0, 45)}):Play()
        end)
        t:Play()
    end 
end)

O.MouseButton1Click:Connect(function()
    if col then 
        col = false 
        local t = TS:Create(O, TweenInfo.new(0.2), {Size = UDim2.new(0, 0, 0, 0)})
        t.Completed:Connect(function()
            O.Visible = false 
            M.Visible = true 
            local t2 = TS:Create(M, TweenInfo.new(0.35, Enum.EasingStyle.Back), {Size = UDim2.new(0, 410, 0, 270), Position = M.Position - UDim2.new(0, 205, 0, 135)})
            t2.Completed:Connect(function()
                Tabs[currentTab].Visible = true 
                ModeText.Visible = true 
                CB.Visible = true 
                SideBar.Visible = true 
            end)
            t2:Play()
        end)
        t:Play()
    end 
end)
