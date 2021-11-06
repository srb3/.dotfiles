-- greatest remap ever
vim.api.nvim_set_keymap("v", "<leader>p", '"_dP', { noremap = true })

-- next greatest remap ever : asbjornHaland
vim.api.nvim_set_keymap("n", "<leader>y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>d", '"_d', { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>d", '"_d', { noremap = true })

-- move lines
vim.api.nvim_set_keymap("n", "<C-j>", ":m .+1<CR>==", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", ":m .-2<CR>==", { noremap = true })

vim.api.nvim_set_keymap("i", "<C-j>", "<Esc>:m .+1<CR>==gi", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-k>", "<Esc>:m .-2<CR>==gi", { noremap = true })

vim.api.nvim_set_keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true })

-- terminal
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
vim.api.nvim_set_keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", { noremap = true })
vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", { noremap = true })
vim.api.nvim_set_keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", { noremap = true })
vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", { noremap = true })
