local value = require("@pkg/value")

type Value<T> = value.Interface<T>
export type Interface = { playtime: Value<number> }

return nil
