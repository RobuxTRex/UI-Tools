local Selection = game:GetService("Selection")
local ChangeHistoryService = game:GetService("ChangeHistoryService")
local UserInputService = game:GetService("UserInputService")

local prefix = "[UI] "

local toolbar = plugin:CreateToolbar("UI Tools")
local aspectRatioBtn = toolbar:CreateButton("Aspect Ratio", "Create (or modify) a UI Aspect Ratio Instance, and automatically adjust it's properties.", "rbxassetid://12214409131")
local offsetToScale = toolbar:CreateButton("Offset Converter", "Convert UI Objects' GUI Offset Size to Scale.", "rbxassetid://12213964515")
local templateButton = toolbar:CreateButton("Template", "Save & Import your favourite GUIs straight from this plugin! You can also import others' via the Website.", "rbxassetid://12251115717")
local setting = toolbar:CreateButton("Settings", "Configure plugin settings, like binding keys on your keyboard to specific functions.", "rbxassetid://12247119565")

aspectRatioBtn.ClickableWhenViewportHidden = true
offsetToScale.ClickableWhenViewportHidden = true
setting.ClickableWhenViewportHidden = true

local outputFindings = false
local settingsEnabled = false
local templateGuiEnabled = false

local offsetKeybind = Enum.KeyCode.End
local scaleKeybind = Enum.KeyCode.Home
local AspectRatioKeybind = Enum.KeyCode.Insert

--[[ DATASTORE ]]

local outputData = plugin:GetSetting("settings") or {
	Collections = {
		outputFindings,
	}
}

local function saveData(datastore, data)
	local success,err = pcall(function()
		plugin:SetSetting(datastore, data)
	end)
	
	if not success then warn(prefix..err) end
	return success
end

local function getData(datastore)
	return plugin:GetSetting(datastore)
end

--[[ GUI ]]

---[[[ SETTINGS ]]]

local Settings = Instance.new("Frame")
local AspectRatio_2 = Instance.new("UIAspectRatioConstraint")
local Header = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("ImageLabel")
local Settings_2 = Instance.new("Frame")
local Output = Instance.new("Frame")
local Checkmark = Instance.new("ImageButton")
local ImageLabel = Instance.new("ImageLabel")
local UICorner_2 = Instance.new("UICorner")
local GitHub = Instance.new("ImageLabel")
local Copyright = Instance.new("ImageLabel")
local Input = Instance.new("TextButton")
local CornerUI = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local Output = Instance.new("Frame")
local Checkmark = Instance.new("ImageButton")
local ImageLabel = Instance.new("ImageLabel")
local Input_2 = Instance.new("TextButton")
local CornerUI_2 = Instance.new("UICorner")
local TextLabel_2 = Instance.new("TextLabel")
local Input_3 = Instance.new("TextButton")
local CornerUI_3 = Instance.new("UICorner")
local TextLabel_3 = Instance.new("TextLabel")

CornerUI.CornerRadius = UDim.new(0.100000001, 0)
CornerUI.Name = "CornerUI"
CornerUI.Parent = Input

Output.Name = "Output"
Output.Parent = Settings_2
Output.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Output.BackgroundTransparency = 1.000
Output.Position = UDim2.new(0.0289389063, 0, 0.0323450193, 0)
Output.Size = UDim2.new(0.427419364, 0, 0.12702702, 0)

Checkmark.Name = "Checkmark"
Checkmark.Parent = Output
Checkmark.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Checkmark.BackgroundTransparency = 1.000
Checkmark.Position = UDim2.new(0.0220391974, 0, -0.0561500452, 0)
Checkmark.Size = UDim2.new(0.181132078, 0, 1.00000012, 0)
Checkmark.Image = "rbxassetid://12247726664"

ImageLabel.Parent = Output
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.Position = UDim2.new(0.204565063, 0, -0.0139824552, 0)
ImageLabel.Size = UDim2.new(0.747169793, 0, 1.00000012, 0)
ImageLabel.ZIndex = 5
ImageLabel.Image = "rbxassetid://12247834865"

