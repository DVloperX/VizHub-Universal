--[[
    VizHub v6.5 | Viz23 Edition
]]

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local Theme = {
    Background     = Color3.fromRGB(15, 15, 15),
    TopBarSideBar  = Color3.fromRGB(10, 10, 10),
    CardBackground = Color3.fromRGB(25, 25, 25),
    OrangeAccent   = Color3.fromRGB(255, 130, 0),
    OrangeDark     = Color3.fromRGB(40, 20, 5),
    TextWhite      = Color3.fromRGB(255, 255, 255),
    TextGray       = Color3.fromRGB(180, 180, 180),
    StrokeColor    = Color3.fromRGB(45, 45, 45),
    ToggleOn       = Color3.fromRGB(255, 130, 0),
    ToggleOff      = Color3.fromRGB(60, 60, 60),
    ErrorRed       = Color3.fromRGB(180, 40, 40),
    ErrorRedStroke = Color3.fromRGB(255, 70, 70)
}

-- ==========================================
-- INTRO
-- ==========================================
local function showIntro(callback)
    local introGui = Instance.new("ScreenGui")
    introGui.Name = "VizHubIntro"
    introGui.Parent = game.CoreGui
    introGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    introGui.IgnoreGuiInset = true

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    bg.BackgroundTransparency = 1
    bg.BorderSizePixel = 0
    bg.Parent = introGui

    local logoFrame = Instance.new("Frame")
    logoFrame.Size = UDim2.new(0, 300, 0, 120)
    logoFrame.Position = UDim2.new(0.5, -150, 0.5, -60)
    logoFrame.BackgroundTransparency = 1
    logoFrame.Parent = introGui

    local logoText = Instance.new("TextLabel")
    logoText.Size = UDim2.new(1, 0, 0, 60)
    logoText.Position = UDim2.new(0, 0, 0, 0)
    logoText.BackgroundTransparency = 1
    logoText.Text = "VizHub"
    logoText.TextColor3 = Theme.OrangeAccent
    logoText.Font = Enum.Font.GothamBold
    logoText.TextSize = 52
    logoText.TextTransparency = 1
    logoText.Parent = logoFrame

    local subText = Instance.new("TextLabel")
    subText.Size = UDim2.new(1, 0, 0, 25)
    subText.Position = UDim2.new(0, 0, 0, 65)
    subText.BackgroundTransparency = 1
    subText.Text = "Internal Script Edition | Universal Hub"
    subText.TextColor3 = Color3.fromRGB(200, 200, 200)
    subText.Font = Enum.Font.Gotham
    subText.TextSize = 16
    subText.TextTransparency = 1
    subText.Parent = logoFrame

    local lineBg = Instance.new("Frame")
    lineBg.Size = UDim2.new(0, 200, 0, 3)
    lineBg.Position = UDim2.new(0.5, -100, 0.5, 80)
    lineBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    lineBg.BorderSizePixel = 0
    lineBg.BackgroundTransparency = 1
    lineBg.Parent = logoFrame

    local lineFill = Instance.new("Frame")
    lineFill.Size = UDim2.new(0, 0, 1, 0)
    lineFill.BackgroundColor3 = Theme.OrangeAccent
    lineFill.BorderSizePixel = 0
    lineFill.Parent = lineBg

    local lc = Instance.new("UICorner"); lc.CornerRadius = UDim.new(1, 0); lc.Parent = lineBg
    local fc = Instance.new("UICorner"); fc.CornerRadius = UDim.new(1, 0); fc.Parent = lineFill

    TweenService:Create(bg, TweenInfo.new(0.5), {BackgroundTransparency = 0.3}):Play()
    task.wait(0.15)
    TweenService:Create(logoText, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
    task.wait(0.2)
    TweenService:Create(subText, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
    task.wait(0.2)
    TweenService:Create(lineBg, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
    TweenService:Create(lineFill, TweenInfo.new(1.2, Enum.EasingStyle.Quad), {Size = UDim2.new(1, 0, 1, 0)}):Play()
    task.wait(1.4)
    TweenService:Create(logoText, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
    TweenService:Create(subText, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
    TweenService:Create(lineBg, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
    TweenService:Create(bg, TweenInfo.new(0.6), {BackgroundTransparency = 1}):Play()
    task.wait(0.7)
    introGui:Destroy()
    if callback then callback() end
end

-- ==========================================
-- MAIN WINDOW
-- ==========================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VizHub | Universal"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 10
ScreenGui.Enabled = false

local MainFrame = Instance.new("CanvasGroup")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 800, 0, 560)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Theme.Background
MainFrame.BackgroundTransparency = 0
MainFrame.GroupTransparency = 1
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner"); MainCorner.CornerRadius = UDim.new(0, 10); MainCorner.Parent = MainFrame
local MainStroke = Instance.new("UIStroke"); MainStroke.Color = Theme.StrokeColor; MainStroke.Thickness = 1; MainStroke.Parent = MainFrame

local mainScale = Instance.new("UIScale")
mainScale.Scale = 0.85
mainScale.Parent = MainFrame

-- ==========================================
-- MENU OPEN / CLOSE ANIMATION
-- ==========================================
local MENU_OPEN_TIME  = 0.35
local MENU_CLOSE_TIME = 0.25
local MENU_SCALE_OPEN  = 1
local MENU_SCALE_CLOSED = 0.85

local menuOpen = false
local menuAnimating = false

local function animateMenu(open)
    if menuAnimating then return end
    if menuOpen == open then return end
    menuAnimating = true
    menuOpen = open

    ScreenGui.Enabled = true

    local tweenTime = open and MENU_OPEN_TIME or MENU_CLOSE_TIME
    local scaleEasing = open and Enum.EasingStyle.Back or Enum.EasingStyle.Quart
    local scaleDirection = open and Enum.EasingDirection.Out or Enum.EasingDirection.In

    local transTween = TweenService:Create(
        MainFrame,
        TweenInfo.new(tweenTime, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        { GroupTransparency = open and 0 or 1 }
    )
    local scaleTween = TweenService:Create(
        mainScale,
        TweenInfo.new(tweenTime, scaleEasing, scaleDirection),
        { Scale = open and MENU_SCALE_OPEN or MENU_SCALE_CLOSED }
    )

    transTween:Play()
    scaleTween:Play()

    scaleTween.Completed:Connect(function()
        menuAnimating = false
        if not menuOpen then
            ScreenGui.Enabled = false
        end
    end)
end

local function openMenu() animateMenu(true) end
local function closeMenu() animateMenu(false) end

-- ==========================================
-- TOP BAR
-- ==========================================
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.BackgroundColor3 = Theme.TopBarSideBar
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TC = Instance.new("UICorner"); TC.CornerRadius = UDim.new(0, 10); TC.Parent = TopBar

local TBC = Instance.new("Frame")
TBC.Size = UDim2.new(1, 0, 0, 10)
TBC.Position = UDim2.new(0, 0, 1, -10)
TBC.BackgroundColor3 = Theme.TopBarSideBar
TBC.BorderSizePixel = 0
TBC.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Position = UDim2.new(0, 20, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "VizHub | Universal"
Title.TextColor3 = Theme.OrangeAccent
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 45, 1, 0)
CloseBtn.Position = UDim2.new(1, -45, 0, 0)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Theme.OrangeAccent
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16
CloseBtn.Parent = TopBar
CloseBtn.MouseButton1Click:Connect(function() closeMenu() end)

local SideBar = Instance.new("Frame")
SideBar.Size = UDim2.new(0, 170, 1, -45)
SideBar.Position = UDim2.new(0, 0, 0, 45)
SideBar.BackgroundColor3 = Theme.TopBarSideBar
SideBar.BorderSizePixel = 0
SideBar.Parent = MainFrame

local ContentFrame = Instance.new("ScrollingFrame")
ContentFrame.Size = UDim2.new(1, -190, 1, -75)
ContentFrame.Position = UDim2.new(0, 180, 0, 60)
ContentFrame.BackgroundTransparency = 1
ContentFrame.BorderSizePixel = 0
ContentFrame.ScrollBarThickness = 5
ContentFrame.ScrollBarImageColor3 = Theme.OrangeAccent
ContentFrame.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = ContentFrame

-- ==========================================
-- UI HELPERS
-- ==========================================
local function clearContent()
    for _, child in ipairs(ContentFrame:GetChildren()) do
        if child:IsA("Frame") or child:IsA("TextButton") or child:IsA("TextLabel") then
            child:Destroy()
        end
    end
end

local function createCard(titleText, descText, order, isOrangeTitle)
    local Card = Instance.new("Frame")
    Card.Size = UDim2.new(1, -10, 0, 70)
    Card.BackgroundColor3 = Theme.CardBackground
    Card.BorderSizePixel = 0
    Card.LayoutOrder = order
    Card.Parent = ContentFrame

    local c = Instance.new("UICorner"); c.CornerRadius = UDim.new(0, 6); c.Parent = Card
    local s = Instance.new("UIStroke"); s.Color = Theme.StrokeColor; s.Thickness = 1; s.Parent = Card

    local TL = Instance.new("TextLabel")
    TL.Size = UDim2.new(1, -20, 0, 25)
    TL.Position = UDim2.new(0, 10, 0, 5)
    TL.BackgroundTransparency = 1
    TL.Text = titleText
    TL.TextColor3 = isOrangeTitle and Theme.OrangeAccent or Theme.TextWhite
    TL.Font = Enum.Font.GothamMedium
    TL.TextSize = 15
    TL.TextXAlignment = Enum.TextXAlignment.Left
    TL.Parent = Card

    local DL = Instance.new("TextLabel")
    DL.Size = UDim2.new(1, -20, 0, 35)
    DL.Position = UDim2.new(0, 10, 0, 32)
    DL.BackgroundTransparency = 1
    DL.Text = descText
    DL.TextColor3 = Theme.TextGray
    DL.Font = Enum.Font.Gotham
    DL.TextSize = 12
    DL.TextXAlignment = Enum.TextXAlignment.Left
    DL.TextYAlignment = Enum.TextYAlignment.Top
    DL.TextWrapped = true
    DL.Parent = Card
    return Card
end

local function createSectionLabel(text, order)
    local SL = Instance.new("TextLabel")
    SL.Size = UDim2.new(1, 0, 0, 22)
    SL.BackgroundTransparency = 1
    SL.Text = text
    SL.TextColor3 = Theme.TextWhite
    SL.Font = Enum.Font.GothamBold
    SL.TextSize = 14
    SL.TextXAlignment = Enum.TextXAlignment.Left
    SL.LayoutOrder = order
    SL.Parent = ContentFrame
    return SL
end

local function flashError(btn, stroke)
    local oc = btn.BackgroundColor3
    local osc = stroke.Color
    local ost = stroke.Thickness
    btn.BackgroundColor3 = Theme.ErrorRed
    stroke.Color = Theme.ErrorRedStroke
    stroke.Thickness = 2
    task.delay(1.5, function()
        if btn and btn.Parent then
            TweenService:Create(btn, TweenInfo.new(0.3), {BackgroundColor3 = oc}):Play()
            TweenService:Create(stroke, TweenInfo.new(0.3), {Color = osc, Thickness = ost}):Play()
        end
    end)
end

local function createScriptButton(name, order, callback)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -10, 0, 42)
    Btn.BackgroundColor3 = Theme.CardBackground
    Btn.BorderSizePixel = 0
    Btn.Text = "  " .. name
    Btn.TextColor3 = Theme.TextWhite
    Btn.Font = Enum.Font.GothamMedium
    Btn.TextSize = 13
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Btn.LayoutOrder = order
    Btn.Parent = ContentFrame

    local c = Instance.new("UICorner"); c.CornerRadius = UDim.new(0, 6); c.Parent = Btn
    local s = Instance.new("UIStroke"); s.Color = Theme.StrokeColor; s.Thickness = 1; s.Parent = Btn

    Btn.MouseButton1Click:Connect(function()
        if callback then callback(function(success) if not success then flashError(Btn, s) end end) end
    end)
    return Btn
end

local function createToggleButton(name, order, initialState, onToggle)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -10, 0, 42)
    Btn.BackgroundColor3 = Theme.CardBackground
    Btn.BorderSizePixel = 0
    Btn.Text = "  " .. name
    Btn.TextColor3 = Theme.TextWhite
    Btn.Font = Enum.Font.GothamMedium
    Btn.TextSize = 13
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Btn.LayoutOrder = order
    Btn.Parent = ContentFrame

    local c = Instance.new("UICorner"); c.CornerRadius = UDim.new(0, 6); c.Parent = Btn
    local s = Instance.new("UIStroke"); s.Color = Theme.StrokeColor; s.Thickness = 1; s.Parent = Btn

    local TO = Instance.new("Frame")
    TO.Size = UDim2.new(0, 36, 0, 20)
    TO.Position = UDim2.new(1, -46, 0.5, -10)
    TO.BackgroundColor3 = initialState and Theme.ToggleOn or Theme.ToggleOff
    TO.BorderSizePixel = 0
    TO.Parent = Btn

    local tc = Instance.new("UICorner"); tc.CornerRadius = UDim.new(1, 0); tc.Parent = TO

    local TD = Instance.new("Frame")
    TD.Size = UDim2.new(0, 16, 0, 16)
    TD.Position = initialState and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
    TD.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TD.BorderSizePixel = 0
    TD.Parent = TO

    local dc = Instance.new("UICorner"); dc.CornerRadius = UDim.new(1, 0); dc.Parent = TD

    local state = initialState
    Btn.MouseButton1Click:Connect(function()
        state = not state
        TO.BackgroundColor3 = state and Theme.ToggleOn or Theme.ToggleOff
        TweenService:Create(TD, TweenInfo.new(0.15), {
            Position = state and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
        }):Play()
        if onToggle then onToggle(state) end
    end)
    return Btn
end

local function createTextInputButton(name, order, defaultValue, onInput)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -10, 0, 42)
    Btn.BackgroundColor3 = Theme.CardBackground
    Btn.BorderSizePixel = 0
    Btn.Text = ""
    Btn.LayoutOrder = order
    Btn.Parent = ContentFrame

    local c = Instance.new("UICorner"); c.CornerRadius = UDim.new(0, 6); c.Parent = Btn
    local s = Instance.new("UIStroke"); s.Color = Theme.StrokeColor; s.Thickness = 1; s.Parent = Btn

    local L = Instance.new("TextLabel")
    L.Size = UDim2.new(0.6, 0, 1, 0)
    L.Position = UDim2.new(0, 10, 0, 0)
    L.BackgroundTransparency = 1
    L.Text = name
    L.TextColor3 = Theme.TextWhite
    L.Font = Enum.Font.GothamMedium
    L.TextSize = 13
    L.TextXAlignment = Enum.TextXAlignment.Left
    L.Parent = Btn

    local IB = Instance.new("TextBox")
    IB.Size = UDim2.new(0, 60, 0, 26)
    IB.Position = UDim2.new(1, -75, 0.5, -13)
    IB.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    IB.BorderSizePixel = 0
    IB.Text = tostring(defaultValue)
    IB.TextColor3 = Theme.OrangeAccent
    IB.Font = Enum.Font.GothamBold
    IB.TextSize = 12
    IB.Parent = Btn

    local ic = Instance.new("UICorner"); ic.CornerRadius = UDim.new(0, 4); ic.Parent = IB
    local is = Instance.new("UIStroke"); is.Color = Theme.StrokeColor; is.Thickness = 1; is.Parent = IB

    IB.FocusLost:Connect(function()
        if onInput then onInput(IB.Text) end
    end)
    return Btn
end

-- ==========================================
-- SLIDER
-- ==========================================
local function createSlider(name, order, minVal, maxVal, defaultValue, isFloat, onChanged)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, -10, 0, 52)
    row.BackgroundColor3 = Theme.CardBackground
    row.BorderSizePixel = 0
    row.LayoutOrder = order
    row.Parent = ContentFrame

    local rc = Instance.new("UICorner"); rc.CornerRadius = UDim.new(0, 6); rc.Parent = row
    local rs = Instance.new("UIStroke"); rs.Color = Theme.StrokeColor; rs.Thickness = 1; rs.Parent = row

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.6, 0, 0, 20)
    Label.Position = UDim2.new(0, 12, 0, 4)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = Theme.TextWhite
    Label.Font = Enum.Font.GothamMedium
    Label.TextSize = 13
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = row

    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Size = UDim2.new(0, 70, 0, 20)
    ValueLabel.Position = UDim2.new(1, -82, 0, 4)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Text = isFloat and string.format("%.2f", defaultValue) or tostring(defaultValue)
    ValueLabel.TextColor3 = Theme.OrangeAccent
    ValueLabel.Font = Enum.Font.GothamBold
    ValueLabel.TextSize = 12
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
    ValueLabel.Parent = row

    local SliderBg = Instance.new("Frame")
    SliderBg.Size = UDim2.new(1, -24, 0, 8)
    SliderBg.Position = UDim2.new(0, 12, 0, 32)
    SliderBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    SliderBg.BorderSizePixel = 0
    SliderBg.Parent = row

    local sbc = Instance.new("UICorner"); sbc.CornerRadius = UDim.new(1, 0); sbc.Parent = SliderBg

    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new(0, 0, 1, 0)
    Fill.BackgroundColor3 = Theme.OrangeAccent
    Fill.BorderSizePixel = 0
    Fill.Parent = SliderBg

    local fc = Instance.new("UICorner"); fc.CornerRadius = UDim.new(1, 0); fc.Parent = Fill

    local Dot = Instance.new("Frame")
    Dot.Size = UDim2.new(0, 16, 0, 16)
    Dot.Position = UDim2.new(0, -8, 0.5, -8)
    Dot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Dot.BorderSizePixel = 0
    Dot.ZIndex = 2
    Dot.Parent = SliderBg

    local dc = Instance.new("UICorner"); dc.CornerRadius = UDim.new(1, 0); dc.Parent = Dot

    local ClickArea = Instance.new("TextButton")
    ClickArea.Size = UDim2.new(1, -24, 0, 22)
    ClickArea.Position = UDim2.new(0, 12, 0, 26)
    ClickArea.BackgroundTransparency = 1
    ClickArea.Text = ""
    ClickArea.ZIndex = 3
    ClickArea.Parent = row

    local function updateSliderFromX(xPos)
        local relX = math.clamp(xPos - SliderBg.AbsolutePosition.X, 0, SliderBg.AbsoluteSize.X)
        local alpha = relX / SliderBg.AbsoluteSize.X
        local value = minVal + (maxVal - minVal) * alpha
        if not isFloat then value = math.floor(value + 0.5) end
        ValueLabel.Text = isFloat and string.format("%.2f", value) or tostring(value)
        Fill.Size = UDim2.new(alpha, 0, 1, 0)
        Dot.Position = UDim2.new(alpha, -8, 0.5, -8)
        if onChanged then onChanged(value) end
    end

    local initAlpha = (defaultValue - minVal) / (maxVal - minVal)
    Fill.Size = UDim2.new(initAlpha, 0, 1, 0)
    Dot.Position = UDim2.new(initAlpha, -8, 0.5, -8)

    local draggingSlider = false

    ClickArea.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingSlider = true
            updateSliderFromX(input.Position.X)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if draggingSlider and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateSliderFromX(input.Position.X)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingSlider = false
        end
    end)

    return row
