local function make_icon_layer(base,icon_size)
	local layer = {
		icon = base.icon,
		icon_size = icon_size or base.icon_size,
		scale = base.scale,
		shift = base.shift,
		icon_mipmaps = base.icon_mipmaps,
		tint = base.tint,
	}
	return layer
end

local function make_layered_icon(base, wide)
	local icon_size = base.icon_size
	local icon_layers  = {}
	local icon = "__nco-InserterCranes__/graphics/icon_texture_gray.png"
	if wide then
		icon = "__nco-InserterCranes__/graphics/icon_texture.png"
	end
	table.insert(icon_layers,{
		icon = icon,
		icon_size = 256,
	})
	if base.icon then
		table.insert(icon_layers,make_icon_layer(base,icon_size))
	elseif base.icons then
		for _, icon in pairs(base.icons) do
			table.insert(icon_layers,make_icon_layer(icon,icon_size))
		end
	end
	base.icon = nil
	base.icon_size = nil
	base.icon_mipmaps = nil
	base.icons = icon_layers
end

return make_layered_icon