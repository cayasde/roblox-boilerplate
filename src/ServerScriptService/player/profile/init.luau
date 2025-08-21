local Players = game:GetService("Players")

local profile_cache = require("@server/player/profile/cache")
local reactive = require("@server/player/profile/reactive")
local start_session = require("@server/player/profile/session")
local types = require("@server/player/profile/types")

local started = false

export type Profile = types.Profile
export type Template = types.Template
export type Store = types.Store

local function player_added(player: Player)
	local profile = start_session(player)
	if not profile then return end

	profile_cache.add(player, profile)
	reactive.add(player, profile)
end

local function player_removing(player: Player)
	local profile = profile_cache.get(player):expect()
	reactive.delete(player)
	if profile ~= nil then profile:EndSession() end
end

return function()
	assert(not started, "Profile system has already started.")
	started = true

	for _, player in Players:GetPlayers() do
		player_added(player)
	end

	Players.PlayerAdded:Connect(player_added)
	Players.PlayerRemoving:Connect(player_removing)
end