end

-- ==========================================
-- GLOBAL STATES
-- ==========================================
local freeCamActive = false
local freeCamConnection = nil
local instantPromptActive = false
local instantPromptConn = nil
local desyncActive = false
local desyncConnection = nil
local fovEnabled = false
local fovValue = 137
local fovConnection = nil
local antiAfkEnabled = false
local antiAfkConnection = nil
local statsGui = nil
local statsConn = nil

local walkSpeedEnabled = false
local walkSpeedValue = 16
local jumpPowerEnabled = false
local jumpPowerValue = 50
local invisibleEnabled = false
local invisibleConnection = nil
local invisibleOriginalStates = {}
local DEFAULT_WALK = 16
local DEFAULT_JUMP = 50

-- Graphics
local fullBrightActive = false
local fullBrightConn = nil
local fbBrightness = 3
local fbClockTime = 14
local fbAmbient = 200
local fbShadows = false
local fbFogEnd = 1000

local fpsBoostActive = false
local fpsBoostRemoveParticles = true
local fpsBoostRemoveTextures = false
local fpsBoostLowerQuality = true
local fpsBoostOriginalStates = {
    lighting = {},
    quality = nil,
    particles = {},
    textures = {}
}

-- Click TP
local clickTpActive = false
local clickTpConnection = nil
local clickTpOffsetY = 3

-- Respawn Here
local respawnHereEnabled = false
local respawnHereConnection = nil
local deathPosition = nil
local deathConn = nil

-- Invisible
local INV_CONFIG = {
    INVISIBILITY_POSITION = Vector3.new(-25.95, 84, 3537.55),
    INVIS_TRANSPARENCY = 0.5,
    VOID_Y_THRESHOLD = -50,
    CHAIR_NAME = "VizHubInvisChair",
}
local invisChair = nil
local hpLockConn = nil
local storedMaxHealth = nil

-- Godmode
local godmodeEnabled = false
local godmodeConn = nil
local godmodeHealthConn = nil
local godmodeDiedConn = nil
local godmodeOriginalMaxHealth = nil
local godmodeOriginalTouchStates = {}
local GODMODE_MAX_HEALTH = 1e9

-- Regeneration
local regenEnabled = false
local regenRate = 10
local regenConn = nil

-- Aspect Ratio
local aspectRatioEnabled = false
local aspectRatioValue = 1.7777777
local aspectRatioGui = nil
local aspectRatioTop = nil
local aspectRatioBottom = nil
local aspectRatioConn = nil

-- Menu Keybind
local menuKeybindActive = false
local menuKeybindKey = Enum.KeyCode.RightShift
local menuKeybindConn = nil
local rebindingKey = false

if LocalPlayer.Character then
    local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        if hum.WalkSpeed > 0 then DEFAULT_WALK = hum.WalkSpeed end
        if hum.JumpPower and hum.JumpPower > 0 then DEFAULT_JUMP = hum.JumpPower end
    end
end

local infJumpActive = false
local infJumpConnection = nil
local noclipActive = false
local noclipConnection = nil

local espPlayersActive = false
local espNpcActive = false
local espShowHealth = true
local espShowNames = false
local espHighlights = {}
local espBillboards = {}
local espLoop = nil

local flyActive = false
local flyConnection = nil
local flyBodyVelocity = nil
local flyBodyGyro = nil

local followConnection = nil
local followTarget = nil
local spectateTarget = nil
local spectateConnection = nil

local originalLighting = {
    Ambient = Lighting.Ambient,
    Brightness = Lighting.Brightness,
    GlobalShadows = Lighting.GlobalShadows,
    FogEnd = Lighting.FogEnd,
    ClockTime = Lighting.ClockTime,
}

-- ==========================================
-- INVISIBLE HELPERS
-- ==========================================
local function captureOriginalStates(char)
    if not char then return end
    for _, obj in ipairs(char:GetDescendants()) do
        if obj:IsA("BasePart") then
            if invisibleOriginalStates[obj] == nil then
                invisibleOriginalStates[obj] = {
                    Transparency = obj.Transparency,
                    CanCollide   = obj.CanCollide,
                    CanTouch     = obj.CanTouch,
                    CanQuery     = obj.CanQuery
                }
            end
        elseif obj:IsA("Decal") then
            if invisibleOriginalStates[obj] == nil then
                invisibleOriginalStates[obj] = { Transparency = obj.Transparency }
            end
        end
    end
end

local function restoreAllStates(char)
    if not char then return end
    for _, obj in ipairs(char:GetDescendants()) do
        if obj:IsA("BasePart") then
            local orig = invisibleOriginalStates[obj]
            if orig then
                obj.Transparency = orig.Transparency
                obj.CanCollide = orig.CanCollide
                obj.CanTouch = orig.CanTouch
                obj.CanQuery = orig.CanQuery
            else
                obj.Transparency = (obj.Name == "HumanoidRootPart") and 1 or 0
                obj.CanCollide = true
                obj.CanTouch = true
                obj.CanQuery = true
            end
        elseif obj:IsA("Decal") then
            local orig = invisibleOriginalStates[obj]
            if orig then
                obj.Transparency = orig.Transparency
            else
                obj.Transparency = 0
            end
        end
    end
    invisibleOriginalStates = {}
end

local function setCharacterTransparency(transparency)
    local char = LocalPlayer.Character
    if not char then return end
    for _, obj in ipairs(char:GetDescendants()) do
        if obj:IsA("BasePart") or obj:IsA("Decal") then
            local orig = invisibleOriginalStates[obj]
            if orig and orig.Transparency >= 1 then
                obj.Transparency = 1
            else
                obj.Transparency = transparency
            end
        end
    end
end

local function destroyInvisChair()
    if invisChair and invisChair.Parent then
        pcall(function() invisChair:Destroy() end)
    end
    invisChair = nil
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name == INV_CONFIG.CHAIR_NAME then
            pcall(function() obj:Destroy() end)
        end
    end
end

