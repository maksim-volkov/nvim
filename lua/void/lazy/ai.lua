return {
    {
        'olimorris/codecompanion.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
        },
        opts = {
            strategies = {
                chat = {
                    adapter = 'ollama',
                },
            },
            opts = {
                log_level = 'DEBUG',
            },
            adapters = {
                ollama = function()
                    return require("codecompanion.adapters").extend("ollama", {
                    env = {
                        url = os.getenv("AIAPI_ADDRESS") or "http://localhost:11434",
                        --api_key = "OLLAMA_API_KEY",
                    },
                    headers = {
                        ["Content-Type"] = "application/json",
                        --["Authorization"] = "Bearer ${api_key}",
                    },
                    parameters = {
                        sync = true,
                    },
                  })
                end,
            },
        },
    }
}
