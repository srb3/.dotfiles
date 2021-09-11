require "stnley.config.lsp.handlers"

local lspconfig = require "lspconfig"

local custom_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

local custom_attach = function(client, bufnr)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_formatting then
    vim.cmd [[
            augroup Format
                autocmd! * <buffer>
                autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()
            augroup END
        ]]
  end

  if client.resolved_capabilities.document_highlight then
    vim.cmd [[
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]]
  end

  -- -- LSP specific keymaps
  local opts = { noremap = true }
  local function keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap("n", "<leader>gi", " <cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap("n", "<leader>gsh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  keymap("n", "<leader>grr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  keymap("n", "<leader>grn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  keymap("n", "<leader>gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  keymap(
    "n",
    "<leader>sd",
    "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>",
    opts
  )
  keymap("n", "<leader>gn", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  keymap("n", "<leader>gll", ":call LspLocationList()<CR>", opts)
end

lspconfig.pyright.setup {
  on_init = custom_init,
  on_attach = custom_attach,
}

lspconfig.tsserver.setup {
  on_init = custom_init,
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    custom_attach(client)
  end,
}

local user = vim.fn.expand "$USER"
local sumneko_root_path = "/home/" .. user .. "/personal/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"
lspconfig.sumneko_lua.setup {
  on_init = custom_init,
  on_attach = custom_attach,
  cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig.jsonls.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    custom_attach(client)
  end,
  capabilities = capabilities,
}

lspconfig.terraformls.setup {}

local black = require "stnley.config.lsp.efm.black"
local isort = require "stnley.config.lsp.efm.isort"
local flake8 = require "stnley.config.lsp.efm.flake8"
local mypy = require "stnley.config.lsp.efm.mypy"
local stylua = require "stnley.config.lsp.efm.stylua"
local eslint = require "stnley.config.lsp.efm.eslint"
local prettier = require "stnley.config.lsp.efm.prettier"
lspconfig.efm.setup {
  on_attach = custom_attach,
  init_options = { documentFormatting = true },
  root_dir = vim.loop.cwd,
  -- Specify filetypes so server attaches to buffer reliably. For details see:
  -- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#efm
  filetypes = {
    "python",
    "lua",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "json",
  },
  settings = {
    rootMarkers = { ".git/", "stylua.toml" },
    languages = {
      python = { black, isort, flake8, mypy },
      lua = { stylua },
      javascript = { eslint },
      typescript = { eslint },
      typescriptreact = { eslint },
      javascriptreact = { eslint },
      json = { prettier },
    },
  },
}
