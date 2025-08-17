local observer = require("@utils/observer")

export type Interface<Value> = {
	_value: Value,
	_observable: typeof(observer()),
	on_changed: (self: Interface<Value>, (Value) -> ()) -> (),
	set: (self: Interface<Value>, new_value: Value) -> (),
	get: (self: Interface<Value>) -> Value,
}

local function on_changed<Value>(self: Interface<Value>, cb: (Value) -> ())
	self._observable:subscribe(cb)
end

local function set<Value>(self: Interface<Value>, new_value: Value)
	self._value = new_value
	self._observable:notify(new_value)
end

local function get<Value>(self: Interface<Value>)
	return self._value
end

return function<Value>(initial_value: Value): Interface<Value>
	local self = {}
	self._value = initial_value
	self._observable = observer()
	self.on_changed = on_changed
	self.set = set
	self.get = get
	return self
end
