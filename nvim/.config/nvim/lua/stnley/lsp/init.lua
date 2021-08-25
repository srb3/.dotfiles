require "stnley.lsp.handlers"

local lspconfig = require("lspconfig")

local custom_init = function(client)
    client.config.flags = client.config.flags or {}
    client.config.flags.allow_incremental_sync = true
end

local custom_attach = function(client)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_formatting then
        vim.cmd [[augroup Format]]
        vim.cmd [[autocmd! * <buffer>]]
        vim.cmd [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
        vim.cmd [[augroup END]]
    end

    if client.resolved_capabilities.document_highlight then
        vim.cmd [[augroup lsp_document_highlight]]
        vim.cmd [[autocmd! * <buffer>]]
        vim.cmd [[autocmd CursorHold <buffer> :lua vim.lsp.buf.document_highlight()]]
        vim.cmd [[autocmd CursorMoved <buffer> :lua vim.lsp.buf.clear_references()]]
        vim.cmd [[augroup END]]
    end
end

lspconfig.pyright.setup {
    on_init = custom_init,
    on_attach = custom_attach
}

lspconfig.tsserver.setup {
    on_init = custom_init,
    on_attach = custom_attach
}

local sumneko_root_path = ""
local sumneko_binary = ""

local user = vim.fn.expand("$USER")
sumneko_root_path = "/home/" .. user .. "/personal/lua-language-server"
sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"
lspconfig.sumneko_lua.setup {
    on_init = custom_init,
    on_attach = custom_attach,
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";")
            },
            diagnostics = {
                globals = {"vim"}
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                }
            }
        }
    }
}

local black = require "stnley.lsp.efm.black"
local isort = require "stnley.lsp.efm.isort"
local flake8 = require "stnley.lsp.efm.flake8"
local mypy = require "stnley.lsp.efm.mypy"
local luafmt = require "stnley.lsp.efm.luafmt"
lspconfig.efm.setup {
    on_attach = custom_attach,
    init_options = {documentFormatting = true},
    root_dir = vim.loop.cwd,
    settings = {
        rootMarkers = {".git/"},
        languages = {
            python = {black, isort, flake8, mypy},
            lua = {luafmt}
        }
    }
}
