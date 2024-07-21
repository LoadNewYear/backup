vim.g.leader = " "
vim.keymap.set("n", "<leader>pv",  vim.cmd.Ex )
vim.keymap.set("n", "<leader>pf", function() require('telescope.builtin').find_files() end)
