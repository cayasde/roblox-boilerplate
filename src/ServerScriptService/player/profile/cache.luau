local promise = require("@pkg/promise")
local types = require("@server/player/profile/types")

type Profile = types.Profile
type Promise<T...> = promise.TypedPromise<T...>

local M = {}
M._profiles = {} :: { [Player]: Profile }

function M.get(player: Player): Promise<Profile>
	return promise.new(function(resolve: (Profile) -> (), _)
		repeat
			task.wait()
		until M._profiles[player]

		resolve(M._profiles[player])
	end)
end

function M.add(player: Player, profile: Profile)
	M._profiles[player] = profile
end

function M.delete(player: Player)
	M._profiles[player] = nil
end

return M
