--log("data-updates")
local make_crane_entity = require("data.entity")
local make_crane_item = require("data.item")
local make_crane_recipe = require("data.recipe")
local setup_crane_tech = require("data.tech")

local function register_crane(entityName, newName, wide, forced_ips)
	make_crane_entity(entityName, newName, wide, forced_ips)
	make_crane_item(entityName, newName, wide)
	make_crane_recipe(entityName, newName, wide)
	setup_crane_tech(entityName, newName)
end
--vanilla inserters
local speed_limit = 108
local speed_limit_wide = 324
if mods["bobinserters"] then
	--if we can set dropoff points 2 row train station become possible for every inserter
	speed_limit = nil
	speed_limit_wide = nil
end

register_crane("stack-inserter", "nco-wide-crane", true, speed_limit_wide)
register_crane("stack-filter-inserter", "nco-wide-filter-crane", true, speed_limit_wide)
register_crane("stack-inserter", "nco-crane", false, speed_limit)
register_crane("stack-filter-inserter", "nco-filter-crane", false, speed_limit)

--krastorio 2
if mods["Krastorio2"] then
	--wide (6x2)
	register_crane("kr-superior-inserter", "nco-superior-wide-crane", true, nil)
	register_crane("kr-superior-filter-inserter", "nco-superior-wide-filter-crane", true, nil)
	--normal (2x2)
	register_crane("kr-superior-inserter", "nco-superior-crane", false, nil)
	register_crane("kr-superior-filter-inserter", "nco-superior-filter-crane", false, nil)
end
