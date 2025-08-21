local profile_cache = require("@server/player/profile/cache")
local reactive_profile_cache = require("@server/player/profile/reactive")

local M = {}

function M.get(player: Player)
	return reactive_profile_cache.get(player)
end

function M.is_active(player: Player): boolean
	local ok, result = profile_cache.get(player):await()
	return if ok and result then true else false
end

return M
