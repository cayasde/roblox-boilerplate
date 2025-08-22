local conch = require("@pkg/conch")

local DEVELOPERS_ID = require("@shared/constants/developers")

conch.set_role_permissions("dev", "use-kick")

return function(player: Player)
	if not DEVELOPERS_ID[player.UserId] then return end
	local user = conch.get_user(player)
	conch.give_roles(user, "dev")
end
