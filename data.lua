log("data")
require("data.subgroup")
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
--vanilla
--wide (6x2)
register_crane("stack-inserter", "nco-wide-crane", true, 324) -- ips compareable to 9 inserters
register_crane("stack-filter-inserter", "nco-wide-filter-crane", true, 324) -- ips compareable to 9 inserters
--normal (2x2)
register_crane("stack-inserter", "nco-crane", false, 108) -- ips compareable to 3 inserters
register_crane("stack-filter-inserter", "nco-filter-crane", false, 108) -- ips compareable to 3 inserters

--krastorio 2
if mods["Krastorio2"] then
	--wide (6x2)
	register_crane("kr-superior-inserter", "nco-superior-wide-crane", true, nil)
	register_crane("kr-superior-filter-inserter", "nco-superior-wide-filter-crane", true, nil)
	--normal (2x2)
	register_crane("kr-superior-inserter", "nco-superior-crane", false, nil)
	register_crane("kr-superior-filter-inserter", "nco-superior-filter-crane", false, nil)
end
