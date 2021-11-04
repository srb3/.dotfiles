local black = require "stnley.config.lsp.efm.black"
local flake8 = require "stnley.config.lsp.efm.flake8"
local isort = require "stnley.config.lsp.efm.isort"
local mypy = require "stnley.config.lsp.efm.mypy"
local prettier = require "stnley.config.lsp.efm.prettier"
local shellcheck = require "stnley.config.lsp.efm.shellcheck"
local shfmt = require "stnley.config.lsp.efm.shfmt"
local stylua = require "stnley.config.lsp.efm.stylua"
local terraform = require "stnley.config.lsp.efm.terraform"

return {
  lua = { stylua },
  json = { prettier },
  python = { black, isort, flake8, mypy },
  sh = { shellcheck, shfmt },
  terraform = { terraform },
  yaml = { prettier },
}
