-- Clear highlights on search when pressing <leader>n in normal mode
vim.keymap.set('n', '<leader>n', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move focus to the upper window' })

-- Key bindings to iterate through tabs.
vim.keymap.set('n', '<F7>', ':tabp<CR>', { desc = 'Move to the previous tab' })
vim.keymap.set('n', '<F8>', ':tabn<CR>', { desc = 'Move to the next tab' })

-- Fast saving and exit.
vim.keymap.set('n', '<leader>w', ':w!<CR>', { desc = 'Save' })
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Close' })
vim.keymap.set('n', '<leader>x', ':x<CR>', { desc = 'Save & Close' })
vim.keymap.set('n', '<leader>e', ':e<CR>', { desc = 'Reload' })

-- Debugging.
vim.keymap.set('n', '<leader>b', '<cmd>DapToggleBreakpoint <CR>', { desc = 'Toggle breakpoint' })
vim.keymap.set('n', '<F5>', '<cmd>DapStepOver <CR>', { desc = 'Debug step over' })
vim.keymap.set('n', '<F6>', '<cmd>DapStepInto <CR>', { desc = 'Debug step into' })
vim.keymap.set('n', '<F9>', '<cmd>DapContinue <CR>', { desc = 'Debug continue' })
vim.keymap.set('n', '<leader>d', '<cmd>DapNew <CR>', { desc = 'New debug session' })

vim.keymap.set('n', '<leader>db', function()
    local widgets = require('dap.ui.widgets');
    local sidebar = widgets.sidebar(widgets.scopes);
    sidebar.open();
end, { desc = 'Open debugging sidebar' })

vim.keymap.set('n', '<leader>dbt', function()
    require('dap-go').debug_test()
end, { desc = 'Debug Go test' })

-- Copy to clipboard.
vim.keymap.set('v', '<C-c>', '"*y', { desc = 'Copy to system clipboard' })

-- File explorer.
vim.keymap.set('n', '<F2>', '<cmd>NvimTreeToggle <CR>', { desc = 'Toggle file expolorer' })

-- Symbols and troubleshooting.
vim.keymap.set('n', '<leader>t', '<cmd>Trouble symbols toggle <CR>', { desc = 'Open document symbols' })
vim.keymap.set('n', '<leader>tt', '<cmd>Trouble diagnostics toggle <CR>', { desc = 'Open diagnostics' })

-- Git.
vim.keymap.set('n', '<leader>g', ':Git', { desc = 'Git' })

-- Markdown preview.
vim.keymap.set('n', '<leader>md', '<cmd>Peek<CR>', { desc = 'Open markdown preview' })

-- Spell checking.
---@param lang string
local function SetSpell(lang)
    if lang == "off" or lang == "" then
        vim.opt.spell = false
        return
    end
    vim.opt.spell = true
    vim.opt.spelllang = lang
end

vim.api.nvim_create_user_command("SetSpell", function(opts)
    SetSpell(opts.args)
end, {
    desc = "Set spell checking languages.",
    nargs = "*",
    ---@param arg string
    complete = function(arg)
        local langs = {"en", "ru", "en,ru", "off"}

        local function startswith(str, prefix)
            return str:sub(1, #prefix) == prefix
        end

        local filtered = {}

        if arg == "" then
            filtered = langs
        else
            for _, str in ipairs(langs) do
                if startswith(str, arg) then
                    table.insert(filtered, str)
                  end
            end
        end

        table.sort(filtered)

        return filtered
    end,
})

vim.keymap.set('n', '<F3>', ':SetSpell <Tab>', { desc = 'Set language spell cheking' })
