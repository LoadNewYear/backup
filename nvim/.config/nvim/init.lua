require("config.lazy")
require("config.treesitter")
require("config.harpoon")
require("config.undotree")
require("config.fugitive")
require("config.set")

require("remap")
require("remap.telescope")

require("config.colors")

vim.cmd.lua(ColorMyPencils("rose-pine"))
require("config.harpoon")
