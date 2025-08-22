local conch = require("@pkg/conch")

return conch.register("kick", {
	permissions = { "use-kick" },
	arguments = function()
		return conch.args.player(), conch.args.string()
	end,
	callback = function(player: Player, reason: string)
		player:Kick(reason)
	end,
})