local function applyCollisionProtection(char)
    if not char then return end
    for _, obj in ipairs(char:GetDescendants()) do
        if obj:IsA("BasePart") then
            obj.CanCollide = false
            obj.CanTouch   = false
            obj.CanQuery   = false
        end
    end
end

local function applyHealthLock(char)
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    if storedMaxHealth == nil then storedMaxHealth = hum.MaxHealth end
    if hpLockConn then hpLockConn:Disconnect(); hpLockConn = nil end
    hpLockConn = hum.HealthChanged:Connect(function(newHealth)
        if not invisibleEnabled then return end
        if hum and hum.Parent and newHealth < hum.MaxHealth then
            hum.Health = hum.MaxHealth
        end
    end)
end

local function removeHealthLock()
    if hpLockConn then hpLockConn:Disconnect(); hpLockConn = nil end
end

local function hideNameAndHealth(char)
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.NameDisplayDistance = 0
        hum.HealthDisplayDistance = 0
    end
end

local function restoreNameAndHealth(char)
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.NameDisplayDistance = 100
        hum.HealthDisplayDistance = 100
    end
end

-- ==========================================
-- GODMODE HELPERS
-- ==========================================
local function applyGodmode(char)
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end

    if godmodeOriginalMaxHealth == nil then
        godmodeOriginalMaxHealth = hum.MaxHealth
    end

    -- Set huge HP
    pcall(function()
        hum.MaxHealth = GODMODE_MAX_HEALTH
        hum.Health = GODMODE_MAX_HEALTH
    end)
    pcall(function() hum.BreakJointsOnDeath = false end)
    pcall(function() hum.RequiresNeck = false end)

    -- Disable deadly states
    pcall(function()
        hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
    end)

    -- Disable touch/query on all parts
    for _, obj in ipairs(char:GetDescendants()) do
        if obj:IsA("BasePart") then
            if godmodeOriginalTouchStates[obj] == nil then
                godmodeOriginalTouchStates[obj] = {
                    CanTouch = obj.CanTouch,
                    CanQuery = obj.CanQuery
                }
            end
            obj.CanTouch = false
            obj.CanQuery = false
        end
    end

    -- Health lock listener
    if godmodeHealthConn then godmodeHealthConn:Disconnect() end
    godmodeHealthConn = hum.HealthChanged:Connect(function(newHealth)
        if not godmodeEnabled then return end
        if hum and hum.Parent and newHealth < hum.MaxHealth then
            hum.Health = hum.MaxHealth
        end
    end)

    -- Died listener — revive on death
    if godmodeDiedConn then godmodeDiedConn:Disconnect() end
    godmodeDiedConn = hum.Died:Connect(function()
        if not godmodeEnabled then return end
        pcall(function()
            hum.Health = hum.MaxHealth
        end)
    end)
end

local function startGodmodeLoop()
    if godmodeConn then godmodeConn:Disconnect(); godmodeConn = nil end
    godmodeConn = RunService.Heartbeat:Connect(function()
        if not godmodeEnabled then return end
        local char = LocalPlayer.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hum then return end

        -- Lock health every frame
        if hum.Health < hum.MaxHealth then
            pcall(function() hum.Health = hum.MaxHealth end)
        end

        -- Keep protections applied
        for _, obj in ipairs(char:GetDescendants()) do
            if obj:IsA("BasePart") then
                if obj.CanTouch or obj.CanQuery then
                    obj.CanTouch = false
                    obj.CanQuery = false
                end
            end
        end
    end)
end

local function removeGodmode(char)
    if godmodeConn then godmodeConn:Disconnect(); godmodeConn = nil end
    if godmodeHealthConn then godmodeHealthConn:Disconnect(); godmodeHealthConn = nil end
    if godmodeDiedConn then godmodeDiedConn:Disconnect(); godmodeDiedConn = nil end

    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum and godmodeOriginalMaxHealth then
        pcall(function()
            hum.MaxHealth = godmodeOriginalMaxHealth
            if hum.Health > godmodeOriginalMaxHealth then
                hum.Health = godmodeOriginalMaxHealth
            end
        end)
    end

    -- Restore CanTouch/CanQuery
    for obj, orig in pairs(godmodeOriginalTouchStates) do
        if obj and obj.Parent then
            obj.CanTouch = orig.CanTouch
            obj.CanQuery = orig.CanQuery
        end
    end
    godmodeOriginalTouchStates = {}
    godmodeOriginalMaxHealth = nil
end

-- ==========================================
-- REGENERATION HELPERS
-- ==========================================
local function startRegenLoop()
    if regenConn then regenConn:Disconnect(); regenConn = nil end
    regenConn = RunService.Heartbeat:Connect(function(dt)
        if not regenEnabled then return end
        local char = LocalPlayer.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hum then return end
        if hum.Health > 0 and hum.Health < hum.MaxHealth then
            hum.Health = math.min(hum.MaxHealth, hum.Health + regenRate * dt)
        end
    end)
end

local function stopRegenLoop()
    if regenConn then regenConn:Disconnect(); regenConn = nil end
end

-- ==========================================
-- ASPECT RATIO HELPERS
-- ==========================================
local function ensureAspectRatioGui()
    if aspectRatioGui and aspectRatioGui.Parent then return end

    aspectRatioGui = Instance.new("ScreenGui")
    aspectRatioGui.Name = "VizAspectRatio"
    aspectRatioGui.Parent = game.CoreGui
    aspectRatioGui.IgnoreGuiInset = true
    aspectRatioGui.DisplayOrder = 5
    aspectRatioGui.ResetOnSpawn = false
    aspectRatioGui.Enabled = false

    aspectRatioTop = Instance.new("Frame")
    aspectRatioTop.BackgroundColor3 = Color3.new(0, 0, 0)
    aspectRatioTop.BorderSizePixel = 0
    aspectRatioTop.Position = UDim2.new(0, 0, 0, 0)
    aspectRatioTop.Size = UDim2.new(1, 0, 0, 0)
    aspectRatioTop.Parent = aspectRatioGui

    aspectRatioBottom = Instance.new("Frame")
    aspectRatioBottom.BackgroundColor3 = Color3.new(0, 0, 0)
    aspectRatioBottom.BorderSizePixel = 0
    aspectRatioBottom.Size = UDim2.new(1, 0, 0, 0)
    aspectRatioBottom.Parent = aspectRatioGui
end

local function updateAspectRatio()
    if not aspectRatioGui then return end
    local viewport = Camera.ViewportSize
    if not viewport or viewport.X <= 0 or viewport.Y <= 0 then return end

    local targetWidth = viewport.Y * aspectRatioValue
    local barSize = math.max(0, (viewport.X - targetWidth) / 2)

    aspectRatioTop.Size = UDim2.new(0, viewport.X, 0, barSize)
    aspectRatioBottom.Size = UDim2.new(0, viewport.X, 0, barSize)
    aspectRatioBottom.Position = UDim2.new(0, 0, 1, -barSize)

    aspectRatioGui.Enabled = aspectRatioEnabled
end

local function startAspectRatioLoop()
    if aspectRatioConn then aspectRatioConn:Disconnect(); aspectRatioConn = nil end
    aspectRatioConn = RunService.RenderStepped:Connect(function()
        if not aspectRatioEnabled then return end
        updateAspectRatio()
    end)
end

local function stopAspectRatioLoop()
    if aspectRatioConn then aspectRatioConn:Disconnect(); aspectRatioConn = nil end
end

local function destroyAspectRatioGui()
    if aspectRatioGui then aspectRatioGui:Destroy(); aspectRatioGui = nil end
    aspectRatioTop = nil
    aspectRatioBottom = nil
end

-- ==========================================
-- GRAPHICS HELPERS
-- ==========================================
local function applyFullBright()
    Lighting.Ambient = Color3.fromRGB(fbAmbient, fbAmbient, fbAmbient)
    Lighting.Brightness = fbBrightness
    Lighting.FogEnd = fbFogEnd
    Lighting.GlobalShadows = fbShadows
    if fullBrightConn then fullBrightConn:Disconnect(); fullBrightConn = nil end
    fullBrightConn = RunService.RenderStepped:Connect(function()
        if not fullBrightActive then return end
        Lighting.ClockTime = fbClockTime
        Lighting.Ambient = Color3.fromRGB(fbAmbient, fbAmbient, fbAmbient)
        Lighting.Brightness = fbBrightness
        Lighting.FogEnd = fbFogEnd
        Lighting.GlobalShadows = fbShadows
    end)
end

local function applyFpsBoost()
    if fpsBoostLowerQuality and settings then
        pcall(function()
            fpsBoostOriginalStates.quality = settings().Rendering.QualityLevel
        end)
    end

    if fpsBoostLowerQuality then
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        end)
    end

    for _, v in ipairs(Lighting:GetChildren()) do
        if v:IsA("PostEffect") or v:IsA("Atmosphere") then
            fpsBoostOriginalStates.lighting[v] = v.Enabled
            v.Enabled = false
        end
    end

    if fpsBoostRemoveParticles then
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
                if v.Enabled then
                    fpsBoostOriginalStates.particles[v] = true
                    v.Enabled = false
                end
            end
        end
    end

    if fpsBoostRemoveTextures then
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("Decal") or v:IsA("Texture") then
                if v.Transparency < 1 then
                    fpsBoostOriginalStates.textures[v] = v.Transparency
                    v.Transparency = 1
                end
            end
        end
    end
end

local function restoreFpsBoost()
    if fpsBoostOriginalStates.quality and settings then
        pcall(function()
            settings().Rendering.QualityLevel = fpsBoostOriginalStates.quality
        end)
    end
    for obj, enabled in pairs(fpsBoostOriginalStates.lighting) do
        if obj and obj.Parent then obj.Enabled = enabled end
    end
    for obj, _ in pairs(fpsBoostOriginalStates.particles) do
        if obj and obj.Parent then obj.Enabled = true end
    end
    for obj, transp in pairs(fpsBoostOriginalStates.textures) do
        if obj and obj.Parent then obj.Transparency = transp end
    end
    fpsBoostOriginalStates = {
        lighting = {},
        quality = nil,
        particles = {},
        textures = {}
    }
end

local function restoreAllLighting()
    Lighting.Ambient = originalLighting.Ambient
    Lighting.Brightness = originalLighting.Brightness
    Lighting.FogEnd = originalLighting.FogEnd
    Lighting.GlobalShadows = originalLighting.GlobalShadows
    Lighting.ClockTime = originalLighting.ClockTime
end

-- ==========================================
-- KILL ALL NPC
-- ==========================================
local function killAllNpcs()
    local killed = 0

    local function tryKill(model)
        if not model or not model.Parent then return false end
        local hum = model:FindFirstChildOfClass("Humanoid")
        if not hum then return false end

        pcall(function() hum.Health = 0 end)

        if hum.Health > 0 then
            pcall(function() hum:TakeDamage(math.huge) end)
        end

        if hum.Health > 0 then
            pcall(function() hum:BreakJoints() end)
        end

        if hum.Health > 0 then
            pcall(function()
                for _, d in ipairs(model:GetDescendants()) do
                    if d:IsA("Motor6D") or d:IsA("Weld") or d:IsA("JointInstance") then
                        d:Destroy()
                    end
                end
            end)
        end

        if hum.Parent and hum.Health > 0 then
            pcall(function() hum:Destroy() end)
        end

        return true
    end

    local function scan(container)
        for _, obj in ipairs(container:GetChildren()) do
            if obj == LocalPlayer.Character then continue end
            if obj == Camera then continue end
            if Players:GetPlayerFromCharacter(obj) then continue end

            if obj:IsA("Model") and obj:FindFirstChildOfClass("Humanoid") then
                if tryKill(obj) then killed = killed + 1 end
            elseif obj:IsA("Folder") or obj:IsA("Model") or obj:IsA("Workspace") or obj:IsA("Configuration") then
                pcall(scan, obj)
            end
        end
    end

    pcall(scan, workspace)
    return killed
end

