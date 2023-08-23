vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap('i', '<C-space>', 'copilot#Accept("<CR")', { silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-j>', 'copilot#Next()', { silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-k>', 'copilot#Previous()', { silent = true, expr = true })
