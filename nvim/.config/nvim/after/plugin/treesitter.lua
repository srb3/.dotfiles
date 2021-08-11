if not pcall(require, "nvim-treesitter") then
  return
end

require("nvim-treesitter.configs").setup {
    highlight = {
        enable = true,
        use_languagetree = false,
        disable = {"json"},
    },
}
