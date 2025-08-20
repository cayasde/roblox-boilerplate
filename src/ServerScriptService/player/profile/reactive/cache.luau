local builder = require("@server/player/profile/reactive/builder")
local profile_types = require("@server/player/profile/types")
local promise = require("@pkg/promise")
local types = require("@server/player/profile/reactive/types")

type Profile = profile_types.Profile
type Promise<T...> = promise.TypedPromise<T...>
type Interface = types.Interface

local M = {}
M.observables = {} :: { [Player]: Interface }

function M.get(player: Player): Promise<Interface>
	return promise.new(function(resolve: (Interface) -> (), _)
		repeat
			task.wait()
		until M.observables[player]

		resolve(M.observables[player])
	end)
end

function M.add(player: Player, profile: Profile)
	if M.observables[player] then return end
	M.observables[player] = builder(profile)
end

function M.delete(player: Player)
	if not M.observables[player] then return end
	M.observables[player] = nil
end

return M
