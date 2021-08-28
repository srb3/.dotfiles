local has_telescope, telescope = pcall(require, 'telescope')
if has_telescope then
  telescope.setup {
    defaults = {
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
      },
      prompt_prefix = '> ',
      selection_caret = '> ',
      entry_prefix = '  ',
      initial_mode = 'insert',
      selection_strategy = 'reset',
      sorting_strategy = 'descending',
      layout_strategy = 'horizontal',
      layout_config = {
        horizontal = {
          mirror = false,
        },
        vertical = {
          mirror = false,
        },
      },
      file_sorter = require('telescope.sorters').get_fuzzy_file,
      file_ignore_patterns = {},
      generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
      winblend = 0,
      border = {},
      borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
      color_devicons = true,
      use_less = true,
      path_display = {},
      set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
      file_previewer = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
      qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    },
  }

  vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>fp', '<cmd>Telescope file_browser<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope find_files hidden=true<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>ht', '<cmd>Telescope help_tags<cr>', { noremap = true })
end
