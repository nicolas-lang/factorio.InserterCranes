local data = _G.data
------------------------------------------------------------------------------------------------------
if not data.raw["item-subgroup"]["inserter-cranes"] then
	--log(serpent.block(data.raw["item-subgroup"]["inserter"]))
	local group = "logistics"
	local order = "c"
	data:extend(
		{
			{
				type = "item-subgroup",
				name = "inserter-cranes",
				group = group,
				order = order
			}
		}
	)
end
