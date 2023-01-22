local Selection = game:GetService("Selection")
local ChangeHistoryService = game:GetService("ChangeHistoryService")

local prefix = "[UI] "

local toolbar = plugin:CreateToolbar("UI Tools")
local aspectRatioBtn = toolbar:CreateButton("Aspect Ratio", "Create (or modify) a UI Aspect Ratio Instance, and automatically adjust it's properties.", "rbxassetid://12214409131")
local offsetToScale = toolbar:CreateButton("Offset Converter", "Convert UI Objects' GUI Offset Size to Scale.", "rbxassetid://12213964515")
local output = toolbar:CreateButton("Output", "Toggle output from the Plugin. Useful for debugging.", "rbxassetid://12214016554")
-- local setting = toolbar:CreateButton("Settings", "Configure plugin settings, like binding keys on your keyboard to specific functions.", "rbxassetid://12237293540")

aspectRatioBtn.ClickableWhenViewportHidden = true
offsetToScale.ClickableWhenViewportHidden = true
output.ClickableWhenViewportHidden = true
-- setting.ClickableWhenViewportHidden = true

local outputFindings = false

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

local function offsetScale()
	local selected = Selection:Get()
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
		
		if sel.Size.X.Offset == size.X and sel.Size.Y.Offset == size.Y then
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

--[[ OUTPUT TOGGLE ]]

local function toggleOutput()
	if outputFindings then outputFindings = false print(prefix.."Disabled Console Output") else outputFindings = true print(prefix.."Enabled Console Output") end
end

--[[ SETTINGS MENU ]]

--[[
local function settingsOpened()
	
end
]]

--[[ MOUSE BUTTON DETECTION ]]

output.Click:Connect(toggleOutput)
aspectRatioBtn.Click:Connect(aspectRatio)
offsetToScale.Click:Connect(offsetScale)
-- setting.Click:Connect(settingsOpened)

--[[ OTHER ]]

if outputFindings then print(prefix.."Started UI Tools!") end
