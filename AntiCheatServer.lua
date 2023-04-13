local Players = game:GetService("Players")

local function CheckTeleport(Part,Treshold)
	local CurrentPosition = Part.Position
	local NewPosition = nil
	
	delay(1, function()
		NewPosition = Part.Position
		local Magnitude = (CurrentPosition - NewPosition).Magnitude
		if Magnitude > Treshold then
			Part.Position = CurrentPosition
		end
	end)
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local KickRemote = ReplicatedStorage:WaitForChild("KickRemote")
KickRemote.OnServerEvent:Connect(function(Player,Reason)
	Player:Kick("{ANTI CHEAT}",Reason)
end)

local function PlayerAdded(Player)
	Player.CharacterAdded:Connect(function(Character)
		local Humanoid = Character:WaitForChild("Humanoid")
		local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
		
		-- // CREATING CLIENT
		
		local ClientScript = script:FindFirstChild("AntiCheatClient"):Clone()
		ClientScript.Parent = Player:WaitForChild("PlayerGui")
		
		-- // ANTI TP
		
		task.defer(function()
			while task.wait(0.5) do
				task.spawn(function()
					CheckTeleport(HumanoidRootPart , 20)		
				end)
			end
		end)

	end)
end

Players.PlayerAdded:Connect(PlayerAdded)
