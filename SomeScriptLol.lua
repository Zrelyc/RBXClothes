local ESPisON = true

local ESPInstances = {}

local Roles = {
	Murderer = nil,
	Sheriff = nil,
	Closest = nil
}

local WeaponNames = {
	Knife = {
		Index = "Murderer";
		Color = Color3.fromRGB(255, 0, 0)
	},
	Gun = {
		Index = "Sheriff";
		Color = Color3.fromRGB(85, 0, 255)
	}
}

local AttackAnimations = {
	"rbxassetid://2467567750";
	"rbxassetid://1957618848";
	"rbxassetid://2470501967";
	"rbxassetid://2467577524";
}


function NotifyRoles()
	local Data = game.ReplicatedStorage:FindFirstChild("GetPlayerData"):InvokeServer()
	for i, v in pairs (Data) do
		for _, y in pairs (v) do
			for _, player in pairs(game.Players:GetPlayers()) do
				if player.Name == i then
					if y == "Murderer" then
						local Image, Ready = game.Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
						game.StarterGui:SetCore("SendNotification", {
							Title = y,
							Text = i,
							Icon = Image,
							Duration = 5
						})
					end
					if y == "Hero" then
						local Image, Ready = game.Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
						game.StarterGui:SetCore("SendNotification", {
							Title = y,
							Text = i,
							Icon = Image,
							Duration = 5
						})
					end
					if y == "Sheriff" then
						local Image, Ready = game.Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
						game.StarterGui:SetCore("SendNotification", {
							Title = y,
							Text = i,
							Icon = Image,
							Duration = 5
						})
					end
				end
			end
		end
	end
end


function ESPActivate(Part, Color)
	if Part:FindFirstChildOfClass("BoxHandleAdornment") then
		return Part:FindFirstChildOfClass("BoxHandleAdornment")
	end

	local Box = Instance.new("BoxHandleAdornment")
	Box.Size = Part.Size + Vector3.new(0.1, 0.1, 0.1)
	Box.Name = "Mesh"
	Box.Visible = ESPisON
	Box.Adornee = Part
	Box.Color3 = Color
	Box.AlwaysOnTop = true
	Box.ZIndex = 5
	Box.Transparency = 0.5
	Box.Parent = Part

	table.insert(ESPInstances, Box)

	return Box
end

function Initialize(Player)
	local function CharacterAdded(Character)
		Player:WaitForChild("Backpack").ChildAdded:Connect(function(Child)
			local Role = WeaponNames[Child.Name]
			if Role then
				Roles[Role.Index] = Player
				print("Player_"..Player.Name.." ("..Player.UserId..") was detected for being "..Role.Index)

				local Cham = ESPActivate(Player.Character.HumanoidRootPart, Role.Color)

				local Animator = Player.Character:FindFirstChildWhichIsA("Humanoid"):WaitForChild("Animator")
				Animator.AnimationPlayed:Connect(function(AnimationTrack)
					if Animator and AnimationTrack.Animation == nil then
						return
					end

					if table.find(AttackAnimations, AnimationTrack.Animation.AnimationId) then
						Cham.Color3 = Color3.fromRGB(255, 0, 255)
						spawn(function()
							while true do
								game:GetService("RunService").Heartbeat:Wait(0.01)
								local PlayingAnimations = Animator:GetPlayingAnimationTracks()
								local StillAttacking = false
								for i, v in ipairs(PlayingAnimations) do
									if table.find(AttackAnimations, v.Animation.AnimationId) then
										StillAttacking = true
									end
								end
								if StillAttacking == false then
									break
								end
							end
							Cham.Color3 = Role.Color
						end)
					end
				end)

			end
		end)
	end
	CharacterAdded(Player.Character or Player.CharacterAdded:Wait())
	Player.CharacterAdded:Connect(CharacterAdded)
end

function GunAdded(Child)
	if Child.Name == "GunDrop" then
		ESPActivate(Child, Color3.fromRGB(255, 255, 255))
	end
end

game:GetService("UserInputService").InputBegan:Connect(function(input)
	if game:GetService("UserInputService"):GetFocusedTextBox() then
		return
	end

	if input.KeyCode == Enum.KeyCode.C then
		NotifyRoles()
	end

	if input.KeyCode == Enum.KeyCode.B then
		ESPisON = not ESPisON
		for i, v in ipairs(ESPInstances) do
			v.Visible = ESPisON
			if v.Parent == nil then
				table.remove(ESPInstances, i)
			end
		end
		game.StarterGui:SetCore("SendNotification", {
			Title = "Player ESP",
			Text = "Enabled: "..tostring(ESPisON),
			Duration = 5
		})
	end
	
	if input.KeyCode == Enum.KeyCode.G then
		local Girl = false
		local Girls = 0
		local Shirt = "http://www.roblox.com/asset/?id=1197893602"
		local Pants = "http://www.roblox.com/asset/?id=1197893602"
		for i, v in pairs(game.Players:GetPlayers()) do
			local char = v.Character
			if char then
				local W = "http://www.roblox.com/asset/?id=1442612087"
				local G = "http://www.roblox.com/asset/?id=2509968186"
				local B = "http://www.roblox.com/asset/?id=542765884"
				local CF = "https://assetdelivery.roblox.com/v1/asset/?id=4586707167"
				local UT = char.UpperTorso
				if UT.MeshId == W or UT.MeshId == G or UT.MeshId == B or UT.MeshId == CF then
					print("Swooshing Girl_"..v.Name.." ("..v.UserId..")")
					Girl = true
					Girls += 1
					if char:FindFirstChild("Shirt") then
						char.Shirt.ShirtTemplate = Shirt
					else
						local newShirt = Instance.new("Shirt")
						newShirt.Name = "Shirt"
						newShirt.Parent = char
						newShirt.ShirtTemplate = Shirt
					end
					if char:FindFirstChild("Shirt Graphic") then
						char["Shirt Graphic"].Graphic = Shirt
					end

					if char:FindFirstChild("Pants") then
						char.Pants.PantsTemplate = Pants
					else
						local newPants = Instance.new("Pants")
						newPants.Name = "Pants"
						newPants.Parent = char
						newPants.PantsTemplate = Pants
					end

					local Image, Ready = game:GetService("Players"):GetUserThumbnailAsync(v.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
					game.StarterGui:SetCore("SendNotification", {
						Title = v.Name..' ('..tostring(v.UserId)..')',
						Text = "Was swooshed!",
						Icon = Image,
						Duration = 5
					})
				end
			end
		end
		if Girl == false then
			game.StarterGui:SetCore("SendNotification", {
				Title = 'Unexpected Error! :(',
				Text = "We couldn't detect a girl so try again later!",
				Duration = 5
			})
		else
			game.StarterGui:SetCore("SendNotification", {
				Title = 'Success!',
				Text = "Swooshed "..tostring(Girls).." Girls!",
				Duration = 7
			})
		end
	end
end)

game:GetService("Players").PlayerAdded:Connect(function(plr)
	Initialize(plr)
	print("Player_"..plr.Name.." ("..plr.UserId..") has joined")
end)
game:GetService("Players").PlayerRemoving:Connect(function(plr)
	print("Player_"..plr.Name.." ("..plr.UserId..") has left")
end)
workspace.ChildAdded:Connect(GunAdded)
