local function make_crane_recipe(recipeName, newName, wide)
	local scale = 5.5
	if wide then
		scale = 16
	end
	local recipe = util.table.deepcopy(data.raw["recipe"][recipeName])
	--log(serpent.block(recipe))
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
	--log(serpent.block(recipe))
	data:extend({recipe})
end

return make_crane_recipe
