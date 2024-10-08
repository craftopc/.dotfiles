local opt = vim.opt
local g = vim.g

opt.number = true
opt.relativenumber = true
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.autoindent = true
opt.expandtab = true
opt.list = true
opt.cursorline = true
opt.cmdheight = 2
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true -- default: on
opt.incsearch = true -- default: on
opt.wildmenu = true -- default: on
opt.termguicolors = true -- plugin:bufferline needed
opt.completeopt = { "menu", "menuone", "noselect" } -- plugin: cmp needed
opt.laststatus = 0

g.mapleader = " "
g.maplocalleader = "\\"
