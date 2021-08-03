vim.g.loaded_matchparen = 1

local opt = vim.opt

opt.wildignore = "__pycache__"
opt.wildignore = opt.wildignore + {
    "*.pyc",
    "*pycache*",
    "**/coverage/*",
    "**/node_modules/*",
    "**/.git/*"
}

opt.guicursor = ""
opt.hidden = true
opt.hlsearch = false
opt.incsearch = true
opt.number = true -- show actual number of current line
opt.relativenumber = true -- show line numbers
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.splitright = true -- prefer windows split to right
opt.splitbelow = true -- prefer windows split to bottom

opt.colorcolumn = "80"
opt.termguicolors = true

opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.softtabstop = 4
opt.tabstop = 4
opt.wrap = false

opt.belloff = "all"

opt.backup = false
opt.undodir = os.getenv("XDG_CACHE_HOME") .. "/.nvim/undodir"
opt.undofile = true
opt.swapfile = false

opt.mouse = "n"
