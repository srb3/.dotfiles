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
        -- nvim_exec [[
        -- augroup lsp_document_highlight
        -- autocmd! * <buffer>
        -- autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        -- autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        -- augroup END
        -- ]]
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

local black = require "stnley.lsp.efm.black"
local isort = require "stnley.lsp.efm.isort"
local flake8 = require "stnley.lsp.efm.flake8"
local mypy = require "stnley.lsp.efm.mypy"
lspconfig.efm.setup {
    on_attach = custom_attach,
    init_options = { documentFormatting = true },
    root_dir = vim.loop.cwd,
    settings = {
        rootMarkers = {".git/"},
        languages = {
            python = { black, isort, flake8, mypy }
        }
    }
}