-- ==========================================
-- UNLOAD
-- ==========================================
local function unloadHub()
    invisibleEnabled = false
    fpsBoostActive = false
    fullBrightActive = false
    godmodeEnabled = false
    regenEnabled = false
    aspectRatioEnabled = false

    for _, conn in ipairs({
        freeCamConnection, instantPromptConn, desyncConnection, fovConnection,
        antiAfkConnection, infJumpConnection, noclipConnection, flyConnection,
        followConnection, spectateConnection, invisibleConnection, clickTpConnection,
        respawnHereConnection, deathConn, hpLockConn, statsConn, menuKeybindConn,
        fullBrightConn, godmodeConn, godmodeHealthConn, godmodeDiedConn, regenConn,
        aspectRatioConn
    }) do
        if conn then pcall(function() conn:Disconnect() end) end
    end
    freeCamConnection = nil; instantPromptConn = nil; desyncConnection = nil
    fovConnection = nil; antiAfkConnection = nil; infJumpConnection = nil
    noclipConnection = nil; flyConnection = nil; followConnection = nil
    spectateConnection = nil; invisibleConnection = nil; clickTpConnection = nil
    respawnHereConnection = nil; deathConn = nil; hpLockConn = nil
    statsConn = nil; menuKeybindConn = nil; fullBrightConn = nil
    godmodeConn = nil; godmodeHealthConn = nil; godmodeDiedConn = nil
    regenConn = nil; aspectRatioConn = nil

    for char, _ in pairs(espHighlights) do
        if espHighlights[char] and espHighlights[char].Parent then espHighlights[char]:Destroy() end
    end
    for char, _ in pairs(espBillboards) do
        if espBillboards[char] and espBillboards[char].Parent then espBillboards[char]:Destroy() end
    end
    espHighlights = {}
    espBillboards = {}
    espPlayersActive = false
    espNpcActive = false

    if flyBodyVelocity then flyBodyVelocity:Destroy(); flyBodyVelocity = nil end
    if flyBodyGyro then flyBodyGyro:Destroy(); flyBodyGyro = nil end

    destroyInvisChair()
    removeHealthLock()
    destroyAspectRatioGui()

    local char = LocalPlayer.Character
    if char then
        -- Restore godmode
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum and godmodeOriginalMaxHealth then
                pcall(function()
                    hum.MaxHealth = godmodeOriginalMaxHealth
                    if hum.Health > godmodeOriginalMaxHealth then
                        hum.Health = godmodeOriginalMaxHealth
                    end
                end)
            end
            for obj, orig in pairs(godmodeOriginalTouchStates) do
                if obj and obj.Parent then
                    obj.CanTouch = orig.CanTouch
                    obj.CanQuery = orig.CanQuery
                end
            end
            godmodeOriginalTouchStates = {}
            godmodeOriginalMaxHealth = nil
        end

        for _, obj in ipairs(char:GetDescendants()) do
            if obj:IsA("BasePart") then
                local orig = invisibleOriginalStates[obj]
                if orig and orig.Transparency < 1 then
                    obj.Transparency = orig.Transparency
                else
                    obj.Transparency = (obj.Name == "HumanoidRootPart") and 1 or 0
                end
                obj.CanCollide = true
                obj.CanTouch = true
                obj.CanQuery = true
            elseif obj:IsA("Decal") then
                local orig = invisibleOriginalStates[obj]
                obj.Transparency = orig and orig.Transparency or 0
            end
        end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.NameDisplayDistance = 100
            hum.HealthDisplayDistance = 100
            hum.PlatformStand = false
            hum.WalkSpeed = DEFAULT_WALK
            hum.JumpPower = DEFAULT_JUMP
        end
    end

    invisibleOriginalStates = {}
    storedMaxHealth = nil

    restoreFpsBoost()
    restoreAllLighting()

    Camera.CameraType = Enum.CameraType.Custom
    Camera.CameraSubject = char and char:FindFirstChildOfClass("Humanoid")
    Camera.FieldOfView = 70
    LocalPlayer.CameraMaxZoomDistance = 128
    LocalPlayer.CameraMinZoomDistance = 0.5

    if statsGui then statsGui:Destroy(); statsGui = nil end

    local notifyGui = game.CoreGui:FindFirstChild("VizUnloadNotify")
    if notifyGui then notifyGui:Destroy() end

    ScreenGui:Destroy()
    print("[VizHub] Successfully unloaded.")
end

-- ==========================================
-- TABS
-- ==========================================
local tabs = {}
local function setActiveTab(index)
    for i, btn in ipairs(tabs) do
        if i == index then
            btn.BackgroundColor3 = Theme.OrangeDark
            btn.TextColor3 = Theme.OrangeAccent
        else
            btn.BackgroundColor3 = Theme.TopBarSideBar
            btn.TextColor3 = Theme.TextWhite
        end
    end
end

local function loadScript(url, flashCallback)
    if url == "" or url == nil then
        warn("[VizHub] URL not specified.")
        if flashCallback then flashCallback(false) end
        return false
    end
    local ok, err = pcall(function() loadstring(game:HttpGet(url))() end)
    if not ok then
        warn("[VizHub] Error: " .. tostring(err))
        if flashCallback then flashCallback(false) end
    else
        if flashCallback then flashCallback(true) end
    end
    return ok
end

-- ==========================================
-- MAIN
-- ==========================================
local function buildHome()
    clearContent()
    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, 0, 0, 32)
    t.BackgroundTransparency = 1
    t.Text = "Main"
    t.TextColor3 = Theme.OrangeAccent
    t.Font = Enum.Font.GothamBold
    t.TextSize = 22
    t.TextXAlignment = Enum.TextXAlignment.Left
    t.LayoutOrder = 1
    t.Parent = ContentFrame

    local hour = tonumber(os.date("%H"))
    local greeting = "Good evening"
    if hour >= 5 and hour < 12 then greeting = "Good morning"
    elseif hour >= 12 and hour < 18 then greeting = "Good afternoon" end

    createCard(greeting, "Welcome to VizHub, " .. LocalPlayer.Name, 2, true)

    createScriptButton("XVC Universal Hub", 5, function(fc) loadScript("https://pastebin.com/raw/Piw5bqGq", fc) end)
    createScriptButton("Infinite Yield", 6, function(fc) loadScript("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", fc) end)
    createScriptButton("Dex Explorer", 7, function(fc) loadScript("https://raw.githubusercontent.com/peyton2465/Dex/master/out.lua", fc) end)

    task.wait()
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 20)
end

-- ==========================================
-- HUBS
-- ==========================================
local function buildHubs()
    clearContent()
    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, 0, 0, 32)
    t.BackgroundTransparency = 1
    t.Text = "Hubs"
    t.TextColor3 = Theme.OrangeAccent
    t.Font = Enum.Font.GothamBold
    t.TextSize = 22
    t.TextXAlignment = Enum.TextXAlignment.Left
    t.LayoutOrder = 1
    t.Parent = ContentFrame

    createCard("these are the best hubs", "List of tested loaders", 2, false)

    local hubList = {
        {name = "XVC Universal Hub", url = "https://pastebin.com/raw/Piw5bqGq"},
        {name = "Speed hub X", url = "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"},
        {name = "Sky hub", url = "https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/%5BFE%5D%20Shattervast.lua"},
        {name = "Ghost hub X", url = "https://raw.githubusercontent.com/GhostHubofficial/GhostHub/refs/heads/main/Loader"},
        {name = "Solara Hub", url = "https://raw.githubusercontent.com/Solara-Hub/Solara-Hub/main/Solara.lua"},
        {name = "Zacks Easy Hub", url = "https://raw.githubusercontent.com/Mei2232/ZaqueHub/main/Zaque%20Hub"},
        {name = "skidibi hub", url = "https://raw.githubusercontent.com/SkibidiCen/MainMenu/main/Code"},
        {name = "Foggy Hub", url = "https://www.foggysoftworks.xyz/loader.lua"},
        {name = "Sirius Hub", url = "https://sirius.menu/gen2"},
        {name = "Orca hub (Keybind K)", url = "https://raw.githubusercontent.com/richie0866/orca/master/public/latest.lua"},
        {name = "Airhub", url = "https://raw.githubusercontent.com/ThatsMyMute/AirHub-V2/main/src/Main.lua"},
        {name = "Owl hub", url = "https://raw.githubusercontent.com/ZinityDrops/OwlHubLink/master/OwlHubBack.lua"},
        {name = "Chat Bypass Hub", url = "https://raw.githubusercontent.com/Icee0/Chat-By-Pass/main/chatbypass"},
        {name = "Rob Hub (visual)", url = "https://raw.githubusercontent.com/David21ds/Real_Yio_RobHub_Universal.lua/refs/heads/main/F3x"},
        {name = "Avtor Hub", url = "https://raw.githubusercontent.com/Avtor1zaTion/Avtor/main/AvtorHub"},
        {name = "Rochips Hub", url = "https://rawscripts.net/raw/Brookhaven-RP-Rochips-Universal-21865"},
        {name = "Ez Hub", url = "https://api.junkie-development.de/api/v1/luascripts/public/8e08cda5c530a6529a71a14b94a33734eccc870e9f28220410eb21d719f66da9/download"},
    }

    for i, hub in ipairs(hubList) do
        createScriptButton(hub.name, 2 + i, function(fc) loadScript(hub.url, fc) end)
    end

    task.wait()
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 20)
end

-- ==========================================
-- UNIVERSAL SCRIPTS
-- ==========================================
local function buildUniversalScripts()
    clearContent()
    local order = 0
    local function nextOrder() order = order + 1; return order end

    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, 0, 0, 32)
    t.BackgroundTransparency = 1
    t.Text = "Universal Scripts"
    t.TextColor3 = Theme.OrangeAccent
    t.Font = Enum.Font.GothamBold
    t.TextSize = 22
    t.TextXAlignment = Enum.TextXAlignment.Left
    t.LayoutOrder = nextOrder()
    t.Parent = ContentFrame

    local function addSection(sectionName, list)
        createSectionLabel(sectionName, nextOrder())
        for _, item in ipairs(list) do
            createScriptButton(item.name, nextOrder(), function(fc)
                if item.url and item.url ~= "" then
                    loadScript(item.url, fc)
                elseif item.inline then
                    local ok = pcall(item.inline)
                    fc(ok)
                else
                    warn("[VizHub] URL for '" .. item.name .. "' is not specified.")
                    fc(false)
                end
            end)
        end
    end

    addSection("main", {
        {name = "Scriptblox Searcher", url = "https://raw.githubusercontent.com/alvin677/search/main/search.lua"},
        {name = "Universe Viewer", url = "https://raw.githubusercontent.com/snugg-ee/universe-viewer/main/UniverseViewer.lua"},
        {name = "Quiz Bot", url = "https://raw.githubusercontent.com/Damian-11/quizbot/master/quizbot.luau"},
        {name = "pshade ultimate (RTX)", url = "https://raw.githubusercontent.com/randomstring0/pshade-ultimate/refs/heads/main/src/cd.lua"},
    })

    addSection("Fling", {
        {name = "Fling GUI", url = "https://raw.githubusercontent.com/K1LAS1K/Ultimate-Fling-GUI/main/flingscript.lua"},
        {name = "Fling GUI 2", url = "https://gist.githubusercontent.com/k0Fs/eb9568348b84e235e2d10febe8af02dc/raw/2aeb782fdedaea9b5819514e6623acefb656e66f/Whispy.Universal"},
        {name = "Fling All Players", inline = function()
            local char = LocalPlayer.Character
            if not char or not char:FindFirstChild("HumanoidRootPart") then return end
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    char.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0.5)
                    task.wait(0.1)
                end
            end
        end},
    })

    addSection("Tools", {
        {name = "Portal Gun", url = "https://raw.githubusercontent.com/AltX-Studio/Roblox/main/PortalGun.lua"},
        {name = "Telekinesis", url = "https://pastefy.app/XKyd8NKb/raw"},
        {name = "F3X Tool", url = "https://raw.githubusercontent.com/misterwaztaken/aurora/main/aurora-latest.lua"},
        {name = "Equip all tools", inline = function()
            local backpack = LocalPlayer:FindFirstChild("Backpack")
            local char = LocalPlayer.Character
            if not backpack or not char then return end
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if not humanoid then return end
            for _, tool in ipairs(backpack:GetChildren()) do
                if tool:IsA("Tool") then humanoid:EquipTool(tool); task.wait(0.05) end
            end
        end},
    })

    addSection("AimBots", {
        {name = "Universal Aimbot", url = "https://raw.githubusercontent.com/xorodev/aimbot-control/refs/heads/main/main.lua"},
        {name = "Volcano", url = "https://raw.githubusercontent.com/Volcano-Aimbot/Volcano/main/Volcano.lua"},
        {name = "Azure Modded", url = "https://raw.githubusercontent.com/Chillz7/Azure-Modded/main/Azure"},
        {name = "Universal Silent Aim", url = "https://raw.githubusercontent.com/Averiias/Universal-SilentAim/main/main.lua"},
    })

    task.wait()
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 20)
end

