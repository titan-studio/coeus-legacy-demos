--s Coeus debug configuration
local config = {
	Debug = true,
	BinDir = os.getenv("COEUS_BIN_PATH"),
	SourceDir = os.getenv("COEUS_SRC_PATH")
}

--update path to add Coeus
package.path = package.path .. ";" .. config.SourceDir .. "?/init.lua"

return config