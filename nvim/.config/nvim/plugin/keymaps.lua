-- greatest remap ever
vim.api.nvim_set_keymap("v", "<leader>p", '"_dp', {noremap = true})

-- next greatest remap ever : asbjornHaland
vim.api.nvim_set_keymap("n", "<leader>y", '"+y', {noremap = true})
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', {noremap = true})

vim.api.nvim_set_keymap("n", "<leader>d", '"_d', {noremap = true})
vim.api.nvim_set_keymap("v", "<leader>d", '"_d', {noremap = true})

-- move lines
vim.api.nvim_set_keymap("n", "<C-j>", ":m .+1<CR>==", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-k>", ":m .-2<CR>==", {noremap = true})

vim.api.nvim_set_keymap("i", "<C-j>", "<Esc>:m .+1<CR>==gi", {noremap = true})
vim.api.nvim_set_keymap("i", "<C-k>", "<Esc>:m .-2<CR>==gi", {noremap = true})

vim.api.nvim_set_keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", {noremap = true})
vim.api.nvim_set_keymap("v", "<C-k>", ":m '<-2<CR>gv=gv", {noremap = true})

-- LSP
vim.api.nvim_set_keymap("n", "<leader>gd", ":lua vim.lsp.buf.definition()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>gi", " :lua vim.lsp.buf.implementation()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>gsh", ":lua vim.lsp.buf.signature_help()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>grr", ":lua vim.lsp.buf.references()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>grn", ":lua vim.lsp.buf.rename()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>gh", ":lua vim.lsp.buf.hover()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", {noremap = true})
vim.api.nvim_set_keymap(
    "n",
    "<leader>sd",
    ":lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>",
    {noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>gn", ":lua vim.lsp.diagnostic.goto_next()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>gll", ":call LspLocationList()<CR>", {noremap = true})
