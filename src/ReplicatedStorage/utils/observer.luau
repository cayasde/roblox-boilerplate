export type Interface<PARAMS...> = {
	_subscribers: { [(PARAMS...) -> ()]: true },
	notify: (self: Interface<PARAMS...>, PARAMS...) -> (),
	subscribe: (
		self: Interface<PARAMS...>,
		callback: (PARAMS...) -> ()
	) -> () -> (),
}

local function subscribe<PARAMS...>(
	self: Interface<PARAMS...>,
	callback: (PARAMS...) -> ()
)
	self._subscribers[callback] = true
	return function()
		self._subscribers[callback] = nil
	end
end

local function notify<PARAMS...>(self: Interface<PARAMS...>, ...: PARAMS...)
	for callback, _ in self._subscribers do
		task.spawn(callback, ...)
	end
end

return function()
	local publisher = {}
	publisher._subscribers = {}
	publisher.notify = notify
	publisher.subscribe = subscribe
	return publisher
end
