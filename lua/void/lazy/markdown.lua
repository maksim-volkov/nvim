return {
    {
        "toppair/peek.nvim",
        event = { "VeryLazy" },
        build = "deno task --quiet build:fast",
        config = function()
            require("peek").setup({
                app = 'browser',
                filetype = { "markdown", "vimwiki", "wiki", "markdown.pandoc", "markdown.gfm", "telekasten" },
            })
            vim.api.nvim_create_user_command("Peek", function()
                local peek = require('peek')
                if not peek.is_open() then
                    peek.open()
                else
                    peek.close()
                end
            end, { desc = 'Open markdown preview'})
        end,
    },
}