-- ==========================================
-- FE ANIMATIONS
-- ==========================================
local function buildFeAnimations()
    clearContent()
    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, 0, 0, 32)
    t.BackgroundTransparency = 1
    t.Text = "FE Animations"
    t.TextColor3 = Theme.OrangeAccent
    t.Font = Enum.Font.GothamBold
    t.TextSize = 22
    t.TextXAlignment = Enum.TextXAlignment.Left
    t.LayoutOrder = 1
    t.Parent = ContentFrame

    createSectionLabel("All Emotes", 2)

    local feList = {
        {name = "FE Animation Bundles (Bac0nHck)", url = "https://raw.githubusercontent.com/Bac0nHck/Scripts/refs/heads/main/BundleAnimations.lua"},
        {name = "FE Animation (FIREXDF)", url = "https://raw.githubusercontent.com/FIREXDF/fe-roblox-animation/main/new-interface.lua"},
        {name = "UGC Emotes player", url = "https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Emotes/UGC%20Emotes.lua"},
        {name = "7yd7", url = "https://raw.githubusercontent.com/y7dy7/y7dy7/main/y7dy7.lua"},
    }

    for i, anim in ipairs(feList) do
        createScriptButton(anim.name, 2 + i, function(fc) loadScript(anim.url, fc) end)
    end

    task.wait()
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 20)
end

-- ==========================================
-- UNIVERSAL (Local tab)
-- ==========================================
local function buildUniversal()
    clearContent()

    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, 0, 0, 32)
    t.BackgroundTransparency = 1
    t.Text = "Local - Player"
    t.TextColor3 = Theme.OrangeAccent
    t.Font = Enum.Font.GothamBold
    t.TextSize = 22
    t.TextXAlignment = Enum.TextXAlignment.Left
    t.LayoutOrder = 1
    t.Parent = ContentFrame

    createSectionLabel("Main", 2)

    createToggleButton("Free Cam", 3, freeCamActive, function(state)
        freeCamActive = state
        if state then
            freeCamConnection = RunService.RenderStepped:Connect(function()
                if not LocalPlayer.Character then return end
                Camera.CameraType = Enum.CameraType.Scriptable
                local moveDir = Vector3.new(
                    (UserInputService:IsKeyDown(Enum.KeyCode.D) and 1 or 0) - (UserInputService:IsKeyDown(Enum.KeyCode.A) and 1 or 0),
                    0,
                    (UserInputService:IsKeyDown(Enum.KeyCode.S) and 1 or 0) - (UserInputService:IsKeyDown(Enum.KeyCode.W) and 1 or 0)
                )
                if moveDir.Magnitude > 0 then
                    Camera.CFrame = Camera.CFrame + Camera.CFrame:VectorToWorldSpace(moveDir.Unit * 2)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.E) then Camera.CFrame = Camera.CFrame + Vector3.new(0, 2, 0) end
                if UserInputService:IsKeyDown(Enum.KeyCode.Q) then Camera.CFrame = Camera.CFrame - Vector3.new(0, 2, 0) end
            end)
        else
            if freeCamConnection then freeCamConnection:Disconnect(); freeCamConnection = nil end
            Camera.CameraType = Enum.CameraType.Custom
            Camera.CameraSubject = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        end
    end)

    createToggleButton("Inf Zoom", 4, false, function(state)
        if state then
            LocalPlayer.CameraMaxZoomDistance = 99999
            LocalPlayer.CameraMinZoomDistance = 0
        else
            LocalPlayer.CameraMaxZoomDistance = 128
            LocalPlayer.CameraMinZoomDistance = 0.5
        end
    end)

    createScriptButton("Console Copy Button", 5, function(fc)
        local consoleBtn = Instance.new("TextButton")
        consoleBtn.Size = UDim2.new(0, 150, 0, 40)
        consoleBtn.Position = UDim2.new(0, 10, 0, 10)
        consoleBtn.BackgroundColor3 = Theme.OrangeAccent
        consoleBtn.Text = "Copy Console (F9)"
        consoleBtn.TextColor3 = Color3.new(1, 1, 1)
        consoleBtn.Font = Enum.Font.GothamBold
        consoleBtn.TextSize = 12
        consoleBtn.Parent = ScreenGui
        local bc = Instance.new("UICorner"); bc.CornerRadius = UDim.new(0, 6); bc.Parent = consoleBtn
        consoleBtn.MouseButton1Click:Connect(function()
            local messages = {}
            for _, msg in ipairs(game:GetService("LogService"):GetLogHistory()) do
                table.insert(messages, msg.message)
            end
            if setclipboard then
                setclipboard(table.concat(messages, "\n"))
                consoleBtn.Text = "Copied!"
            else
                consoleBtn.Text = "No clipboard!"
            end
            task.wait(1)
            consoleBtn.Text = "Copy Console (F9)"
        end)
        fc(true)
    end)

    createToggleButton("Instant ProximityPrompt", 6, instantPromptActive, function(state)
        instantPromptActive = state
        if state then
            instantPromptConn = RunService.Heartbeat:Connect(function()
                for _, obj in ipairs(workspace:GetDescendants()) do
                    if obj:IsA("ProximityPrompt") then obj.HoldDuration = 0 end
                end
            end)
        else
            if instantPromptConn then instantPromptConn:Disconnect(); instantPromptConn = nil end
        end
    end)

    createToggleButton("Desync", 7, desyncActive, function(state)
        desyncActive = state
        if state then
            desyncConnection = RunService.Heartbeat:Connect(function()
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 0.001, 0)
                end
            end)
        else
            if desyncConnection then desyncConnection:Disconnect(); desyncConnection = nil end
        end
    end)

    createScriptButton("fix cam", 8, function(fc)
        if freeCamConnection then freeCamConnection:Disconnect(); freeCamConnection = nil end
        Camera.CameraType = Enum.CameraType.Custom
        Camera.CameraSubject = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        Camera.FieldOfView = 70
        LocalPlayer.CameraMaxZoomDistance = 128
        LocalPlayer.CameraMinZoomDistance = 0.5
        fc(true)
    end)

    createTextInputButton("FOV Changer", 9, fovValue, function(text)
        local num = tonumber(text)
        if num then
            fovValue = math.clamp(num, 1, 1200)
            if fovEnabled then Camera.FieldOfView = fovValue end
        end
    end)

    createToggleButton("Enable FOV", 10, fovEnabled, function(state)
        fovEnabled = state
        if state then
            Camera.FieldOfView = fovValue
            fovConnection = RunService.RenderStepped:Connect(function() Camera.FieldOfView = fovValue end)
        else
            if fovConnection then fovConnection:Disconnect(); fovConnection = nil end
            Camera.FieldOfView = 70
        end
    end)

    -- ==========================================
    -- ASPECT RATIO (Local tab)
    -- ==========================================
    createSectionLabel("Aspect Ratio", 11)

    createToggleButton("Enable Aspect Ratio", 12, aspectRatioEnabled, function(state)
        aspectRatioEnabled = state
        ensureAspectRatioGui()
        updateAspectRatio()
        if state then
            startAspectRatioLoop()
        else
            stopAspectRatioLoop()
            if aspectRatioGui then aspectRatioGui.Enabled = false end
        end
    end)

    createSlider("Aspect Ratio Value", 13, 0.5, 3.0, aspectRatioValue, true, function(val)
        aspectRatioValue = val
        if aspectRatioEnabled then
            ensureAspectRatioGui()
            updateAspectRatio()
        end
    end)

    createScriptButton("Preset: 21:9 Cinema (2.33)", 14, function(fc)
        aspectRatioValue = 2.333
        if aspectRatioEnabled then
            ensureAspectRatioGui()
            updateAspectRatio()
        end
        fc(true)
    end)

    createScriptButton("Preset: 16:9 Default (1.78)", 15, function(fc)
        aspectRatioValue = 1.7778
        if aspectRatioEnabled then
            ensureAspectRatioGui()
            updateAspectRatio()
        end
        fc(true)
    end)

    createScriptButton("Preset: 4:3 Classic (1.33)", 16, function(fc)
        aspectRatioValue = 1.3333
        if aspectRatioEnabled then
            ensureAspectRatioGui()
            updateAspectRatio()
        end
        fc(true)
    end)

    createScriptButton("Preset: 1:1 Square (1.00)", 17, function(fc)
        aspectRatioValue = 1.0
        if aspectRatioEnabled then
            ensureAspectRatioGui()
            updateAspectRatio()
        end
        fc(true)
    end)

    createScriptButton("Clear Aspect Ratio", 18, function(fc)
        aspectRatioEnabled = false
        stopAspectRatioLoop()
        destroyAspectRatioGui()
        fc(true)
    end)

    createSectionLabel("Performance", 19)

    createToggleButton("Anti-AFK", 20, antiAfkEnabled, function(state)
        antiAfkEnabled = state
        if state then
            antiAfkConnection = LocalPlayer.Idled:Connect(function()
                if antiAfkEnabled then
                    local VirtualUser = game:GetService("VirtualUser")
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton2(Vector2.new())
                end
            end)
        else
            if antiAfkConnection then antiAfkConnection:Disconnect(); antiAfkConnection = nil end
        end
    end)

    createTextInputButton("FPS Changer", 21, 9999, function(text)
        local num = tonumber(text)
        if num and setfpscap then setfpscap(num)
        elseif not setfpscap then warn("[VizHub] Your executor does not support setfpscap!") end
    end)

    createScriptButton("unlock the fps limit (your executor need support the TaskScheduler)", 22, function(fc)
        if setfpscap then setfpscap(9999); fc(true)
        else warn("[VizHub] Your executor does not support setfpscap!"); fc(false) end
    end)

    createScriptButton("show performance stats", 23, function(fc)
        if statsGui then statsGui:Destroy(); statsGui = nil; fc(true); return end
        statsGui = Instance.new("ScreenGui")
        statsGui.Name = "VizStats"
        statsGui.Parent = game.CoreGui
        local StatsFrame = Instance.new("Frame")
        StatsFrame.Size = UDim2.new(0, 200, 0, 80)
        StatsFrame.Position = UDim2.new(0, 10, 0, 10)
        StatsFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        StatsFrame.BorderSizePixel = 0
        StatsFrame.Parent = statsGui
        local SC = Instance.new("UICorner"); SC.CornerRadius = UDim.new(0, 8); SC.Parent = StatsFrame
        local SS = Instance.new("UIStroke"); SS.Color = Theme.OrangeAccent; SS.Thickness = 1; SS.Parent = StatsFrame
        local SL = Instance.new("TextLabel")
        SL.Size = UDim2.new(1, -20, 1, -20)
        SL.Position = UDim2.new(0, 10, 0, 10)
        SL.BackgroundTransparency = 1
        SL.Text = "Loading..."
        SL.TextColor3 = Theme.OrangeAccent
        SL.Font = Enum.Font.GothamBold
        SL.TextSize = 12
        SL.TextXAlignment = Enum.TextXAlignment.Left
        SL.TextYAlignment = Enum.TextYAlignment.Top
        SL.Parent = StatsFrame
        local CS = Instance.new("TextButton")
        CS.Size = UDim2.new(0, 20, 0, 20)
        CS.Position = UDim2.new(1, -25, 0, 5)
        CS.BackgroundTransparency = 1
        CS.Text = "X"
        CS.TextColor3 = Theme.OrangeAccent
        CS.Font = Enum.Font.GothamBold
        CS.TextSize = 12
        CS.Parent = StatsFrame
        CS.MouseButton1Click:Connect(function() statsGui:Destroy(); statsGui = nil end)
        statsConn = RunService.RenderStepped:Connect(function()
            if not statsGui then if statsConn then statsConn:Disconnect() end return end
            local fps = math.floor(1 / RunService.RenderStepped:Wait())
            local ping = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
            local mem = math.floor(game:GetService("Stats"):GetTotalMemoryUsageMb())
            SL.Text = string.format("FPS: %d\nPing: %d ms\nMemory: %d MB", fps, ping, mem)
        end)
        fc(true)
    end)

    task.wait()
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 20)
end

