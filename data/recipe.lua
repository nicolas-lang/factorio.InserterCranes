local make_layered_icon = require("icon")

local function make_crane_recipe(recipeName, newName, wide)
	local scale = 5.5
	if wide then
		scale = 16
	end
	local recipe = util.table.deepcopy(data.raw["recipe"][recipeName])
	--log(serpent.block(recipe))
	if recipe.icon or recipe.icons then
		make_layered_icon(recipe, wide)
	end
	recipe.name = newName
	recipe.energy_required = (recipe.energy_required or 1) * scale
	recipe.result = newName
	recipe.enabled = false
	recipe.subgroup = "inserter-cranes"
	local ingredients = {}
	for _, v in pairs(recipe.ingredients) do
		table.insert(ingredients, {v[1], math.ceil(v[2] * scale)})
	end
	recipe.ingredients = ingredients
	--log("recipe"..serpent.block(recipe))
	data:extend({recipe})
	-- add k2 crushing recipe
	if mods["Krastorio2"] then
		local crushing_recipe = {
			type = "recipe",
			name = newName .. "-to-parts",
			icon = "__base__/graphics/icons/inserter.png",
			icon_size = 64,
			icon_mipmaps = 4,
			category = "crushing",
			subgroup = "inserter-cranes",
			hide_from_player_crafting = true,
			always_show_made_in = true,
			allow_as_intermediate = false,
			allow_intermediates = false,
			always_show_products = true,
			energy_required = 1,
			enabled = true,
			ingredients = {
				{newName, 1}
			},
			results = {}
		}
		for _, v in pairs(recipe.ingredients) do
			table.insert(crushing_recipe.results, {type = "item", name = v[1],  amount = v[2], probability = 0.75})
		end
		data:extend({crushing_recipe})
	end
end

return make_crane_recipe
