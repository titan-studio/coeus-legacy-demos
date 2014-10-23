--[[
Demo Launcher
Launches demos
]]

local ffi = require("ffi")
local lfs = require("lfs")
local config = require("config-debug")
local Coeus = require("Coeus")
Coeus:Initialize(config)

print("Demos detected:")

local idemo_list = {}
for file in lfs.dir("demos") do
	if (file ~= "." and file ~= "..") then
		local name = file:match("^(.+)%.?.*$")
		idemo_list[name:lower()] = {lfs.attributes("demos/" .. file, "mode"), name}
		print(name)
	end
end

while (true) do
	io.write("\nInput a demo name: ")
	local input = io.read()
	local linput = input:lower()

	if (idemo_list[linput]) then
		local fixed = idemo_list[linput][2]

		if (idemo_list[linput][1] == "file") then
			local file, err = loadfile("demos/" .. fixed)

			if (not file) then
				error("Error loading demo:", err)
			end

			file(Coeus)
			break
		elseif (idemo_list[linput][1] == "directory") then
			local file, err = loadfile("demos/" .. fixed .. "/main.lua")
			local old_path = package.path
			package.path = "demos/" .. fixed .. "/?.lua;" .. package.path

			if (not file) then
				error("Error loading demo:", err)
			end

			file(Coeus)
			package.path = old_path
			break
		end
	elseif (input == "quit") then
		os.exit()
	else
		print("Invalid demo!")
	end
end

Coeus:Terminate()