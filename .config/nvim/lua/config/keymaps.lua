vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>x", vim.cmd.Ex)

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fa", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
vim.keymap.set("n", "<leader>fl", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})

-- Nvim-tree
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", {})
