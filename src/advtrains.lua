local craftitems = "Craft Train-related Stuffs"
local signals    = "Give Instructions to Trains"
local luaatc     = "Control the Advance Trains System by Lua"
local tracks     = "Advanced Train Tracks"

local helps = {
	["advtrains:boiler"] = craftitems,
	["advtrains:driver_cab"] = craftitems,
	["advtrains:wheel"] = craftitems,
	["advtrains:chimney"] = craftitems,
	["advtrains:across_off"] = "Warn Players from Hitting by Trains",
	["advtrains:signal_wall_l_off"] = signals,
	["advtrains:signal_wall_t_off"] = signals,
	["advtrains:signal_wall_r_off"] = signals,
	["advtrains:retrosignal_off"] = signals,
	["advtrains_interlocking:tcb_node"] = "Configure Track Circuits",
	["advtrains_luaautomation:oppanel"] = luaatc,
	["advtrains_luaautomation:mesecon_controller0000"] = luaatc;
	["advtrains_signals_ks:sign_8_0"] = signals,
	["advtrains_signals_ks:sign_hfs_0"] = signals,
	["advtrains_signals_ks:sign_lf_8_0"] = signals,
	["advtrains_signals_ks:sign_lf7_8_0"] = signals,
	["advtrains:signal_off"] = signals,
}

minetest.override_item("advtrains:trackworker",{
	description = "Track Worker Tool",
	_tt_help = "Left-click: change rail type (straight/curve/switch)\nRight-click: rotate rail/bumper/signal/etc.",
})

minetest.override_item("advtrains_interlocking:tool",{
	description = "Interlocking tool",
	_tt_help = "right-click turnouts to inspect route locks",
})

minetest.override_item("advtrains_luaautomation:pcnaming",{
	description = "Passive Component Naming Tool",
	_tt_help = "Right-click to name a passive component.",
})

minetest.override_item("advtrains:copytool",{
	description = "Train copy/paste tool",
	_tt_help = "Left-click: copy train\nRight-click: paste train",
})

for x,y in pairs(helps) do
	minetest.override_item(x,{
		_tt_help = y,
	})
end

tt.register_snippet(function(itemstring)
	local itemdef = minetest.registered_items[itemstring]
	if itemdef.groups and itemdef.groups.not_blocking_trains then
		return "Not Blocking Advanced Trains", tt.COLOR_GOOD
	end
end)
tt.register_snippet(function(itemstring)
	local itemdef = minetest.registered_items[itemstring]
	if itemdef.groups and itemdef.groups.not_blocking_trains and itemdef.groups.platform then
		return "Advanced Trains Platforms", tt.COLOR_GOOD
	end
end)
tt.register_snippet(function(itemstring)
	local itemdef = minetest.registered_items[itemstring]
	if itemdef.groups and itemdef.groups.advtrains_trackplacer then
		return "Advanced Trains Track Placers", tt.COLOR_GOOD
	end
end)
