local reload_tech_unlock = require("script.reload-tech-unlock")
-------------------------------------------------------------------------------
script.on_configuration_changed(
	function()
		reload_tech_unlock.reload_tech_unlock()
	end
)
-------------------------------------------------------------------------------
script.on_event(
	defines.events.on_force_created,
	function()
		reload_tech_unlock.reload_tech_unlock()
	end
)