Input_2.Name = "Input"
Input_2.Parent = AspectRatio
Input_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Input_2.Position = UDim2.new(0, 0, 0.479166657, 0)
Input_2.Size = UDim2.new(0, 174, 0, 50)
Input_2.Font = Enum.Font.SourceSans
Input_2.Text = ""
Input_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Input_2.TextSize = 14.000
Input_2.TextColor3 = Color3.fromRGB(255,255,255)
Input_2.TextScaled = true

CornerUI_2.CornerRadius = UDim.new(0.100000001, 0)
CornerUI_2.Name = "CornerUI"
CornerUI_2.Parent = Input_2

TextLabel_2.Parent = AspectRatio
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.Size = UDim2.new(0, 174, 0, 50)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "Offset to Scale"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14.000
TextLabel_2.TextWrapped = true

CornerUI_3.CornerRadius = UDim.new(0.100000001, 0)
CornerUI_3.Name = "CornerUI"
CornerUI_3.Parent = Input_3

Settings.Name = "Settings"
Settings.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Settings.Size = UDim2.new(0, 622, 0, 420)

AspectRatio_2.Name = "AspectRatio"
AspectRatio_2.Parent = Settings
AspectRatio_2.AspectRatio = 1.477
AspectRatio_2.DominantAxis = Enum.DominantAxis.Height

Header.Name = "Header"
Header.Parent = Settings
Header.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Header.Size = UDim2.new(0, 620, 0, 49)

UICorner.CornerRadius = UDim.new(0.100000001, 0)
UICorner.Parent = Header

Title.Name = "Title"
Title.Parent = Header
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0.172025725, 0, 0.0799999982, 0)
Title.Size = UDim2.new(0, 406, 0, 41)
Title.Image = "rbxassetid://12247755927"

Settings_2.Name = "Settings"
Settings_2.Parent = Settings
Settings_2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Settings_2.BorderSizePixel = 0
Settings_2.Position = UDim2.new(0, 0, 0.118764892, 0)
Settings_2.Size = UDim2.new(0, 620, 0, 370)

Output.Name = "Output"
Output.Parent = Settings_2
Output.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Output.BackgroundTransparency = 1.000
Output.Position = UDim2.new(0.0289389063, 0, 0.0323450193, 0)
Output.Size = UDim2.new(0, 265, 0, 47)

Checkmark.Name = "Checkmark"
Checkmark.Parent = Output
Checkmark.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Checkmark.BackgroundTransparency = 1.000
Checkmark.Position = UDim2.new(0.0220391974, 0, -0.0348157883, 0)
Checkmark.Size = UDim2.new(0, 48, 0, 47)
Checkmark.Image = "rbxassetid://12247726664"

ImageLabel.Parent = Output
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.Position = UDim2.new(0.204565063, 0, -0.0139824552, 0)
ImageLabel.Size = UDim2.new(0, 198, 0, 47)
ImageLabel.ZIndex = 5
ImageLabel.Image = "rbxassetid://12247834865"

UICorner_2.CornerRadius = UDim.new(0.0199999996, 0)
UICorner_2.Parent = Settings

GitHub.Name = "GitHub"
GitHub.Parent = Settings
GitHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GitHub.BackgroundTransparency = 1.000
GitHub.Position = UDim2.new(0, 0, 0.790973961, 0)
GitHub.Size = UDim2.new(0, 620, 0, 47)
GitHub.Image = "rbxassetid://12247787516"

Copyright.Name = "Copyright"
Copyright.Parent = Settings
Copyright.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Copyright.BackgroundTransparency = 1.000
Copyright.Position = UDim2.new(0.258842438, 0, 0.883610487, 0)
Copyright.Size = UDim2.new(0, 299, 0, 47)
Copyright.Image = "rbxassetid://12247794854"

---[[[ UI TEMPLATES ]]]

