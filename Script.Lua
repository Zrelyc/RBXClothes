local Avatar = Instance.new("ScreenGui")
local Frame = Instance.new("ImageLabel")
local Title = Instance.new("TextLabel")
local TitleImage = Instance.new("ImageLabel")
local Execute = Instance.new("TextButton")
local ExecuteImage = Instance.new("ImageLabel")
local EveryoneToggle = Instance.new("TextButton")
local EveryoneToggleImage = Instance.new("ImageLabel")
local EveryoneToggle_2 = Instance.new("TextButton")
local EveryoneImage = Instance.new("ImageLabel")

local OnlyG = true

function executeAvatars()
	local None = "http://www.roblox.com/asset/?id=1197893602"
	if OnlyG == true then
		for i, v in pairs(game:GetService("Players"):GetPlayers()) do
			local W = "http://www.roblox.com/asset/?id=1442612087"
			local G = "http://www.roblox.com/asset/?id=2509968186"
			local B = "http://www.roblox.com/asset/?id=542765884"
			local CF = "https://assetdelivery.roblox.com/v1/asset/?id=4586707167"
			local UT = v.Character.UpperTorso
			local char = v.Character
			local Girl = false
			if char then
				if UT.MeshId == W or UT.MeshId == G or UT.MeshId == B or UT.MeshId == CF then
					Girl = true
					if char:FindFirstChild("Shirt") then
						char.Shirt.ShirtTemplate = None
					else
						local Shirt = Instance.new("Shirt")
						Shirt.Parent = char
						Shirt.Name = "Shirt"
						Shirt.ShirtTemplate = None
					end
					if char:FindFirstChild("Shirt Graphic") then
						char["Shirt Graphic"].Graphic = None
					end
					if char:FindFirstChild("Pants") then
						char.Pants.PantsTemplate = None
					else
						local Pants = Instance.new("Pants")
						Pants.Parent = char
						Pants.Name = "Pants"
						Pants.PantsTemplate = None
					end
					local Image, Ready = game:GetService("Players"):GetUserThumbnailAsync(v.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
					game.StarterGui:SetCore("SendNotification", {
						Title = 'Player: '..v.Name,
						Text = "Now has nothing! ;)",
						Icon = Image,
						Duration = 5
					})
				end
				if Girl == false then
					local Image, Ready = game:GetService("Players"):GetUserThumbnailAsync(v.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
					game.StarterGui:SetCore("SendNotification", {
						Title = ':(',
						Text = "No Girls Found!",
						Duration = 5
					})
				end
			end
		end
	else
		for i, v in pairs(game:GetService("Players"):GetPlayers()) do
			local char = v.Character
			if char then
				if char:FindFirstChild("Shirt") then
					char.Shirt.ShirtTemplate = None
				else
					local Shirt = Instance.new("Shirt")
					Shirt.Parent = char
					Shirt.Name = "Shirt"
					Shirt.ShirtTemplate = None
				end
				if char:FindFirstChild("Shirt Graphic") then
					char["Shirt Graphic"].Graphic = None
				end
				if char:FindFirstChild("Pants") then
					char.Pants.PantsTemplate = None
				else
					local Pants = Instance.new("Pants")
					Pants.Parent = char
					Pants.Name = "Pants"
					Pants.PantsTemplate = None
				end
				local Image, Ready = game:GetService("Players"):GetUserThumbnailAsync(v.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
				game.StarterGui:SetCore("SendNotification", {
					Title = 'Player: '..v.Name,
					Text = "Now has nothing! ;)",
					Icon = Image,
					Duration = 5
				})
			end
		end
	end
end

Avatar.Name = "Avatar"
Avatar.Parent = game.CoreGui

Frame.Name = "Frame"
Frame.Parent = Avatar
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Position = UDim2.new(0, 51, 0, 402)
Frame.Size = UDim2.new(0, 369, 0, 225)
Frame.Image = "rbxassetid://3570695787"
Frame.ImageColor3 = Color3.fromRGB(50, 50, 50)
Frame.ScaleType = Enum.ScaleType.Slice
Frame.SliceCenter = Rect.new(100, 100, 100, 100)
Frame.SliceScale = 0.120
Frame.Draggable = true
Frame.Active = true

Title.Name = "Title"
Title.Parent = Frame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0, 8, 0, 8)
Title.Size = UDim2.new(0, 352, 0, 50)
Title.ZIndex = 2
Title.Font = Enum.Font.FredokaOne
Title.Text = "Avatar Editer"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 41.000

TitleImage.Name = "TitleImage"
TitleImage.Parent = Title
TitleImage.AnchorPoint = Vector2.new(0.5, 0.5)
TitleImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TitleImage.BackgroundTransparency = 1.000
TitleImage.Position = UDim2.new(0.5, 0, 0.5, 0)
TitleImage.Size = UDim2.new(1, 0, 1, 0)
TitleImage.Image = "rbxassetid://3570695787"
TitleImage.ImageColor3 = Color3.fromRGB(33, 33, 33)
TitleImage.ScaleType = Enum.ScaleType.Slice
TitleImage.SliceCenter = Rect.new(100, 100, 100, 100)
TitleImage.SliceScale = 0.120
local db = os.clock()
Execute.Name = "Execute"
Execute.Parent = Frame
Execute.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Execute.BackgroundTransparency = 1.000
Execute.BorderSizePixel = 0
Execute.Position = UDim2.new(0, 8, 0, 165)
Execute.Size = UDim2.new(0, 352, 0, 50)
Execute.ZIndex = 2
Execute.Font = Enum.Font.FredokaOne
Execute.Text = "Change Avatars"
Execute.TextColor3 = Color3.fromRGB(0, 255, 255)
Execute.TextSize = 34.000
Execute.MouseButton1Down:Connect(function()
	if os.clock() - db < 5 then
		return
	end
	executeAvatars()
	db = os.clock()
end)

ExecuteImage.Name = "ExecuteImage"
ExecuteImage.Parent = Execute
ExecuteImage.Active = true
ExecuteImage.AnchorPoint = Vector2.new(0.5, 0.5)
ExecuteImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ExecuteImage.BackgroundTransparency = 1.000
ExecuteImage.Position = UDim2.new(0.5, 0, 0.5, 0)
ExecuteImage.Selectable = true
ExecuteImage.Size = UDim2.new(1, 0, 1, 0)
ExecuteImage.Image = "rbxassetid://3570695787"
ExecuteImage.ImageColor3 = Color3.fromRGB(94, 94, 94)
ExecuteImage.ScaleType = Enum.ScaleType.Slice
ExecuteImage.SliceCenter = Rect.new(100, 100, 100, 100)
ExecuteImage.SliceScale = 0.120

EveryoneToggle.Name = "EveryoneToggle"
EveryoneToggle.Parent = Frame
EveryoneToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EveryoneToggle.BackgroundTransparency = 1.000
EveryoneToggle.BorderSizePixel = 0
EveryoneToggle.Position = UDim2.new(0, 8, 0, 87)
EveryoneToggle.Size = UDim2.new(0, 283, 0, 50)
EveryoneToggle.ZIndex = 2
EveryoneToggle.Font = Enum.Font.FredokaOne
EveryoneToggle.Text = "Everyone"
EveryoneToggle.TextColor3 = Color3.fromRGB(0, 255, 255)
EveryoneToggle.TextSize = 34.000

EveryoneToggleImage.Name = "EveryoneToggleImage"
EveryoneToggleImage.Parent = EveryoneToggle
EveryoneToggleImage.Active = true
EveryoneToggleImage.AnchorPoint = Vector2.new(0.5, 0.5)
EveryoneToggleImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EveryoneToggleImage.BackgroundTransparency = 1.000
EveryoneToggleImage.Position = UDim2.new(0.5, 0, 0.5, 0)
EveryoneToggleImage.Selectable = true
EveryoneToggleImage.Size = UDim2.new(1, 0, 1, 0)
EveryoneToggleImage.Image = "rbxassetid://3570695787"
EveryoneToggleImage.ImageColor3 = Color3.fromRGB(94, 94, 94)
EveryoneToggleImage.ScaleType = Enum.ScaleType.Slice
EveryoneToggleImage.SliceCenter = Rect.new(100, 100, 100, 100)
EveryoneToggleImage.SliceScale = 0.120

EveryoneToggle_2.Name = "EveryoneToggle"
EveryoneToggle_2.Parent = Frame
EveryoneToggle_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EveryoneToggle_2.BackgroundTransparency = 1.000
EveryoneToggle_2.BorderSizePixel = 0
EveryoneToggle_2.Position = UDim2.new(0, 310, 0, 87)
EveryoneToggle_2.Size = UDim2.new(0, 50, 0, 50)
EveryoneToggle_2.ZIndex = 2
EveryoneToggle_2.Font = Enum.Font.FredokaOne
EveryoneToggle_2.Text = ""
EveryoneToggle_2.TextColor3 = Color3.fromRGB(0, 255, 255)
EveryoneToggle_2.TextSize = 34.000
EveryoneToggle_2.MouseButton1Down:Connect(function()
	if EveryoneToggle_2.EveryoneImage.ImageColor3 == Color3.fromRGB(85, 255, 0) then
		EveryoneToggle_2.EveryoneImage.ImageColor3 = Color3.fromRGB(255, 0, 0)
		OnlyG = true
	elseif EveryoneToggle_2.EveryoneImage.ImageColor3 == Color3.fromRGB(255, 0, 0) then
		EveryoneToggle_2.EveryoneImage.ImageColor3 = Color3.fromRGB(85, 255, 0)
		OnlyG = false
	end
end)

EveryoneImage.Name = "EveryoneImage"
EveryoneImage.Parent = EveryoneToggle_2
EveryoneImage.Active = true
EveryoneImage.AnchorPoint = Vector2.new(0.5, 0.5)
EveryoneImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EveryoneImage.BackgroundTransparency = 1.000
EveryoneImage.Position = UDim2.new(0.5, 0, 0.5, 0)
EveryoneImage.Selectable = true
EveryoneImage.Size = UDim2.new(1, 0, 1, 0)
EveryoneImage.Image = "rbxassetid://3570695787"
EveryoneImage.ImageColor3 = Color3.fromRGB(255, 0, 0)
EveryoneImage.ScaleType = Enum.ScaleType.Slice
EveryoneImage.SliceCenter = Rect.new(100, 100, 100, 100)
EveryoneImage.SliceScale = 0.120

local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()
Mouse.KeyDown:Connect(function(key)
	if key:lower() == "m" or key:upper() == "M" then
		if Avatar.Enabled == true then
			Avatar.Enabled = false
		elseif Avatar.Enabled == false then
			Avatar.Enabled = true
		end
	end
end)
