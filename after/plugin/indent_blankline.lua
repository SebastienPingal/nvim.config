vim.opt.list = true

require("indent_blankline").setup {
    char = "▏",
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
    context_char =  "▏",
    use_treesitter = true,
    use_treesitter_scope = true,
}
