local lsp = require('lsp-zero').preset({})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

lsp.nvim_workspace()

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'lua_ls',
})

lsp.nvim_workspace()

lsp.on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set('n', "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set('n', "[d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set('n', "]d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set('n', "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set('n', "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set('n', "<leader>vrr", function() vim.lsp.bug.references() end, opts)
  vim.keymap.set('i', "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

lsp.setup()

cmp.setup({
  mapping = {
    ['<C-m>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-b>'] = cmp.mapping.confirm({ select = true }),
    ['<C-o>'] = cmp.mapping.complete(),
    ['<C-p>'] = cmp.mapping.close(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
  },
  formatting = {
    fields = { "abbr", "menu", "kind" },
    format = function(entry, item)
      local short_name = {
        nvim_lsp = "LSP",
        nvim_lua = "nvim",
      }

      local menu_name = short_name[entry.source.name] or entry.source.name

      item.menu = string.format("[%s]", menu_name)
      return item
    end
  },
  sorting = {
    priority_weight = 1,
    comparators = {
      cmp.config.compare.locality,
      cmp.config.compare.recently_used,
      cmp.config.compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
      cmp.config.compare.offset,
      cmp.config.compare.order,
    }
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})