-- ==========================================
-- OTHERS
-- ==========================================
local function buildPlayer()
    clearContent()
    local order = 0
    local function nextOrder() order = order + 1; return order end

    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, 0, 0, 32)
    t.BackgroundTransparency = 1
    t.Text = "Others Scripts"
    t.TextColor3 = Theme.OrangeAccent
    t.Font = Enum.Font.GothamBold
    t.TextSize = 22
    t.TextXAlignment = Enum.TextXAlignment.Left
    t.LayoutOrder = nextOrder()
    t.Parent = ContentFrame

    local function applyWalkSpeed()
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.WalkSpeed = walkSpeedEnabled and walkSpeedValue or DEFAULT_WALK
            end
        end
    end

    local function applyJumpPower()
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.UseJumpPower = true
                hum.JumpPower = jumpPowerEnabled and jumpPowerValue or DEFAULT_JUMP
            end
        end
    end

    local function createValueToggle(name, ord, defaultVal, initialToggle, onToggle, onInput)
        local row = Instance.new("Frame")
        row.Size = UDim2.new(1, -10, 0, 42)
        row.BackgroundColor3 = Theme.CardBackground
        row.BorderSizePixel = 0
        row.LayoutOrder = ord
        row.Parent = ContentFrame

        local rc = Instance.new("UICorner"); rc.CornerRadius = UDim.new(0, 6); rc.Parent = row
        local rs = Instance.new("UIStroke"); rs.Color = Theme.StrokeColor; rs.Thickness = 1; rs.Parent = row

        local L = Instance.new("TextLabel")
        L.Size = UDim2.new(0, 110, 1, 0)
        L.Position = UDim2.new(0, 12, 0, 0)
        L.BackgroundTransparency = 1
        L.Text = name
        L.TextColor3 = Theme.TextWhite
        L.Font = Enum.Font.GothamMedium
        L.TextSize = 13
        L.TextXAlignment = Enum.TextXAlignment.Left
        L.Parent = row

        local IB = Instance.new("TextBox")
        IB.Size = UDim2.new(0, 60, 0, 26)
        IB.Position = UDim2.new(1, -110, 0.5, -13)
        IB.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        IB.BorderSizePixel = 0
        IB.Text = tostring(defaultVal)
        IB.TextColor3 = Theme.OrangeAccent
        IB.Font = Enum.Font.GothamBold
        IB.TextSize = 12
        IB.ClearTextOnFocus = false
        IB.Parent = row

        local ic = Instance.new("UICorner"); ic.CornerRadius = UDim.new(0, 4); ic.Parent = IB
        local is = Instance.new("UIStroke"); is.Color = Theme.StrokeColor; is.Thickness = 1; is.Parent = IB

        local TO = Instance.new("Frame")
        TO.Size = UDim2.new(0, 36, 0, 20)
        TO.Position = UDim2.new(1, -46, 0.5, -10)
        TO.BackgroundColor3 = initialToggle and Theme.ToggleOn or Theme.ToggleOff
        TO.BorderSizePixel = 0
        TO.Parent = row

        local tc = Instance.new("UICorner"); tc.CornerRadius = UDim.new(1, 0); tc.Parent = TO

        local TD = Instance.new("Frame")
        TD.Size = UDim2.new(0, 16, 0, 16)
        TD.Position = initialToggle and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
        TD.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TD.BorderSizePixel = 0
        TD.Parent = TO

        local dc = Instance.new("UICorner"); dc.CornerRadius = UDim.new(1, 0); dc.Parent = TD

        local TB = Instance.new("TextButton")
        TB.Size = UDim2.new(0, 36, 0, 20)
        TB.Position = UDim2.new(1, -46, 0.5, -10)
        TB.BackgroundTransparency = 1
        TB.Text = ""
        TB.Parent = row

        local state = initialToggle
        TB.MouseButton1Click:Connect(function()
            state = not state
            TO.BackgroundColor3 = state and Theme.ToggleOn or Theme.ToggleOff
            TweenService:Create(TD, TweenInfo.new(0.15), {
                Position = state and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
            }):Play()
            if onToggle then onToggle(state) end
        end)

        IB.FocusLost:Connect(function()
            if onInput then onInput(IB.Text) end
        end)
    end

    -- Graphics
    createSectionLabel("Graphics", nextOrder())

    createToggleButton("Full Bright", nextOrder(), fullBrightActive, function(state)
        fullBrightActive = state
        if state then
            applyFullBright()
        else
            if fullBrightConn then fullBrightConn:Disconnect(); fullBrightConn = nil end
            restoreAllLighting()
        end
    end)

    createSlider("Brightness", nextOrder(), 0, 10, fbBrightness, true, function(val)
        fbBrightness = val
        if fullBrightActive then applyFullBright() end
    end)

    createSlider("Clock Time", nextOrder(), 0, 24, fbClockTime, true, function(val)
        fbClockTime = val
        if fullBrightActive then applyFullBright() end
    end)

    createSlider("Ambient Brightness", nextOrder(), 0, 255, fbAmbient, false, function(val)
        fbAmbient = val
        if fullBrightActive then applyFullBright() end
    end)

    createSlider("Fog End", nextOrder(), 0, 5000, fbFogEnd, false, function(val)
        fbFogEnd = val
        if fullBrightActive then applyFullBright() end
    end)

    createToggleButton("Disable Shadows", nextOrder(), fbShadows, function(state)
        fbShadows = state
        if fullBrightActive then applyFullBright() end
    end)

    -- Performance
    createSectionLabel("Performance Boosting", nextOrder())

    createToggleButton("FPS Boost", nextOrder(), fpsBoostActive, function(state)
        fpsBoostActive = state
        if state then
            applyFpsBoost()
        else
            restoreFpsBoost()
        end
    end)

    createToggleButton("  Lower Quality Level", nextOrder(), fpsBoostLowerQuality, function(state)
        fpsBoostLowerQuality = state
        if fpsBoostActive then
            restoreFpsBoost()
            applyFpsBoost()
        end
    end)

    createToggleButton("  Remove Particles", nextOrder(), fpsBoostRemoveParticles, function(state)
        fpsBoostRemoveParticles = state
        if fpsBoostActive then
            restoreFpsBoost()
            applyFpsBoost()
        end
    end)

    createToggleButton("  Remove Textures", nextOrder(), fpsBoostRemoveTextures, function(state)
        fpsBoostRemoveTextures = state
        if fpsBoostActive then
            restoreFpsBoost()
            applyFpsBoost()
        end
    end)

    -- Server
    createSectionLabel("Server", nextOrder())

    createToggleButton("Respawn Here", nextOrder(), respawnHereEnabled, function(state)
        respawnHereEnabled = state

        if respawnHereConnection then respawnHereConnection:Disconnect(); respawnHereConnection = nil end
        if deathConn then deathConn:Disconnect(); deathConn = nil end

        if state then
            deathPosition = nil
            respawnHereConnection = LocalPlayer.CharacterAdded:Connect(function(char)
                if not respawnHereEnabled then return end
                if deathPosition then
                    task.wait(0.5)
                    local hrp = char:WaitForChild("HumanoidRootPart", 5)
                    if hrp then hrp.CFrame = CFrame.new(deathPosition) end
                    deathPosition = nil
                end
            end)

            local char = LocalPlayer.Character
            if char then
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then
                    deathConn = hum.Died:Connect(function()
                        if not respawnHereEnabled then return end
                        local hrp = char:FindFirstChild("HumanoidRootPart")
                        if hrp then deathPosition = hrp.Position end
                    end)
                end
            end
        else
            deathPosition = nil
        end
    end)

    -- ==========================================
    -- GODMODE
    -- ==========================================
    createToggleButton("Godmode (100%)", nextOrder(), godmodeEnabled, function(state)
        godmodeEnabled = state

        if state then
            local char = LocalPlayer.Character
            if char then
                applyGodmode(char)
                startGodmodeLoop()
            end
        else
            removeGodmode(LocalPlayer.Character)
        end
    end)

    -- ==========================================
    -- REGENERATION
    -- ==========================================
    createToggleButton("Regeneration", nextOrder(), regenEnabled, function(state)
        regenEnabled = state
        if state then
            startRegenLoop()
        else
            stopRegenLoop()
        end
    end)

    createSlider("Regen HP/sec", nextOrder(), 1, 200, regenRate, false, function(val)
        regenRate = math.floor(val)
    end)

    -- ==========================================
    -- INVISIBILITY
    -- ==========================================
    local function toggleInvisibilityInternal(state)
        invisibleEnabled = state
        if invisibleConnection then invisibleConnection:Disconnect(); invisibleConnection = nil end

        local char = LocalPlayer.Character
        if not char then invisibleEnabled = false; return end

        if state then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if not hrp then invisibleEnabled = false; return end
            local savedPosition = hrp.CFrame

            invisibleOriginalStates = {}
            captureOriginalStates(char)

            pcall(function() char:MoveTo(INV_CONFIG.INVISIBILITY_POSITION) end)
            task.wait(0.15)

            local hrpNow = char:FindFirstChild("HumanoidRootPart")
            if not hrpNow or hrpNow.Position.Y < INV_CONFIG.VOID_Y_THRESHOLD then
                pcall(function() char:MoveTo(savedPosition) end)
                restoreAllStates(char)
                invisibleEnabled = false
                return
            end

            destroyInvisChair()
            local seat = Instance.new("Seat")
            seat.Name = INV_CONFIG.CHAIR_NAME
            seat.Anchored = false
            seat.CanCollide = false
            seat.Transparency = 1
            seat.Position = INV_CONFIG.INVISIBILITY_POSITION
            seat.Parent = workspace
            invisChair = seat

            local weld = Instance.new("Weld")
            weld.Part0 = seat
            weld.Part1 = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
            weld.Parent = seat

            task.wait()
            pcall(function() seat.CFrame = savedPosition end)

            setCharacterTransparency(INV_CONFIG.INVIS_TRANSPARENCY)
            applyCollisionProtection(char)
            applyHealthLock(char)
            hideNameAndHealth(char)

            invisibleConnection = RunService.Heartbeat:Connect(function()
                if not invisibleEnabled then return end
                local c = LocalPlayer.Character
                if not c then return end
                local h = c:FindFirstChildOfClass("Humanoid")

                for _, obj in ipairs(c:GetDescendants()) do
                    if obj:IsA("BasePart") then
                        local orig = invisibleOriginalStates[obj]
                        local targetT
                        if orig then
                            targetT = (orig.Transparency >= 1) and 1 or INV_CONFIG.INVIS_TRANSPARENCY
                        else
                            targetT = (obj.Name == "HumanoidRootPart") and 1 or INV_CONFIG.INVIS_TRANSPARENCY
                        end
                        if obj.Transparency ~= targetT then obj.Transparency = targetT end
                        obj.CanCollide = false
                        obj.CanTouch = false
                        obj.CanQuery = false
                    elseif obj:IsA("Decal") then
                        local orig = invisibleOriginalStates[obj]
                        local targetT
                        if orig then
                            targetT = (orig.Transparency >= 1) and 1 or INV_CONFIG.INVIS_TRANSPARENCY
                        else
                            targetT = INV_CONFIG.INVIS_TRANSPARENCY
                        end
                        if obj.Transparency ~= targetT then obj.Transparency = targetT end
                    end
                end

                if h and h.Parent then
                    h.NameDisplayDistance = 0
                    h.HealthDisplayDistance = 0
                    if h.Health < h.MaxHealth then h.Health = h.MaxHealth end
                end
            end)
        else
            if invisibleConnection then invisibleConnection:Disconnect(); invisibleConnection = nil end
            destroyInvisChair()
            removeHealthLock()
            restoreAllStates(char)
            restoreNameAndHealth(char)
            storedMaxHealth = nil
        end
    end

    createToggleButton("Invisibility", nextOrder(), invisibleEnabled, function(state)
        toggleInvisibilityInternal(state)
    end)

    createScriptButton("Kill All NPC", nextOrder(), function(fc)
        local killed = killAllNpcs()
        if killed > 0 then
            fc(true)
            print("[VizHub] Killed " .. killed .. " NPCs")
        else
            fc(false)
            warn("[VizHub] No NPCs found to kill.")
        end
    end)

    LocalPlayer.CharacterAdded:Connect(function(char)
        task.wait(1)
        applyWalkSpeed()
        applyJumpPower()
        if invisibleEnabled then
            task.wait(0.5)
            invisibleOriginalStates = {}
            captureOriginalStates(char)
            setCharacterTransparency(INV_CONFIG.INVIS_TRANSPARENCY)
            applyCollisionProtection(char)
            applyHealthLock(char)
            hideNameAndHealth(char)
        end
        if godmodeEnabled then
            task.wait(0.3)
            applyGodmode(char)
        end
    end)

    -- Movement
    createSectionLabel("Movement", nextOrder())

    createValueToggle("WalkSpeed", nextOrder(), walkSpeedValue, walkSpeedEnabled,
        function(state) walkSpeedEnabled = state; applyWalkSpeed() end,
        function(text)
            local num = tonumber(text)
            if num then
                walkSpeedValue = math.clamp(num, 1, 1000)
                if walkSpeedEnabled then applyWalkSpeed() end
            end
        end
    )

    createValueToggle("JumpForce", nextOrder(), jumpPowerValue, jumpPowerEnabled,
        function(state) jumpPowerEnabled = state; applyJumpPower() end,
        function(text)
            local num = tonumber(text)
            if num then
                jumpPowerValue = math.clamp(num, 1, 1000)
                if jumpPowerEnabled then applyJumpPower() end
            end
        end
    )

    createToggleButton("Unlimited Jumps", nextOrder(), infJumpActive, function(state)
        infJumpActive = state
        if state then
            infJumpConnection = UserInputService.JumpRequest:Connect(function()
                if infJumpActive then
                    local char = LocalPlayer.Character
                    if char then
                        local hum = char:FindFirstChildOfClass("Humanoid")
                        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
                    end
                end
            end)
        else
            if infJumpConnection then infJumpConnection:Disconnect(); infJumpConnection = nil end
        end
    end)

    createToggleButton("Teleport To Click", nextOrder(), clickTpActive, function(state)
        clickTpActive = state
        if clickTpConnection then clickTpConnection:Disconnect(); clickTpConnection = nil end

        if state then
            clickTpConnection = UserInputService.InputBegan:Connect(function(input, processed)
                if processed then return end
                if not clickTpActive then return end
                if input.UserInputType ~= Enum.UserInputType.MouseButton1
                   and input.UserInputType ~= Enum.UserInputType.Touch then return end
                local char = LocalPlayer.Character
                if not char then return end
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                local mouse = LocalPlayer:GetMouse()
                if not mouse or not mouse.Hit then return end
                hrp.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, clickTpOffsetY, 0))
            end)
        end
    end)

    createToggleButton("Noclip", nextOrder(), noclipActive, function(state)
        noclipActive = state
        if state then
            noclipConnection = RunService.Stepped:Connect(function()
                if noclipActive and LocalPlayer.Character then
                    for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                        if part:IsA("BasePart") and part.CanCollide then part.CanCollide = false end
                    end
                end
            end)
        else
            if noclipConnection then noclipConnection:Disconnect(); noclipConnection = nil end
            if LocalPlayer.Character then
                for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = true end
                end
            end
        end
    end)

    createToggleButton("Fly", nextOrder(), flyActive, function(state)
        flyActive = state
        local char = LocalPlayer.Character
        if not char then flyActive = false; return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum then flyActive = false; return end

        if state then
            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            bv.Velocity = Vector3.new(0, 0, 0)
            bv.Parent = hrp
            flyBodyVelocity = bv

            local bg = Instance.new("BodyGyro")
            bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            bg.P = 1000
            bg.D = 50
            bg.CFrame = hrp.CFrame
            bg.Parent = hrp
            flyBodyGyro = bg

            hum.PlatformStand = true

            flyConnection = RunService.Heartbeat:Connect(function()
                if not flyActive then return end
                local cam = workspace.CurrentCamera
                local speed = 60
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then speed = 150 end
                local moveDir = Vector3.new()
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then moveDir = moveDir - Vector3.new(0, 1, 0) end
                if moveDir.Magnitude > 0 then moveDir = moveDir.Unit end
                bv.Velocity = moveDir * speed
                bg.CFrame = cam.CFrame
            end)
        else
            if flyConnection then flyConnection:Disconnect(); flyConnection = nil end
            if flyBodyVelocity then flyBodyVelocity:Destroy(); flyBodyVelocity = nil end
            if flyBodyGyro then flyBodyGyro:Destroy(); flyBodyGyro = nil end
            if hum then hum.PlatformStand = false end
        end
    end)

    -- ESP
    createSectionLabel("ESP Options", nextOrder())

    local function destroyEspFor(char)
        if espHighlights[char] then
            if espHighlights[char].Parent then espHighlights[char]:Destroy() end
            espHighlights[char] = nil
        end
        if espBillboards[char] then
            if espBillboards[char].Parent then espBillboards[char]:Destroy() end
            espBillboards[char] = nil
        end
    end

    local function removeAllEsp()
        for char, _ in pairs(espHighlights) do destroyEspFor(char) end
        for char, _ in pairs(espBillboards) do destroyEspFor(char) end
        espHighlights = {}
        espBillboards = {}
    end

    local function createEspFor(char, isPlayer)
        if not char or not char.Parent then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hum or hum.Health <= 0 then return end
        local head = char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart")
        if not head then return end

        local h = Instance.new("Highlight")
        h.Name = "VizESP"
        h.FillColor = isPlayer and Color3.fromRGB(0, 150, 255) or Color3.fromRGB(255, 50, 50)
        h.OutlineColor = Color3.fromRGB(255, 255, 255)
        h.FillTransparency = 0.5
        h.OutlineTransparency = 0
        h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        h.Parent = char
        espHighlights[char] = h

        local billboard = Instance.new("BillboardGui")
        billboard.Name = "VizBillboard"
        billboard.Size = UDim2.new(0, 150, 0, 40)
        billboard.StudsOffset = Vector3.new(0, 2.5, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = head

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundTransparency = 1
        frame.Parent = billboard

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Name = "NameLabel"
        nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
        nameLabel.Position = UDim2.new(0, 0, 0, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.TextStrokeTransparency = 0
        nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        nameLabel.TextSize = 14
        nameLabel.Text = isPlayer and (Players:GetPlayerFromCharacter(char) and Players:GetPlayerFromCharacter(char).Name or "Player") or "NPC"
        nameLabel.Visible = isPlayer and espShowNames
        nameLabel.Parent = frame

        local healthLabel = Instance.new("TextLabel")
        healthLabel.Name = "HealthLabel"
        healthLabel.Size = UDim2.new(1, 0, 0.5, 0)
        healthLabel.Position = UDim2.new(0, 0, 0.5, 0)
        healthLabel.BackgroundTransparency = 1
        healthLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        healthLabel.Font = Enum.Font.GothamBold
        healthLabel.TextStrokeTransparency = 0
        healthLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        healthLabel.TextSize = 13
        healthLabel.Text = "HP: " .. math.floor(hum.Health) .. "/" .. math.floor(hum.MaxHealth)
        healthLabel.Visible = espShowHealth
        healthLabel.Parent = frame

        hum.HealthChanged:Connect(function()
            if healthLabel and healthLabel.Parent then
                healthLabel.Text = "HP: " .. math.floor(hum.Health) .. "/" .. math.floor(hum.MaxHealth)
            end
        end)

        espBillboards[char] = billboard
    end

    local function isAlivePlayer(plr)
        if plr == LocalPlayer then return false end
        if not plr.Character then return false end
        local hum = plr.Character:FindFirstChildOfClass("Humanoid")
        if not hum or hum.Health <= 0 then return false end
        return true
    end

    local function isNpcModel(model)
        if not model:IsA("Model") then return false end
        if Players:GetPlayerFromCharacter(model) then return false end
        if model == LocalPlayer.Character then return false end
        if not model:FindFirstChild("HumanoidRootPart") then return false end
        local hum = model:FindFirstChildOfClass("Humanoid")
        if not hum or hum.Health <= 0 then return false end
        return true
    end

    local function findAllNpcs()
        local found = {}
        local function scan(container)
            for _, obj in ipairs(container:GetChildren()) do
                if obj == LocalPlayer.Character then continue end
                if isNpcModel(obj) then
                    found[obj] = true
                elseif obj:IsA("Folder") or obj:IsA("Model") or obj:IsA("Workspace") or obj:IsA("Configuration") then
                    pcall(scan, obj)
                end
            end
        end
        pcall(scan, workspace)
        return found
    end

    local function startEspLoop()
        if espLoop then return end
        espLoop = task.spawn(function()
            while espPlayersActive or espNpcActive do
                if espPlayersActive then
                    for _, plr in ipairs(Players:GetPlayers()) do
                        if isAlivePlayer(plr) then
                            if not espHighlights[plr.Character] then
                                createEspFor(plr.Character, true)
                            end
                        elseif plr.Character and espHighlights[plr.Character] then
                            destroyEspFor(plr.Character)
                        end
                    end
                else
                    for _, plr in ipairs(Players:GetPlayers()) do
                        if plr.Character and espHighlights[plr.Character] then
                            destroyEspFor(plr.Character)
                        end
                    end
                end

                if espNpcActive then
                    local found = findAllNpcs()
                    for obj, _ in pairs(found) do
                        if not espHighlights[obj] then
                            createEspFor(obj, false)
                        end
                    end
                    for char, _ in pairs(espHighlights) do
                        if not Players:GetPlayerFromCharacter(char) and not found[char] then
                            destroyEspFor(char)
                        end
                    end
                else
                    for char, _ in pairs(espHighlights) do
                        if not Players:GetPlayerFromCharacter(char) then
                            destroyEspFor(char)
                        end
                    end
                end

                task.wait(1.5)
            end
            espLoop = nil
        end)
    end

    createToggleButton("Player's ESP", nextOrder(), espPlayersActive, function(state)
        espPlayersActive = state
        if state then startEspLoop()
        elseif not espNpcActive then removeAllEsp() end
    end)

    createToggleButton("NPC's ESP", nextOrder(), espNpcActive, function(state)
        espNpcActive = state
        if state then startEspLoop()
        elseif not espPlayersActive then removeAllEsp() end
    end)

    createToggleButton("ESP Names", nextOrder(), espShowNames, function(state)
        espShowNames = state
        for _, bb in pairs(espBillboards) do
            if bb and bb.Parent then
                local frame = bb:FindFirstChildOfClass("Frame")
                if frame then
                    local nameLabel = frame:FindFirstChild("NameLabel")
                    if nameLabel then nameLabel.Visible = espShowNames end
                end
            end
        end
    end)

    createToggleButton("ESP Health NPS & Players", nextOrder(), espShowHealth, function(state)
        espShowHealth = state
        for _, bb in pairs(espBillboards) do
            if bb and bb.Parent then
                local frame = bb:FindFirstChildOfClass("Frame")
                if frame then
                    local healthLabel = frame:FindFirstChild("HealthLabel")
                    if healthLabel then healthLabel.Visible = espShowHealth end
                end
            end
        end
    end)

    createSectionLabel("Player's List (Admin)", nextOrder())

    if followTarget then
        local sb = createScriptButton("Stop Following: " .. followTarget.Name, nextOrder(), function(fc)
            if followConnection then followConnection:Disconnect(); followConnection = nil end
            followTarget = nil
            fc(true)
            buildPlayer()
        end)
        sb.TextColor3 = Theme.OrangeAccent
    end

    if spectateTarget then
        local ss = createScriptButton("Stop Spectating: " .. spectateTarget.Name, nextOrder(), function(fc)
            if spectateConnection then spectateConnection:Disconnect(); spectateConnection = nil end
            spectateTarget = nil
            Camera.CameraType = Enum.CameraType.Custom
            Camera.CameraSubject = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            fc(true)
            buildPlayer()
        end)
        ss.TextColor3 = Theme.OrangeAccent
    end

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            local rowFrame = Instance.new("Frame")
            rowFrame.Size = UDim2.new(1, -10, 0, 42)
            rowFrame.BackgroundColor3 = Theme.CardBackground
            rowFrame.BorderSizePixel = 0
            rowFrame.LayoutOrder = nextOrder()
            rowFrame.Parent = ContentFrame

            local rc = Instance.new("UICorner"); rc.CornerRadius = UDim.new(0, 6); rc.Parent = rowFrame
            local rs = Instance.new("UIStroke"); rs.Color = Theme.StrokeColor; rs.Thickness = 1; rs.Parent = rowFrame

            local NL = Instance.new("TextLabel")
            NL.Size = UDim2.new(0, 140, 1, 0)
            NL.Position = UDim2.new(0, 10, 0, 0)
            NL.BackgroundTransparency = 1
            NL.Text = plr.Name
            NL.TextColor3 = Theme.TextWhite
            NL.Font = Enum.Font.GothamMedium
            NL.TextSize = 12
            NL.TextXAlignment = Enum.TextXAlignment.Left
            NL.TextTruncate = Enum.TextTruncate.AtEnd
            NL.Parent = rowFrame

            local TpBtn = Instance.new("TextButton")
            TpBtn.Size = UDim2.new(0, 65, 0, 30)
            TpBtn.Position = UDim2.new(1, -215, 0.5, -15)
            TpBtn.BackgroundColor3 = Theme.OrangeAccent
            TpBtn.Text = "TP"
            TpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            TpBtn.Font = Enum.Font.GothamBold
            TpBtn.TextSize = 11
            TpBtn.Parent = rowFrame
            local tc1 = Instance.new("UICorner"); tc1.CornerRadius = UDim.new(0, 4); tc1.Parent = TpBtn

            TpBtn.MouseButton1Click:Connect(function()
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                end
            end)

            local FolBtn = Instance.new("TextButton")
            FolBtn.Size = UDim2.new(0, 65, 0, 30)
            FolBtn.Position = UDim2.new(1, -145, 0.5, -15)
            FolBtn.BackgroundColor3 = Theme.OrangeAccent
            FolBtn.Text = "Follow"
            FolBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            FolBtn.Font = Enum.Font.GothamBold
            FolBtn.TextSize = 11
            FolBtn.Parent = rowFrame
            local tc2 = Instance.new("UICorner"); tc2.CornerRadius = UDim.new(0, 4); tc2.Parent = FolBtn

            FolBtn.MouseButton1Click:Connect(function()
                if followConnection then followConnection:Disconnect(); followConnection = nil end
                if spectateConnection then spectateConnection:Disconnect(); spectateConnection = nil end
                spectateTarget = nil
                followTarget = plr

                followConnection = RunService.RenderStepped:Connect(function()
                    if not followTarget or not followTarget.Character then return end
                    local targetHRP = followTarget.Character:FindFirstChild("HumanoidRootPart")
                    local myChar = LocalPlayer.Character
                    if not myChar then return end
                    local myHRP = myChar:FindFirstChild("HumanoidRootPart")
                    if not myHRP then return end
                    if targetHRP then
                        myHRP.CFrame = targetHRP.CFrame * CFrame.new(0, 0, 3)
                    end
                end)
                buildPlayer()
            end)

            local SpecBtn = Instance.new("TextButton")
            SpecBtn.Size = UDim2.new(0, 65, 0, 30)
            SpecBtn.Position = UDim2.new(1, -75, 0.5, -15)
            SpecBtn.BackgroundColor3 = Theme.OrangeAccent
            SpecBtn.Text = "Spectate"
            SpecBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            SpecBtn.Font = Enum.Font.GothamBold
            SpecBtn.TextSize = 11
            SpecBtn.Parent = rowFrame
            local tc3 = Instance.new("UICorner"); tc3.CornerRadius = UDim.new(0, 4); tc3.Parent = SpecBtn

            SpecBtn.MouseButton1Click:Connect(function()
                if spectateConnection then spectateConnection:Disconnect(); spectateConnection = nil end
                if followConnection then followConnection:Disconnect(); followConnection = nil end
                followTarget = nil
                spectateTarget = plr

                spectateConnection = RunService.RenderStepped:Connect(function()
                    if not spectateTarget or not spectateTarget.Character then return end
                    local targetHum = spectateTarget.Character:FindFirstChildOfClass("Humanoid")
                    if targetHum then
                        Camera.CameraType = Enum.CameraType.Custom
                        Camera.CameraSubject = targetHum
                    end
                end)
                buildPlayer()
            end)
        end
    end

    task.wait()
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 20)
end

-- ==========================================
-- KEYBIND CAPTURE
-- ==========================================
local function startKeyRebind(displayLabel)
    if rebindingKey then return end
    rebindingKey = true
    if displayLabel then
        displayLabel.Text = "..."
        displayLabel.TextColor3 = Theme.OrangeAccent
    end
    local conn
    conn = UserInputService.InputBegan:Connect(function(input, gpe)
        if gpe then return end
        if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
        local newKey = input.KeyCode
        if newKey == Enum.KeyCode.Unknown then return end
        menuKeybindKey = newKey
        rebindingKey = false
        if conn then conn:Disconnect() end
        if displayLabel then
            displayLabel.Text = newKey.Name
            displayLabel.TextColor3 = Theme.TextWhite
        end
    end)
end

-- ==========================================
-- SETTINGS
-- ==========================================
local function buildSettings()
    clearContent()
    local order = 0
    local function nextOrder() order = order + 1; return order end

    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, 0, 0, 32)
    t.BackgroundTransparency = 1
    t.Text = "Settings"
    t.TextColor3 = Theme.OrangeAccent
    t.Font = Enum.Font.GothamBold
    t.TextSize = 22
    t.TextXAlignment = Enum.TextXAlignment.Left
    t.LayoutOrder = nextOrder()
    t.Parent = ContentFrame

    createCard("VizHub V6.5", "Viz23 Edition", nextOrder(), false)

    createSectionLabel("Keybind", nextOrder())

    local keyRow = Instance.new("Frame")
    keyRow.Size = UDim2.new(1, -10, 0, 42)
    keyRow.BackgroundColor3 = Theme.CardBackground
    keyRow.BorderSizePixel = 0
    keyRow.LayoutOrder = nextOrder()
    keyRow.Parent = ContentFrame

    local krc = Instance.new("UICorner"); krc.CornerRadius = UDim.new(0, 6); krc.Parent = keyRow
    local krs = Instance.new("UIStroke"); krs.Color = Theme.StrokeColor; krs.Thickness = 1; krs.Parent = keyRow

    local KRL = Instance.new("TextLabel")
    KRL.Size = UDim2.new(0.6, 0, 1, 0)
    KRL.Position = UDim2.new(0, 12, 0, 0)
    KRL.BackgroundTransparency = 1
    KRL.Text = "Menu Key"
    KRL.TextColor3 = Theme.TextWhite
    KRL.Font = Enum.Font.GothamMedium
    KRL.TextSize = 13
    KRL.TextXAlignment = Enum.TextXAlignment.Left
    KRL.Parent = keyRow

    local KD = Instance.new("TextButton")
    KD.Size = UDim2.new(0, 80, 0, 26)
    KD.Position = UDim2.new(1, -90, 0.5, -13)
    KD.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    KD.Text = menuKeybindKey.Name
    KD.TextColor3 = Theme.TextWhite
    KD.Font = Enum.Font.GothamBold
    KD.TextSize = 12
    KD.Parent = keyRow
    local kdc = Instance.new("UICorner"); kdc.CornerRadius = UDim.new(0, 4); kdc.Parent = KD
    local kds = Instance.new("UIStroke"); kds.Color = Theme.StrokeColor; kds.Thickness = 1; kds.Parent = KD

    KD.MouseButton1Click:Connect(function()
        startKeyRebind(KD)
    end)

    createToggleButton("Enable Menu Keybind", nextOrder(), menuKeybindActive, function(state)
        menuKeybindActive = state
        if menuKeybindConn then menuKeybindConn:Disconnect(); menuKeybindConn = nil end
        if state then
            menuKeybindConn = UserInputService.InputBegan:Connect(function(input, gpe)
                if gpe then return end
                if not menuKeybindActive then return end
                if rebindingKey then return end
                if input.KeyCode == menuKeybindKey then
                    if menuOpen then
                        closeMenu()
                    else
                        openMenu()
                    end
                end
            end)
        end
    end)

    createCard("Keybind info", "Click the key button to change the key.\nThen press the key to show/hide the menu.", nextOrder(), false)

    createSectionLabel("Actions", nextOrder())

    local UnloadBtn = Instance.new("TextButton")
    UnloadBtn.Size = UDim2.new(1, -10, 0, 46)
    UnloadBtn.BackgroundColor3 = Color3.fromRGB(120, 30, 30)
    UnloadBtn.BorderSizePixel = 0
    UnloadBtn.Text = "  Unload Hub"
    UnloadBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    UnloadBtn.Font = Enum.Font.GothamBold
    UnloadBtn.TextSize = 14
    UnloadBtn.TextXAlignment = Enum.TextXAlignment.Left
    UnloadBtn.LayoutOrder = nextOrder()
    UnloadBtn.Parent = ContentFrame

    local uc = Instance.new("UICorner"); uc.CornerRadius = UDim.new(0, 6); uc.Parent = UnloadBtn
    local us = Instance.new("UIStroke"); us.Color = Color3.fromRGB(255, 70, 70); us.Thickness = 1; us.Parent = UnloadBtn

    UnloadBtn.MouseEnter:Connect(function()
        TweenService:Create(UnloadBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(180, 40, 40)}):Play()
    end)
    UnloadBtn.MouseLeave:Connect(function()
        TweenService:Create(UnloadBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(120, 30, 30)}):Play()
    end)

    UnloadBtn.MouseButton1Click:Connect(function()
        local notifyGui = Instance.new("ScreenGui")
        notifyGui.Name = "VizUnloadNotify"
        notifyGui.Parent = game.CoreGui
        local NF = Instance.new("Frame")
        NF.Size = UDim2.new(0, 250, 0, 60)
        NF.Position = UDim2.new(0.5, -125, 0.5, -30)
        NF.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        NF.BorderSizePixel = 0
        NF.Parent = notifyGui
        local nfc = Instance.new("UICorner"); nfc.CornerRadius = UDim.new(0, 10); nfc.Parent = NF
        local nfs = Instance.new("UIStroke"); nfs.Color = Color3.fromRGB(255, 70, 70); nfs.Thickness = 2; nfs.Parent = NF
        local NL = Instance.new("TextLabel")
        NL.Size = UDim2.new(1, -20, 1, -20)
        NL.Position = UDim2.new(0, 10, 0, 10)
        NL.BackgroundTransparency = 1
        NL.Text = "Unloading VizHub..."
        NL.TextColor3 = Color3.fromRGB(255, 255, 255)
        NL.Font = Enum.Font.GothamBold
        NL.TextSize = 16
        NL.Parent = NF
        task.wait(0.8)
        unloadHub()
    end)

    createSectionLabel("Info", nextOrder())
    createCard("Developer", "Viz23\nAll scripts are for educational purposes only.\nUse at your own risk.", nextOrder(), false)

    task.wait()
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 20)
end

