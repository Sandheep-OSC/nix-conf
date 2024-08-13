local keymap = vim.keymap

local opts = { noremap = true, silent = true }

-- NvimTree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Pane Navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Window Management
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)
keymap.set("n", "<leader>sh", ":split<CR>", opts)
-- keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts)

-- Indentation
keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")

-- Comment
vim.api.nvim_set_keymap('n', "<C-/>", "gcc", { noremap = false })
vim.api.nvim_set_keymap('v', "<C-/>", "gcc", { noremap = false })
