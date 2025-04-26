local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Tolikhub"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 500, 0, 600)
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -300)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local toggleHubButton = Instance.new("TextButton")
toggleHubButton.Size = UDim2.new(0, 100, 0, 50)
toggleHubButton.Position = UDim2.new(1, -110, 0.5, -25)
toggleHubButton.Text = "Open Hub"
toggleHubButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleHubButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleHubButton.Font = Enum.Font.GothamBold
toggleHubButton.TextSize = 18
toggleHubButton.Parent = screenGui

toggleHubButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
    toggleHubButton.Text = mainFrame.Visible and "Close Hub" or "Open Hub"
end)

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
titleLabel.Text = "Tolik Hub"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 24
titleLabel.BorderSizePixel = 0
titleLabel.Parent = mainFrame

local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(0, 120, 1, -50)
tabContainer.Position = UDim2.new(0, 0, 0, 50)
tabContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
tabContainer.BorderSizePixel = 0
tabContainer.Parent = mainFrame

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Vertical
tabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
tabLayout.VerticalAlignment = Enum.VerticalAlignment.Top
tabLayout.Padding = UDim.new(0, 5)
tabLayout.Parent = tabContainer

local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -120, 1, -50)
contentFrame.Position = UDim2.new(0, 120, 0, 50)
contentFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = mainFrame

local function switchTab(tabName)
    for _, child in ipairs(contentFrame:GetChildren()) do
        if child:IsA("Frame") then
            child.Visible = child.Name == tabName
        end
    end
end

local function createTab(name)
    local tabButton = Instance.new("TextButton")
    tabButton.Size = UDim2.new(1, -10, 0, 50)
    tabButton.Text = name
    tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    tabButton.Font = Enum.Font.Gotham
    tabButton.TextSize = 20
    tabButton.BorderSizePixel = 0
    tabButton.AutoButtonColor = false
    tabButton.Parent = tabContainer

    tabButton.MouseEnter:Connect(function()
        tabButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    end)

    tabButton.MouseLeave:Connect(function()
        tabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end)

    local tabContent = Instance.new("Frame")
    tabContent.Size = UDim2.new(1, 0, 1, 0)
    tabContent.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    tabContent.Visible = false
    tabContent.Name = name
    tabContent.Parent = contentFrame

    tabButton.MouseButton1Click:Connect(function()
        switchTab(name)
        tabContent.Visible = true
    end)

    return tabContent
end

local tabNames = {
    "Информация",
    "Free admin",
    "Forsaken",
    "Wallhop practice",
    "Dead rails",
    "Tsb",
    "Break in",
    "Build a Boat",
    "Gang up", -- Добавлено
    "MM2" -- Добавлено
}

local tabs = {}
for _, name in ipairs(tabNames) do
    tabs[name] = createTab(name)
end

local infoTab = tabs["Информация"]
local infoText = {
    "by: t.me/Tolik_scripter",
    "Fixed any bugs.",
    "The best scriptHub for Tolik_prfi1234(t.me/tolik_scripter)",
    "Report all bugs in my channel"
}

for i, text in ipairs(infoText) do
    local infoLabel = Instance.new("TextLabel")
    infoLabel.Size = UDim2.new(1, -10, 0, 30)
    infoLabel.Position = UDim2.new(0, 5, 0, (i - 1) * 35 + 5)
    infoLabel.Text = text
    infoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    infoLabel.Font = Enum.Font.Gotham
    infoLabel.TextSize = 18
    infoLabel.BackgroundTransparency = 1
    infoLabel.Parent = infoTab
end

