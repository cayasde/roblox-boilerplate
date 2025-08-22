local Players = game:GetService("Players")

return function(callback: (Player) -> ())
	Players.PlayerAdded:Connect(callback)

	for _, player in Players:GetPlayers() do
		callback(player)
	end
end
