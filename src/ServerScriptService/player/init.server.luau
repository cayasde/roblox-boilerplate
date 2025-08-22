local Players = game:GetService("Players")

local start_console = require("@server/player/console")
local start_playtime = require("@server/player/playtime")
local start_profile = require("@server/player/profile")

start_profile()
start_console()

Players.PlayerAdded:Connect(function(player: Player)
	start_playtime(player)
end)
