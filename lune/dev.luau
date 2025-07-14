local task = require("@lune/task")
local process = require("@lune/process")

task.spawn(function()
	process.spawn(
		"rojo",
		{ "sourcemap", "dev.project.json", "--watch", "-o", "sourcemap.json" },
		{ stdio = "forward" }
	)
end)

task.spawn(function()
	process.spawn(
		"rojo",
		{ "serve", "dev.project.json" },
		{ stdio = "forward" }
	)
end)
