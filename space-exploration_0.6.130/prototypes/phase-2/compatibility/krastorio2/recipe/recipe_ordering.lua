
-- Matter Recipe category
data.raw.recipe["stone-to-matter"].category = "basic-matter-conversion"
data.raw.recipe["stone-to-matter"].subgroup = "basic-matter-conversion"

-- Update K2s Copper recipes to share the same subgroup as SEs Copper recipes
data.raw.item["enriched-copper"].subgroup = "copper"
data.raw.item["enriched-copper"].order = "a-a"
data.raw.recipe["enriched-copper"].subgroup = "copper"
data.raw.recipe["enriched-copper"].order = "a-1"
data.raw.recipe["dirty-water-filtration-2"].subgroup = "copper"
data.raw.recipe["dirty-water-filtration-2"].order = "a-2"

-- Update K2s recipes Iron recipes to share the same subgroup as SEs Iron recipes
data.raw.item["enriched-iron"].subgroup = "iron"
data.raw.item["enriched-iron"].order = "a-a"
data.raw.recipe["enriched-iron"].subgroup = "iron"
data.raw.recipe["enriched-iron"].order = "a-1"
data.raw.recipe["dirty-water-filtration-1"].subgroup = "iron"
data.raw.recipe["dirty-water-filtration-1"].order = "a-2"

-- Update K2s Rare Metal recipes to share the same subgroup
data.raw.recipe["rare-metals"].subgroup = "rare-metals"
data.raw.recipe["rare-metals"].order = "a-a"
data.raw.recipe["enriched-rare-metals"].subgroup = "rare-metals"
data.raw.recipe["enriched-rare-metals"].order = "a-b"
data.raw.recipe["dirty-water-filtration-3"].subgroup = "rare-metals"
data.raw.recipe["dirty-water-filtration-3"].order = "a-c"
data.raw.recipe["rare-metals-2"].subgroup = "rare-metals"
data.raw.recipe["rare-metals-2"].order  = "a-d"

-- Update K2s Imersite recipes to share the same subgroup
data.raw.recipe["imersite-powder"].order = "a-a"
data.raw.recipe["imersite-crystal"].group = "resources"
data.raw.recipe["imersite-crystal"].subgroup = "imersite"
data.raw.recipe["imersite-crystal"].order = "a-b"
data.raw.recipe["imersium-plate"].order = "a-d"

-- Update K2s Lithium recipes to share the same subgroup
data.raw.recipe["lithium-chloride"].subgroup = "lithium"
data.raw.recipe["lithium-chloride"].order = "a-a"
data.raw.recipe["lithium"].subgroup = "lithium"
data.raw.recipe["lithium"].order = "a-b"

-- Update K2s Stone recipes to share the same subgroup as SEs recipes
data.raw.recipe["silicon"].category = "kiln"
data.raw.recipe["silicon-vulcanite"].category = "kiln"
data.raw.recipe["silicon-vulcanite"].subgroup = "stone"
data.raw.recipe["silicon-vulcanite"].order = "a[silicon-vulcanite]"
data.raw.recipe["quartz"].subgroup = "stone"
data.raw.recipe["quartz"].order = "a[quartz]"

-- Switch Coke recipes over to the Kiln recipe group
data.raw.recipe["coke"].category = "kiln"