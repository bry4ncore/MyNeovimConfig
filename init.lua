-- ~/.config/nvim/init.lua

-- ===================================
-- 1. Global Neovim Configurations
-- ===================================

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

-- Basic Neovim options
vim.opt.nu = true            -- Show line numbers
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

require "autopairs-config"

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
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- LSP for Pythob 
lspconfig.pylsp.setup({ 
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


--LSP for Bash
lspconfig.bashls.setup({
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'bash', 'sh' }
})

vim.lsp.enable 'bashls'

--LSP for C
lspconfig.clangd.setup({

    filetypes = { 'c', 'cpp' , 'objc', 'objcpp' , 'h'},

    capabilities = cmp_nvim_lsp.default_capabilities(),
    on_attach = function(client, bufnr)
        local buf_set_keymap = vim.api.nvim_buf_set_keymap
        local opts = { noremap = true, silent = true }

        buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
    end,
})

--Mouse Support

vim.o.mouse = 'a'

--Mappings
--

-- On/Off NvimTree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true, desc = 'Toggle NvimTree' })

-- On in local file
vim.keymap.set('n', '<leader>nf', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true, desc = 'Find current file in NvimTree' })
