-- ~/.config/nvim/init.lua

-- ===================================
-- 1. Global Neovim Configurations
-- ===================================

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

-- Basic Neovim options
vim.opt.nu = true            -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.tabstop = 2          -- Tab width
vim.opt.shiftwidth = 2       -- Indent width
vim.opt.expandtab = true     -- Use spaces instead of tabs
vim.opt.incsearch = true     -- Incremental search
vim.opt.hlsearch = true      -- Highlight search results
vim.opt.cmdheight = 1        -- Command line height
vim.opt.updatetime = 300     -- Delay for Swpfile updates
vim.opt.timeoutlen = 500     -- Timeout for mapped keycodes
vim.opt.splitright = true    -- Open vertical splits to the right
vim.opt.splitbelow = true    -- Open horizontal splits below
vim.opt.hidden = true        -- Allow hidden unsaved buffers
vim.opt.laststatus = 2       -- Always show the statusline
vim.opt.showmode = false     -- Don't show current mode (plugins like Lualine will handle this)

vim.g.mapleader = ' '

-- ===================================
-- 2. Load Plugins with Packer
-- ===================================

require('plugins')

-- ===================================
-- 3. Plugin Configurations
-- ===================================

vim.cmd('colorscheme everforest')
vim.g.everforest_background = 'medium'
vim.g.everforest_brightness = 'normal'
vim.g.everforest_italic = 1
vim.g.everforest_transparent_background = 1

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    side = 'right',
    width = 25,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

require('cmp_config')

local lspconfig = require('lspconfig')

lspconfig.pylsp.setup({
  -- opcional: adicione configurações específicas para pylsp aqui
  -- por exemplo, para ativar linters específicos
  settings = {
    pylsp = {
      plugins = {
        flake8 = { enabled = true },
        autopep8 = { enabled = true },
        -- Adicione outros plugins que você queira usar
      },
    },
  },
})


--Mappings
--

-- On/Off NvimTree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true, desc = 'Toggle NvimTree' })

-- On in local file
vim.keymap.set('n', '<leader>nf', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true, desc = 'Find current file in NvimTree' })
