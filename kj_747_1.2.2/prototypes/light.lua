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
		shift = {-3.5, -14},
		size = 3,
		intensity = 2,
		color = {r = 1, g = 1, b = 1}
	},
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
		shift = {3.5, -14},
		size = 3,
		intensity = 2,
		color = {r = 1, g = 1, b = 1}
	},
	{
		type = "oriented",
		minimum_darkness = 0.3,
		picture =
		{
			filename = "__core__/graphics/light-cone.png",
			priority = "extra-high",
			flags = { "light" },
			scale = 0.5,
			width = 200,
			height = 200
		},
		shift = {0, 21},
		size = 3,
		intensity = 1,
		rotation_shift = 0.5,
		color = {r = 1, g = 0, b = 0}
	},
}

return light
