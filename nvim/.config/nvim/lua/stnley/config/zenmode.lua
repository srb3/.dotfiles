local has_zenmode, zenmode = pcall(require, "zen-mode")
if has_zenmode then
  zenmode.setup()

  vim.api.nvim_set_keymap("n", "<leader>z", "<cmd>ZenMode<cr>", { noremap = true })
end
