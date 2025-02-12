return {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    ---@type solarized.config
    config = function(_, opts)
        vim.o.termguicolors = true
        vim.o.background = 'light'
        require('solarized').setup({
            styles = {
                enabled = true,
                variables = { italic = false },
            },
        })
        vim.cmd.colorscheme 'solarized'
    end,
}
