local reactive_cache = require("@server/player/profile/reactive/cache")

return function(player: Player)
	task.spawn(function()
		local profile = reactive_cache.get(player):expect()
		local playtime = profile.playtime

		while task.wait(1) do
			playtime:set(playtime:get() + 1)
		end
	end)
end
