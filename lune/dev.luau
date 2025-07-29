local task = require("@lune/task")
local process = require("@lune/process")
local fs = require("@lune/fs")

if fs.isDir("out/") then
	fs.removeDir("out/")
end

task.spawn(function()
	process.spawn(
		"rojo",
		{ "sourcemap", "dev.project.json", "--watch", "-o", "sourcemap.json" },
		{ stdio = "forward" }
	)
end)

task.spawn(function()
	process.spawn(
		"darklua",
		{ "process", "-w", "src/", "out/" },
		{ stdio = "forward" }
	)
end)

task.spawn(function()
	process.spawn(
		"darklua",
		{ "process", "-w", "stories/", "out/ReplicatedStorage/Stories" },
		{ stdio = "forward" }
	)
end)

task.spawn(function()
	process.spawn(
		"rojo",
		{ "serve", "dev.darklua.project.json" },
		{ stdio = "forward" }
	)
end)
