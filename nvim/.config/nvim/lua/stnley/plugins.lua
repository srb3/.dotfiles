vim.cmd [[packadd packer.nvim]]

return require("packer").startup {
    function(use)
        use "wbthomason/packer.nvim"

        use {
            "neovim/nvim-lspconfig",
            config = function()
                require "stnley.config.lsp"
            end
        }

        use {
            "hrsh7th/nvim-compe",
            event = "InsertEnter *",
            config = function()
                require "stnley.config.compe"
            end
        }

        use {
            "nvim-treesitter/nvim-treesitter",
            run = {
                ":TSInstall all",
                ":TSUpdate"
            }
        }

        use {
            {
                "nvim-telescope/telescope.nvim",
                requires = {
                    {
                        "nvim-lua/plenary.nvim",
                        module_pattern = "plenary.*"
                    }
                },
                config = function()
                    require "stnley.config.telescope"
                end
            },
            {
                "junegunn/fzf.vim",
                after = "telescope.nvim",
                requires = {
                    {"junegunn/fzf"}
                },
                config = function()
                    vim.g.fzf_buffers_jump = true
                end
            }
        }

        -- use "junegunn/gv.vim"
        use "airblade/vim-gitgutter"
        use "tpope/vim-fugitive"
        use "tpope/vim-commentary"

        use "dracula/vim"
        use "norcalli/nvim-colorizer.lua"
        use "kyazdani42/nvim-web-devicons"
    end,
    config = {
        display = {}
    }
}
