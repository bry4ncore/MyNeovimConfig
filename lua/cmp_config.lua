local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  -- Configuração de snippets para integração com LuaSnip
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  -- Mapeamentos de teclado para o menu de autocompletar
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),       -- Rola a documentação para cima
    ['<C-f>'] = cmp.mapping.scroll_docs(4),        -- Rola a documentação para baixo
    ['<C-Space>'] = cmp.mapping.complete(),        -- Abre o menu de autocompletar
    ['<C-e>'] = cmp.mapping.abort(),               -- Cancela o menu
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirma a seleção (seleciona a primeira opção se não houver destaque)
  }),

  -- Fontes de autocompletar
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },    -- Sugestões do Language Server
    { name = 'luasnip' },     -- Sugestões de snippets
    { name = 'buffer' },      -- Sugestões de palavras no buffer atual
    { name = 'path' },        -- Sugestões de caminhos de arquivo
  }),

  -- Aparência do menu de autocompletar
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  -- Opções diversas
  completion = {
    completeopt = 'menu,menuone,noinsert' -- Exibe apenas o menu, sem inserir a sugestão automaticamente
  },
})

-- Configuração de autocompletar para a linha de comando (modo CMDLINE)
-- Para pesquisa (/)
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Para comandos (:)
--cmp.setup.cmdline(':', {
--  mapping = cmp.mapping.preset.cmdline(),
--  sources = cmp.config.sources({
--    { name = 'path' },
--    { name = 'cmdline' }
--  })
--})
