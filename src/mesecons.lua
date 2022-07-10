local insulated = "Only Connect to Specific Directions"
local logic     = "Binary Logic Gates for Mesecons"
local craftitem = "Used to Craft Technical Items"
local movestone = "Move on Mesecon Signals"
local pressure  = "Produce Mesecon Signals on Pressure"
local switch    = "Change State by Rightclick"

local helps = {
	["mesecons:wire_00000000_off"] = "Transmit Mesecon Signals",
	["mesecons_blinkyplant:blinky_plant_off"] = "Blinks Every 3 Seconds",
	["mesecons_button:button_off"] = "Give out Mesecon Signal on Press",
	["mesecons_commandblock:commandblock_off"] = "Run Administrative Commands",
	["mesecons_delayer:delayer_off_1"] = "Delay Mesecon Signal Transmission",
	["mesecons_detector:node_detector_off"] = "Detect Nodes Nearby",
	["mesecons_detector:object_detector_off"] = "Detect Players Nearby",
	["mesecons_extrawires:corner_off"] = insulated,
	["mesecons_extrawires:crossover_off"] = "Mesecon Signals Crossing",
	["mesecons_extrawires:corner_off"] = insulated,
	["mesecons_extrawires:tjunction_off"] = insulated,
	["mesecons_extrawires:vertical_off"] = "Vertically Transmit Mesecon Signals",
	["mesecons_fpga:fpga0000"] = "Chain Multiple Logic Gates Together",
	["mesecons_gates:diode_off"] = logic,
	["mesecons_gates:not_off"] = logic,
	["mesecons_gates:and_off"] = logic,
	["mesecons_gates:nand_off"] = logic,
	["mesecons_gates:xor_off"] = logic,
	["mesecons_gates:nor_off"] = logic,
	["mesecons_gates:or_off"] = logic,
	["mesecons_hydroturbine:hydro_turbine_off"] = "Produce Mesecon Signals on Water Flow",
	["mesecons_insulated:insulated_off"] = insulated,
	["mesecons_lamp:lamp_off"] = "Produce Light on Mesecon Signals",
	-- mesecons_lightstone
	["mesecons_luacontroller:luacontroller0000"] = "Programmable with Lua",
	["mesecons_materials:glue"] = craftitem,
	["mesecons_materials:fiber"] = craftitem,
	["mesecons_materials:silicon"] = craftitem,
	["mesecons_microcontroller:microcontroller0000"] = "Simple Programmable Component",
	["mesecons_movestones:movestone"] = movestone,
	["mesecons_movestones:movestone_vertical"] = movestone,
	["mesecons_movestones:sticky_movestone"] = movestone,
	["mesecons_movestones:sticky_movestone_vertical"] = movestone,
	["mesecons_noteblock:noteblock"] = "Play Sounds",
	["mesecons_pistons:piston_normal_off"] = "Push Nodes on Mesecon Signals",
	["mesecons_pistons:piston_sticky_off"] = "Push or Pull Nodes on Mesecon Signals",
	["mesecons_powerplant:power_plant"] = "Stable Mesecon Signal Source",
	["mesecons_pressureplates:pressure_plate_wood_off"] = pressure,
	["mesecons_pressureplates:pressure_plate_stone_off"] = pressure,
	["mesecons_random:removestone"] = "Disappear on Mesecon Signals",
	["mesecons_random:ghoststone"] = "Hide itself on Mesecon Signals",
	["mesecons_solarpanel:solar_panel_off"] = "Produce Mesecon Signals on Sunlight",
	["mesecons_stickyblocks:sticky_block_all"] = "Stick Multiple Blocks Together",
	["mesecons_switch:mesecon_switch_off"] = switch,
	["mesecons_torch:mesecon_torch_on"] = "Revert Mesecon Signals",
	["mesecons_walllever:wall_lever_off"] = switch,
}

for _,y in pairs({"red","green","blue","gray","darkgray","yellow","orange","white","pink","magenta","cyan","violet"}) do
	local nodename = "mesecons_lightstone:lightstone_" .. y .. "_off"
	local y_upper = y:gsub("%f[%a].", string.upper)
	helps[nodename] = "Produce " .. y_upper .. "Light on Mesecon Signals"
end

for x,y in pairs(helps) do
	minetest.override_item(x,{
		_tt_help = y,
	})
end

tt.register_snippet(function(itemstring)
	local itemdef = minetest.registered_items[itemstring]
	if itemdef.mesecons and itemdef.mesecons.receptor then
		return "Mesecon Receptors", tt.COLOR_GOOD
	end
end)
tt.register_snippet(function(itemstring)
	local itemdef = minetest.registered_items[itemstring]
	if itemdef.mesecons and itemdef.mesecons.conductor then
		return "Mesecon Conductors", tt.COLOR_GOOD
	end
end)
tt.register_snippet(function(itemstring)
	local itemdef = minetest.registered_items[itemstring]
	if itemdef.mesecons and itemdef.mesecons.effector then
		return "Mesecon Effectors", tt.COLOR_GOOD
	end
end)
