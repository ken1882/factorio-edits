local data_util = require("data_util")

-- 0.6.121 migration to keep efficiency modules
data_util.create_dummy_migration_recipe("oxygen")
data_util.create_dummy_migration_recipe("nitrogen")
data_util.create_dummy_migration_recipe("kr-water-electrolysis")
data_util.create_dummy_migration_recipe("kr-water-separation")
