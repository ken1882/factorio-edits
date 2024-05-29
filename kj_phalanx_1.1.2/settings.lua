data:extend({
    {
        type = "int-setting",
        name = "kj_phalanx_cost_setting_multiplicator",
        setting_type = "startup",
        default_value = 1  
    },
	{
		type = "int-setting",
		name = "kj_phalanx_volume",
		setting_type = "startup",
		default_value = 100,
		minimum_value = 0,
		maximum_value = 100,
	},
    {
        type = "bool-setting",
        name = "kj_phalanx_target_mask",
        setting_type = "startup",
        default_value = true, 
		order = "x",
    },
    {
        type = "bool-setting",
        name = "kj_phalanx_nonAA",
        setting_type = "startup",
        default_value = false, 
		order = "y",
    },
})