-- ==========================================
-- TAB BUTTONS
-- ==========================================
local tabBuilders = {buildHome, buildHubs, buildUniversalScripts, buildFeAnimations, buildUniversal, buildPlayer, buildSettings}
local tabNames    = {"Main", "Hubs", "Universal Scripts", "FE Animations", "Local", "Others", "Settings"}

for i, name in ipairs(tabNames) do
    local TabBtn = Instance.new("TextButton")
    TabBtn.Size = UDim2.new(1, -10, 0, 40)
    TabBtn.Position = UDim2.new(0, 5, 0, 5 + ((i-1) * 45))
    TabBtn.BackgroundColor3 = Theme.TopBarSideBar
    TabBtn.Text = "  " .. name
    TabBtn.TextSize = 14
    TabBtn.TextColor3 = Theme.TextWhite
    TabBtn.Font = Enum.Font.GothamMedium
    TabBtn.TextXAlignment = Enum.TextXAlignment.Left
    TabBtn.Parent = SideBar

    local tc = Instance.new("UICorner"); tc.CornerRadius = UDim.new(0, 6); tc.Parent = TabBtn

    table.insert(tabs, TabBtn)

    TabBtn.MouseButton1Click:Connect(function()
        setActiveTab(i)
        tabBuilders[i]()
    end)
