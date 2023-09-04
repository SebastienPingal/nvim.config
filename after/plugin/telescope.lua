require "telescope".setup {
  pickers = {
    colorscheme = {
      enable_preview = true,
    },
  },
  defaults = { sorting_strategy = "ascending" },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>c', builtin.colorscheme, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