local Templates = Instance.new("Frame")
AspectRatio = Instance.new("UIAspectRatioConstraint")
Header = Instance.new("Frame")
UICorner = Instance.new("UICorner")
local Title = Instance.new("ImageLabel")
local Main = Instance.new("Frame")
local Saves = Instance.new("Frame")
local SaveOne = Instance.new("ImageButton")
local Corner = Instance.new("UICorner")
local SaveTwo = Instance.new("ImageButton")
local Corner_2 = Instance.new("UICorner")
local SaveThree = Instance.new("ImageButton")
local Corner_3 = Instance.new("UICorner")
local OR = Instance.new("ImageLabel")
local Search = Instance.new("ImageLabel")
local Info = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Blur = Instance.new("ImageLabel")
local Error = Instance.new("ImageLabel")

Templates.Name = "Templates"
Templates.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Templates.Size = UDim2.new(0, 619, 0, 418)

AspectRatio.Name = "AspectRatio"
AspectRatio.Parent = Templates
AspectRatio.AspectRatio = 1.477
AspectRatio.DominantAxis = Enum.DominantAxis.Height

Header.Name = "Header"
Header.Parent = Templates
Header.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Header.Size = UDim2.new(0, 618, 0, 48)

UICorner.CornerRadius = UDim.new(0.100000001, 0)
UICorner.Parent = Header

Title.Name = "Title"
Title.Parent = Header
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0.172025725, 0, 0.0799999982, 0)
Title.Size = UDim2.new(0.654838681, 0, 0.836734712, 0)
Title.Image = "rbxassetid://12249479259"

Main.Name = "Main"
Main.Parent = Templates
Main.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0, 0, 0.116372548, 0)
Main.Size = UDim2.new(0, 618, 0, 369)
Main.Visible = false

Saves.Name = "Saves"
Saves.Parent = Main
Saves.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Saves.Position = UDim2.new(0.024271844, 0, 0.032520324, 0)
Saves.Size = UDim2.new(0.378640771, 0, 0.937669396, 0)

SaveOne.Name = "SaveOne"
SaveOne.Parent = Saves
SaveOne.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SaveOne.Position = UDim2.new(0.051282052, 0, 0.0375723466, 0)
SaveOne.Size = UDim2.new(0, 209, 0, 82)
SaveOne.Image = "rbxassetid://12250237517"

Corner.CornerRadius = UDim.new(0.100000001, 0)
Corner.Name = "Corner"
Corner.Parent = SaveOne

SaveTwo.Name = "SaveTwo"
SaveTwo.Parent = Saves
SaveTwo.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SaveTwo.Position = UDim2.new(0.051282052, 0, 0.309248656, 0)
SaveTwo.Size = UDim2.new(0, 209, 0, 82)
SaveTwo.Image = "rbxassetid://12250237517"

Corner_2.CornerRadius = UDim.new(0.100000001, 0)
Corner_2.Name = "Corner"
Corner_2.Parent = SaveTwo

SaveThree.Name = "SaveThree"
SaveThree.Parent = Saves
SaveThree.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SaveThree.Position = UDim2.new(0.051282052, 0, 0.583815098, 0)
SaveThree.Size = UDim2.new(0, 209, 0, 82)
SaveThree.Image = "rbxassetid://12250343162"

Corner_3.CornerRadius = UDim.new(0.100000001, 0)
Corner_3.Name = "Corner"
Corner_3.Parent = SaveThree

OR.Name = "OR"
OR.Parent = Saves
OR.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OR.BackgroundTransparency = 1.000
OR.Position = UDim2.new(0.43589744, 0, 0.841040492, 0)
OR.Size = UDim2.new(0, 28, 0, 14)
OR.Image = "rbxassetid://12250296347"

Search.Name = "Search"
Search.Parent = Saves
Search.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Search.BackgroundTransparency = 1.000
Search.Position = UDim2.new(0.025641026, 0, 0.881502867, 0)
Search.Size = UDim2.new(0, 222, 0, 31)
Search.Image = "rbxassetid://12250890688"

Info.Name = "Info"
Info.Parent = Main
Info.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Info.Position = UDim2.new(0.419093847, 0, 0.032520324, 0)
Info.Size = UDim2.new(0, 345, 0, 346)

UICorner_2.CornerRadius = UDim.new(0.0199999996, 0)
UICorner_2.Parent = Templates

