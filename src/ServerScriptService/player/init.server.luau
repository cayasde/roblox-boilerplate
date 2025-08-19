local Players = game:GetService("Players")
local cache = require("@server/player/profile/cache")
local start_profile = require("@server/player/profile")

start_profile()

Players.PlayerAdded:Connect(function(player: Player)
	local profile = cache.get(player)

	print(profile)
end)
