local has_treesitter = pcall(require, "nvim-treesitter")
if has_treesitter then
    require("nvim-treesitter.configs").setup {
        highlight = {
            enable = true,
            use_languagetree = false,
            disable = {"json"}
        }
    }
end
