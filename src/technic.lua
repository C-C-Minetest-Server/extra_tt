local function volt(bstr)
	return function(v)
		return bstr:format(v)
	end
end

local batterybox = volt("Store %s Power")
local cables     = volt("Transmit %s Power")
local solar      = volt("Produce %s Power from Sunlight")
local generator  = volt("Produce %s Power")
local alloy      = "Alloy Metals"
local furnace    = "Smelt Minerals and Cook Foods"
local grinder    = "Grin stuffs into small pieces"
local compressor = "Compress stuffs"

local helps = {}

for _,v in pairs({"lv","mv","hv"}) do
	do
		local nname = ("technic:%s_battery_box0"):format(v)
		helps[nname] = batterybox(v:upper())
	end
	do
		local nname = ("technic:solar_array_%s"):format(v)
		helps[nname] = solar(v:upper())
	end
	do
		if v ~= "hv" then
			local nname = ("technic:%s_electric_furnace"):format(v)
			if v == "lv" then
				nname = "technic:electric_furnace"
			end
			helps[nname] = furnace
		end
	end
	do
		if v ~= "hv" then
			local nname = ("technic:%s_grinder"):format(v)
			helps[nname] = grinder
		end
	end
	do
		if v ~= "hv" then
			local nname = ("technic:%s_compressor"):format(v)
			helps[nname] = grinder
		end
	end
	do
		local nname = ("technic:%s_cable"):format(v)
		helps[nname] = cables(v:upper())
	end
	do
		local nname = ("technic:%s_generator"):format(v)
		helps[nname] = generator(v:upper())
	end
end

for x,y in pairs(helps) do
	minetest.override_item(x,{
		_tt_help = y,
	})
end

tt.register_snippet(function(itemstring)
	local itemdef = minetest.registered_items[itemstring]
	if itemdef.wear_represents == "technic_RE_charge" then
		return "Rechargeable", tt.COLOR_GOOD
	end
end)
tt.register_snippet(function(itemstring)
	local itemdef = minetest.registered_items[itemstring]
	if itemdef.groups and itemdef.groups.radioactive then
		return "Radioactive", tt.COLOR_GOOD
	end
end)
tt.register_snippet(function(itemstring)
	local itemdef = minetest.registered_items[itemstring]
	if itemdef.groups and itemdef.groups.technic_machine then
		return "Technic Machines", tt.COLOR_GOOD
	end
end)