local halfScriptsLabel = Instance.new("TextLabel")
halfScriptsLabel.Size = UDim2.new(1, -10, 0, 30)
halfScriptsLabel.Position = UDim2.new(0, 5, 0, #infoText * 35 + 10)
halfScriptsLabel.Text = "Half of the scripts are not mine"
halfScriptsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
halfScriptsLabel.Font = Enum.Font.Gotham
halfScriptsLabel.TextSize = 18
halfScriptsLabel.BackgroundTransparency = 1
halfScriptsLabel.Parent = infoTab

local destroyButton = Instance.new("TextButton")
destroyButton.Size = UDim2.new(1, -10, 0, 40)
destroyButton.Position = UDim2.new(0, 5, 0, #infoText * 35 + 50)
destroyButton.Text = "Destroy GUI"
destroyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
destroyButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
destroyButton.Font = Enum.Font.Gotham
destroyButton.TextSize = 18
destroyButton.BorderSizePixel = 0
destroyButton.Parent = infoTab

destroyButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local copyLinkButton = Instance.new("TextButton")
copyLinkButton.Size = UDim2.new(1, -10, 0, 40)
copyLinkButton.Position = UDim2.new(0, 5, 0, #infoText * 35 + 100)
copyLinkButton.Text = "Copy link in my channel"
copyLinkButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyLinkButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
copyLinkButton.Font = Enum.Font.Gotham
copyLinkButton.TextSize = 18
copyLinkButton.BorderSizePixel = 0
copyLinkButton.Parent = infoTab

copyLinkButton.MouseButton1Click:Connect(function()
    setclipboard("https://t.me/Tolikhubscripts")
    copyLinkButton.Text = "Copied link!"
    task.wait(2)
    copyLinkButton.Text = "Copy link in my channel"
end)

-- Добавление кнопок в каждую вкладку кроме "Информация" и "Build a Boat"
for name, tab in pairs(tabs) do
    if name ~= "Информация" and name ~= "Build a Boat" then
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(0.8, 0, 0, 50)
        button.Position = UDim2.new(0.1, 0, 0.1, 0)
        button.Text = name .. " Script"
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        button.Font = Enum.Font.Gotham
        button.TextSize = 18
        button.Parent = tab

        button.MouseButton1Click:Connect(function()
            if name == "Free admin" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Chater72/free-admin-Op-gears/refs/heads/main/Free%20admin%20pro%20gears.lua"))()
            elseif name == "Forsaken" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/BobJunior1/ForsakenBoi/refs/heads/main/B0bbyHub"))()
            elseif name == "Wallhop practice" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Chater72/wallhop-practice-kick-all/refs/heads/main/kick%20all"))()
            elseif name == "Dead rails" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Chater72/Dead-rails-free-role/refs/heads/main/free%20role"))()
            elseif name == "Tsb" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Trashcan%20Man", true))()
            elseif name == "Break in" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Chater72/Free-roles-break-in/refs/heads/main/Break%20in%20free%20roles"))()
            elseif name == "Gang up" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Chater72/Gang-up-on-people-simulator/refs/heads/main/auto%20farm%20money"))()
            elseif name == "MM2" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Au0yX/Community/main/XhubMM2"))()
            end
            print(name .. " Button clicked!")
        end)
    end
end

-- Добавление кнопок в "Build a Boat"
local buildTab = tabs["Build a Boat"]

local buildButton1 = Instance.new("TextButton")
buildButton1.Size = UDim2.new(0.4, 0, 0, 50)
buildButton1.Position = UDim2.new(0.05, 0, 0.1, 0)
buildButton1.Text = "Auto farm"
buildButton1.TextColor3 = Color3.fromRGB(255, 255, 255)
buildButton1.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
buildButton1.Font = Enum.Font.Gotham
buildButton1.TextSize = 18
buildButton1.Parent = buildTab

buildButton1.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/TheRealAsu/BABFT/refs/heads/main/Jan25_Source.lua'))()
end)

local buildButton2 = Instance.new("TextButton")
buildButton2.Size = UDim2.new(0.4, 0, 0, 50)
buildButton2.Position = UDim2.new(0.55, 0, 0.1, 0)
buildButton2.Text = "Auto build"
buildButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
buildButton2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
buildButton2.Font = Enum.Font.Gotham
buildButton2.TextSize = 18
buildButton2.Parent = buildTab

buildButton2.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/catblox1346/StensUIReMake/refs/heads/main/Script/boatbuilderhub_B1",true))()
end)

-- Показываем первую вкладку по умолчанию
switchTab("Информация")
