vim.cmd [[packadd packer.nvim]]
vim.cmd [[packadd vimball]]

return require("packer").startup {
  function(use)
    use "wbthomason/packer.nvim"
    
    use "neovim/nvim-lspconfig"  
    use "hrsh7th/nvim-compe"   

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-telescope/telescope.nvim"
    use {
        "junegunn/fzf.vim",
        requires = {
            {"junegunn/fzf"}
        },
        config = function()
            vim.g.fzf_buffers_jump = true
        end
    }

    use "junegunn/gv.vim"
    use "tpope/vim-fugitive"
    use "tpope/vim-commentary"


    use "dracula/vim"
    use "norcalli/nvim-colorizer.lua"
    use {
        "kyazdani42/nvim-web-devicons",
        config = function()
            require "nvim-web-devicons".setup {
                default = true
            }
        end
    }

  end,
  config = {
    display = {
    },
  },
}
