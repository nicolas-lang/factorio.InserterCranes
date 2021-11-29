local data = _G.data
------------------------------------------------------------------------------------------------------
if not data.raw["item-subgroup"]["inserter-cranes"] then
	log(serpent.block(data.raw["item-subgroup"]["inserter"]))
	data:extend(
		{
			{
				type = "item-subgroup",
				name = "inserter-cranes",
				group = "logistics",
				order = "c"
			}
		}
	)
end