Blur.Name = "Blur"
Blur.Parent = Templates
Blur.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Blur.Position = UDim2.new(0, 0, 0.114832535, 0)
Blur.Size = UDim2.new(0.999080658, 0, 0.88516748, 0)
Blur.Image = "rbxassetid://12250950358"

Error.Name = "Error"
Error.Parent = Templates
Error.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Error.BackgroundTransparency = 1.000
Error.Position = UDim2.new(0, 0, 0.114832535, 0)
Error.Size = UDim2.new(0.999080658, 0, 0.88516748, 0)
Error.Image = "rbxassetid://12250987424"

--[[ KEYBINDS ]]

--[[ ASPECT RATIO ]]

local function aspectRatio()
	local selected = Selection:Get()
	local sel = selected[1]
	local ratio = 1

	if (not (#selected == 1)) and outputFindings then warn(prefix.."Please only select one Instance in the Explorer.") end

	local dominant = Enum.DominantAxis.Width

	if sel:IsA("GuiObject") then

		for i = 1, #sel:GetChildren() do
			if sel:GetChildren()[i].ClassName == "UIAspectRatioConstraint" then continue end
		end

		local x = sel.AbsoluteSize.X
		local y = sel.AbsoluteSize.Y

		if not (y > x) then dominant = Enum.DominantAxis.Height end

		ratio = x/y

		local AspectRatioInstance = Instance.new("UIAspectRatioConstraint")
		AspectRatioInstance.Parent = selected[1]
		AspectRatioInstance.Name = "AspectRatio"
		AspectRatioInstance.AspectRatio = ratio
		AspectRatioInstance.DominantAxis = dominant

	elseif sel.ClassName == "UIAspectRatioConstraint" or sel:FindFirstChildWhichIsA("UIAspectRatioConstraint") then

		local x = sel.AbsoluteSize.X
		local y = sel.AbsoluteSize.Y

		ratio = x/y

		if not (y > x) then dominant = Enum.DominantAxis.Height end

		sel.AspectRatio = ratio
		sel.DominantAxis = dominant

	else

		error(prefix.."Encountered an error whilst trying to check if the selected object is a GUI Object or UIAspectRatioConstraint.")

	end

	if outputFindings then print(prefix..`Inserted a UI Aspect Ratio into as a child of the selected Instance '{sel}' with Aspect Ratio '{ratio}'`) end
	ChangeHistoryService:SetWaypoint("Created or Modified a UIAspectRatioConstraint.")	
end

--[[ OFFSET TO SCALE ]]

local function offsetScale(of)
	local selected = Selection:Get()
	if not selected then warn(prefix.."You must select an Instance in the Explorer to use this tool.") return end
	local from = "Scale"
	local to = "Offset"	
	for i = 1, #selected do
		local sel = selected[i]
		local ViewportSize = workspace.Camera.ViewportSize

		if not sel then
			warn("You must select a GUI Object in the Explorer.")
		end

		if not sel:IsA("GuiObject") then warn(prefix..`Please select a GUI object before converting, found '{sel.ClassName}'`) continue end

		local ancestor = sel:FindFirstAncestorWhichIsA("GuiBase2d")
		local parentSize = if ancestor then ancestor.AbsoluteSize else ViewportSize
		local size = sel.AbsoluteSize

		if (sel.Size.X.Offset == size.X and sel.Size.Y.Offset == size.Y) or of == 1 then
			sel.Size = UDim2.new(
				size.X / parentSize.X,
				0,
				size.Y / parentSize.Y,
				0
			)
			from = "Offset"
			to = "Scale"
		else
			sel.Size = UDim2.new(
				0,
				size.X,
				0,
				size.Y
			)
		end
		if outputFindings then print(prefix..`Successfully converted {sel} from {from} to {to}`) end
		ChangeHistoryService:SetWaypoint(`Converted UI from {from} to {to}.`)	
	end
end

--[[ SETTINGS MENU ]]

local settingsWidgetInfo = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float,
	false,
	false,
	622,
	418,
	622,
	418
)

local settingsWidget = plugin:CreateDockWidgetPluginGui("Settings", settingsWidgetInfo)
settingsWidget.Title = "Settings"
Settings.Parent = settingsWidget

local settingsMenu = Settings_2

local function outputEnabled()
	if outputFindings then
		outputFindings = false
		settingsMenu.Output.Checkmark.Image = "rbxassetid://12247726664" 
	else
		outputFindings = true
		settingsMenu.Output.Checkmark.Image = "rbxassetid://12247726927"
	end
end

local function settingsOpened()
	if settingsEnabled then
		settingsWidget.Enabled = false
		settingsEnabled = false
	else
		settingsWidget.Enabled = true
		settingsEnabled = true
	end
end

local function onOffsetClick()
	local key = offsetKeybind
	local btn = Input_3
	local keyName = "W"
	btn.Text = "Listening for Input..."
	local function onInputBegan(input)
		if input.UserInputType == Enum.UserInputType.Keyboard then
			key = input
			keyName = input.Name
			btn.Text = keyName
			offsetKeybind = key
		end
	end
	
	UserInputService.InputBegan:Connect(onInputBegan)
end

local function onScaleClick()
	local key = scaleKeybind
	local btn = Input_2
	local keyName = "W"
	btn.Text = "Listening for Input..."
	local function onInputBegan(input)
		if input.UserInputType == Enum.UserInputType.Keyboard then
			key = input
			keyName = input.Name
			btn.Text = keyName
			scaleKeybind = key
		end
	end

	UserInputService.InputBegan:Connect(onInputBegan)
end

local function onAspectRatioClick()
	local key = AspectRatioKeybind
	local btn = Input
	local keyName = "W"
	btn.Text = "Listening for Input..."
	local function onInputBegan(input)
		if input.UserInputType == Enum.UserInputType.Keyboard then
			key = UserInputService:GetStringForKeyCode(input)
			keyName = input.Name
			btn.Text = keyName
			AspectRatioKeybind = key
		end
	end

	UserInputService.InputBegan:Connect(onInputBegan)
end

settingsMenu.Output.Checkmark.MouseButton1Up:Connect(outputEnabled)
Input_3.MouseButton1Up:Connect(onOffsetClick)
Input_2.MouseButton1Up:Connect(onScaleClick)
Input.MouseButton1Up:Connect(onAspectRatioClick)

--[[ TEMPLATE MENU ]]

local templateWidgetInfo = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float,
	false,
	false,
	300,
	418,
	300,
	418
)

