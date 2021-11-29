local function make_crane_item(itemName, newName)
  local item = util.table.deepcopy(data.raw["item"][itemName])
  item.name = newName
  item.place_result = newName
  item.stack_size = 10
  -- ToDo layered icon
  data:extend({item})
end
return make_crane_item
