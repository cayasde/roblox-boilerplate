local profile_cache = require("@server/player/profile/cache")
local reactive_cache = require("@server/player/profile/reactive")

return function(player: Player)
	task.spawn(function()
		local profile = reactive_cache.get(player):expect()
		local playtime = profile.playtime

		while task.wait(1) do
			if not profile_cache.get(player):expect() then break end
			playtime:set(playtime:get() + 1)
		end
	end)
end
