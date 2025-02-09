require("void.set")
require("void.remap")
require("void.lazy_init")

-- Highlight when yanking (copying) text.
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('void-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

