local Players = game:GetService("Players")
local profile_cache = require("@server/player/profile/cache")
local profile_store = require("@serverpkg/profile_store")
local template = require("@server/player/profile/template")
local types = require("@server/player/profile/types")

local DATASTORE_NAME = "datastore_name"

local store = profile_store.New(DATASTORE_NAME, template)
if _G.__DEV__ then store = store.Mock :: any end

return function(player: Player): types.Profile?
	local PLAYER_KEY = `Player_{player.UserId}`

	local profile = store:StartSessionAsync(PLAYER_KEY, {
		Cancel = function()
			return player.Parent ~= Players
		end,
	})

	if not profile then
		player:Kick("Profile load fail - Please rejoin")
		return
	end

	profile:AddUserId(player.UserId)
	profile:Reconcile()

	profile.OnSessionEnd:Connect(function()
		profile_cache.delete(player)
		player:Kick("Profile session end - Please rejoin")
		warn(
			`[profilestore]: Profile session has ended ({profile.Key}) - Profile.Data will no longer be saved to the DataStore`
		)
	end)

	return profile :: any
end
