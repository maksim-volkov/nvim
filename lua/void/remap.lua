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

function OPEN_DEBUG()
    local widgets = require('dap.ui.widgets');
    local sidebar = widgets.sidebar(widgets.scopes);
    sidebar.open();
end
vim.keymap.set('n', '<leader>db', '<cmd>lua OPEN_DEBUG() <CR>', { desc = 'Open debugging sidebar' })

function DEBUG_GO_TEST()
    require('dap-go').debug_test()
end
vim.keymap.set('n', '<leader>dbt', '<cmd>lua DEBUG_GO_TEST() <CR>', { desc = 'Debug Go test' })

-- Copy to clipboard.
vim.keymap.set('v', '<C-c>', '"*y', { desc = 'Copy to system clipboard' })

-- File explorer.
vim.keymap.set('n', '<F2>', '<cmd>NvimTreeToggle <CR>', { desc = 'Toggle file expolorer' })

-- Symbols
vim.keymap.set('n', '<leader>t', '<cmd>Outline <CR>', { desc = 'Toggle symbols expolorer' })
