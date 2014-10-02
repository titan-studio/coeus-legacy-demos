--[[
Demo Launcher
This will launch demos in the future.

For now, check messy.lua for a (messy) sample app.
]]

local ffi = require("ffi")
local config = require("config-debug")
local Coeus = require("Coeus")
Coeus:Initialize(config)

--todo: demo launcher