local light = {
	{
		type = "oriented",
		minimum_darkness = 0.3,
		picture =
		{
			filename = "__core__/graphics/light-cone.png",
			priority = "extra-high",
			flags = { "light" },
			scale = 1,
			width = 200,
			height = 200
		},
		shift = {0, -12},
		size = 3,
		intensity = 1,
		color = {r = 1, g = 1, b = 1}
	},
}

return light
