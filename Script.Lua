local ToggleKey = "m"
local ToggleKeyUpper = "M"

function ToggleBeautification()
	local GR = false
	local Nothing = "http://www.roblox.com/asset/?id=1197893602"
	local W = "http://www.roblox.com/asset/?id=1442612087"
	local G = "http://www.roblox.com/asset/?id=2509968186"
	local B = "http://www.roblox.com/asset/?id=542765884"
	local CF = "https://assetdelivery.roblox.com/v1/asset/?id=4586707167"
	for i, v in pairs(game:GetService("Players"):GetPlayers()) do
		local char = v.Character
		local UT = char.UpperTorso
		if UT.MeshId == W or UT.MeshId == G or UT.MeshId == B or UT.MeshId == CF then
			GR = true
			if char:FindFirstChild("Shirt") then
				char.Shirt.ShirtTemplate = Nothing
			else
				local Shirt = Instance.new("Shirt")
				Shirt.Name = "Shirt"
				Shirt.Parent = char
				Shirt.ShirtTemplate = Nothing
			end

			if char:FindFirstChild("Pants") then
				char.Pants.PantsTemplate = Nothing
			else
				local Pants = Instance.new("Pants")
				Pants.Name = "Pants"
				Pants.Parent = char
				Pants.PantsTemplate = Nothing
			end
			
			if char:FindFirstChild("Shirt Graphic") then
				char["Shirt Graphic"].Graphic = Nothing
			end

			local Image, Ready = game:GetService("Players"):GetUserThumbnailAsync(v.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
			game.StarterGui:SetCore("SendNotification", {
				Title = 'Player: '..v.Name,
				Text = "Now has no Clothes!",
				Icon = Image,
				Duration = 5
			})
		end
	end
	if GR == false then
		game.StarterGui:SetCore("SendNotification", {
			Title = 'No Girls Found!',
			Text = ":(",
			Duration = 5
		})
	end
	GR = false
end

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

mouse.KeyDown:Connect(function(key)
	if key:lower() == ToggleKey or key:upper() == ToggleKeyUpper then
		ToggleBeautification()
	end
end)
