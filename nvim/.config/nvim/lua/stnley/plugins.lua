vim.cmd [[packadd packer.nvim]]

return require("packer").startup {
  function(use)
    use "wbthomason/packer.nvim"

    use {
      "neovim/nvim-lspconfig",
      config = function()
        require "stnley.config.lsp"
      end,
    }

    use {
      {
        "hrsh7th/nvim-cmp",
        config = function()
          require "stnley.config.cmp"
        end,
      },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-vsnip", requires = {
        { "hrsh7th/vim-vsnip" },
      } },
    }

    use {
      "nvim-treesitter/nvim-treesitter",
      run = {
        ":TSInstall all",
        ":TSUpdate",
      },
    }

    use {
      {
        "nvim-telescope/telescope.nvim",
        requires = {
          {
            "nvim-lua/plenary.nvim",
            module = "plenary",
            module_pattern = "plenary.*",
          },
        },
        config = function()
          require "stnley.config.telescope"
        end,
      },
      {
        "junegunn/fzf.vim",
        after = "telescope.nvim",
        requires = {
          { "junegunn/fzf" },
        },
        config = function()
          vim.g.fzf_buffers_jump = true
        end,
      },
    }

    -- use "junegunn/gv.vim"
    use {
      "folke/zen-mode.nvim",
      config = function()
        require("zen-mode").setup()
      end,
      cmd = { "ZenMode" },
    }

    use {
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
      },
      config = function()
        require("gitsigns").setup()
      end,
    }

    use {
      "tpope/vim-fugitive",
      cmd = { "Git", "Gstatus", "Gblame", "Gpush", "Gpull" },
    }

    use {
      "tpope/vim-commentary",
      event = "BufRead",
    }

    use {
      "plasticboy/vim-markdown",
      ft = "markdown",
      config = function()
        require "stnley.config.markdown"
      end,
    }

    use "dracula/vim"
    use "kyazdani42/nvim-web-devicons"
    use {
      "hoob3rt/lualine.nvim",
      event = "BufRead",
      config = function()
        require("lualine").setup {
          options = { theme = "dracula" },
        }
      end,
    }

    use {
      "norcalli/nvim-colorizer.lua",
      event = "BufRead",
      config = function()
        require("colorizer").setup()
        vim.cmd [[ColorizerAttachToBuffer]]
      end,
    }
  end,
  config = {
    display = {},
  },
}
