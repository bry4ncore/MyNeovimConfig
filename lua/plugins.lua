local fn = vim.fn 
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

local ensure_packer = function()
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd('packadd packer.nvim')
    return true
  end
  return false
end

local packer_was_bootstrapped = ensure_packer()

local packer_ok, packer_module = pcall(require, 'packer')

if not packer_ok then
  vim.api.nvim_echo({{
    "ERRO: Não foi possível carregar o Packer. Por favor, verifique sua instalação.", "ErrorMsg"
  }}, true, {})
  print("Detalhes do erro: " .. tostring(packer_module))
  return
end

packer_module.startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'sainnhe/everforest'

  use 'nvim-lualine/lualine.nvim'

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  }

  use 'hrsh7th/nvim-cmp'

  use 'hrsh7th/cmp-nvim-lsp'

  use 'hrsh7th/cmp-buffer'

  use 'hrsh7th/cmp-path'

  use 'L3MON4D3/LuaSnip'

  use 'saadparwaiz1/cmp_luasnip'
 
  use 'neovim/nvim-lspconfig'

  use {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function()
          require("nvim-autopairs").setup {}
      end
  }

  if packer_was_bootstrapped then
    packer_module.sync()
  end
end)
