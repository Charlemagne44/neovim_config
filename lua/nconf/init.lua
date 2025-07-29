-- ~/.config/nvim/lua/nconf/init.lua

vim.g.mapleader = " "
vim.keymap.set('n', '<leader>e', ':Ex<CR>', { noremap = true, silent = true })

require("nconf.lazy_init")
require("nconf.set")
require("nconf.remap")
require("nconf.theme")
require("nconf.diagnostics")
