local MN = minetest.get_current_modname()
local MP = minetest.get_modpath(MN)

local function require(name)
	minetest.log("action","[EXTRA_TT] Loading " .. name)
	dofile(MP .. "/src/" .. name .. ".lua")
end

require("mesecons")
require("advtrains")
require("technic")

-- ALWAYS THE LAST!
require("techname")