local templateWidget = plugin:CreateDockWidgetPluginGui("Templates", settingsWidgetInfo)
templateWidget.Title = "Templates"
Templates.Parent = templateWidget

local function templateOpened()
	if templateGuiEnabled then
		templateWidget.Enabled = false
		templateGuiEnabled = false
	else
		templateWidget.Enabled = true
		templateGuiEnabled = true
	end
end

--[[ MOUSE BUTTON DETECTION ]]

aspectRatioBtn.Click:Connect(aspectRatio)
offsetToScale.Click:Connect(offsetScale)
setting.Click:Connect(settingsOpened)
templateButton.Click:Connect(templateOpened)

---[[[ KEYBIND DETECTION ]]]

----[[[[ ACTION ]]]]

local pluginoffset = plugin:CreatePluginAction("Offset -> Scale", true, "Converts the selected Instance from Offset to Scale.", "Converts the selected Instance from Offset to Scale.")
local pluginscale = plugin:CreatePluginAction("Scale -> Offset", true, "Converts the selected Instance from Scale to Offset.", "Converts the selected Instance from Scale to Offset.")
local pluginaspect = plugin:CreatePluginAction("Create Aspect Ratio", true, "Creates a UIAspectRatioConstraint in the selected Instance and modifies it's properties automatically.", "Creates a UIAspectRatioConstraint in the selected Instance and modifies it's properties automatically.")

----[[[[ DETECTION ]]]]

pluginoffset.Triggered:Connect(offsetToScale)
pluginscale.Triggered:Connect(offsetToScale(1))
pluginaspect.Triggered:Connect(aspectRatio)

--[[ OTHER ]]

local dat = getData("settings")
if dat[1] == true then outputFindings = true else outputFindings = false end
if outputFindings then print(prefix.."Started UI Tools!") end
