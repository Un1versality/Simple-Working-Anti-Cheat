local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local KickRemote = ReplicatedStorage:WaitForChild("KickRemote")
ReplicatedStorage.ChildRemoved:Connect(function(Child)
	if Child.Name == "KickRemote" then
		while true do while true do end end
	end
end)

-- // ANTI DANCE GUI / ANTI HUB
game.ChildAdded:Connect(function(Child)
	if Child:IsA("Folder") then
		KickRemote:FireServer("Illegal Game Child Added")		
	end
end)

-- // ANTI GOD
Character.ChildRemoved:Connect(function(Child)
	if Child:IsA("Humanoid") then
		KickRemote:FireServer("God Mode")
	end
end)

Character.ChildAdded:Connect(function(Child)
	if Child:IsA("Humanoid") then
		KickRemote:FireServer("God Mode")
	end
end)