end

-- ==========================================
-- PLAYER INFO
-- ==========================================
local PlayerFrame = Instance.new("Frame")
PlayerFrame.Size = UDim2.new(1, -10, 0, 45)
PlayerFrame.Position = UDim2.new(0, 5, 1, -50)
PlayerFrame.BackgroundColor3 = Theme.TopBarSideBar
PlayerFrame.BorderSizePixel = 0
PlayerFrame.Parent = SideBar

local pc = Instance.new("UICorner"); pc.CornerRadius = UDim.new(0, 6); pc.Parent = PlayerFrame

local AI = Instance.new("ImageLabel")
AI.Size = UDim2.new(0, 35, 0, 35)
AI.Position = UDim2.new(0, 5, 0, 5)
AI.BackgroundTransparency = 1
AI.Image = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId .. "&w=150&h=150"
AI.Parent = PlayerFrame

local ac = Instance.new("UICorner"); ac.CornerRadius = UDim.new(1, 0); ac.Parent = AI

local PN = Instance.new("TextLabel")
PN.Size = UDim2.new(0, 110, 0, 15)
PN.Position = UDim2.new(0, 45, 0, 7)
PN.BackgroundTransparency = 1
PN.Text = (LocalPlayer.DisplayName and LocalPlayer.DisplayName ~= "" and LocalPlayer.DisplayName) or LocalPlayer.Name
PN.TextColor3 = Theme.TextWhite
PN.Font = Enum.Font.GothamBold
PN.TextSize = 12
PN.TextXAlignment = Enum.TextXAlignment.Left
PN.TextTruncate = Enum.TextTruncate.AtEnd
PN.Parent = PlayerFrame

local PS = Instance.new("TextLabel")
PS.Size = UDim2.new(0, 110, 0, 15)
PS.Position = UDim2.new(0, 45, 0, 23)
PS.BackgroundTransparency = 1
PS.Text = "@" .. LocalPlayer.Name
PS.TextColor3 = Theme.TextGray
PS.Font = Enum.Font.Gotham
PS.TextSize = 11
PS.TextXAlignment = Enum.TextXAlignment.Left
PS.TextTruncate = Enum.TextTruncate.AtEnd
PS.Parent = PlayerFrame

setActiveTab(1)
buildHome()

UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 20)
end)

-- ==========================================
-- DRAGGING
-- ==========================================
local dragging = false
local dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then update(input) end
end)

-- ==========================================
-- SHOW INTRO → OPEN MENU
-- ==========================================
showIntro(function()
    openMenu()
    print("[VizHub] Loaded")
end)