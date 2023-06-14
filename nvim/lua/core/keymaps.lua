vim.g.mapleader = ';'

local function set_bg_light()
    vim.cmd('set background=light')
    local colors_name = vim.g.colors_name
    vim.cmd('colorscheme shine')
    vim.cmd('colorscheme ' .. colors_name)
end

local function set_bg_dark()
    vim.cmd('set background=dark')
    local colors_name = vim.g.colors_name
    vim.cmd('colorscheme ron')
    vim.cmd('colorscheme ' .. colors_name)
end

-- keymaps
vim.keymap.set('i', '<C-g>', '<esc>')
vim.keymap.set('i', '<C-;>', '::') -- for C++ and Rust
vim.keymap.set('n', '<leader>vl', set_bg_light)
vim.keymap.set('n', '<leader>vd', set_bg_dark)
vim.keymap.set('n', '<c-s>', ':w<cr>')
-- vim.keymap.set('n', '<leader>', ':')
-- w: workspace
vim.keymap.set('n', '<F1>', ':Workspace LeftPanelToggle<cr>')
vim.keymap.set('n', '<F2>', ':Workspace RightPanelToggle<cr>')
vim.keymap.set('n', '<leader>w0', ':Workspace BottomPanelToggle<cr>')
-- y: telescope
vim.keymap.set('n', '<F9>', function() require 'telescope.builtin'.find_files {} end)
vim.keymap.set('n', '<F10>', function() require 'telescope.builtin'.git_files {} end)
vim.keymap.set('n', '<F11>', function() require 'telescope.builtin'.buffers {} end)
vim.keymap.set({ 'n', 'i' }, '<C-p>', function() require 'telescope.builtin'.registers {} end)
-- w: window
vim.keymap.set('n', '<leader>w1', '<c-w>o')
vim.keymap.set('n', '<leader>wx', ':x<cr>')
-- vim.keymap.set('n', '<leader>w3', ':sp<cr>')
vim.keymap.set('n', '<leader>w2', ':vs<cr>')
-- Ctrl: cursor turns to other window
vim.keymap.set('n', '<c-l>', '<c-w>l')
vim.keymap.set('n', '<c-h>', '<c-w>h')
-- window resize
vim.keymap.set('n', '<m-->', '<c-w><')
vim.keymap.set('n', '<m-=>', '<c-w>>')
vim.keymap.set('n', '<m-9>', '<c-w>-')
vim.keymap.set('n', '<m-0>', '<c-w>+')
-- b: buffer
vim.keymap.set('n', '<leader>bn', ':bn<cr>')
vim.keymap.set('n', '<leader>bp', ':bp<cr>')
vim.keymap.set('n', '<leader>bd', ':Bdelete<cr>')
-- p: plugins
vim.keymap.set('n', '<leader>pi', ':PackerInstall<cr>')
vim.keymap.set('n', '<leader>pc', ':PackerClean<cr>')
-- s: search
vim.keymap.set('n', '<leader>ss', '/')
vim.keymap.set('n', '<leader>sw', '/\\<lt>\\><left><left>')
-- l/g/w: language
-- l: general
-- g: goto
-- w: workspace
-- e: diagnostics
vim.keymap.set('n', '<leader>ee', ':Lspsaga show_line_diagnostics<cr>')
vim.keymap.set('n', '<leader>ef', ':Lspsaga show_cursor_diagnostics<cr>')
vim.keymap.set('n', '<leader>el', ':TroubleToggle<cr>') -- Show list of diagnostics across the workspace
vim.keymap.set('n', '<leader>et', ':Trouble<cr>') -- Focus onto the trouble window
vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist)
vim.keymap.set('n', '<leader>lk', ':Lspsaga hover_doc<cr>')
vim.keymap.set('n', '<leader>ld', ':Lspsaga preview_definition<cr>')
vim.keymap.set('n', '<leader;lr', ':Lspsaga rename<cr>')
vim.keymap.set('n', '<leader>lh', vim.lsp.buf.signature_help)
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>la', ':Lspsaga code_action<cr>')
vim.keymap.set('n', '<F12>', ':Lspsaga code_action<cr>')

vim.keymap.set('n', '<F3>', ':Glance definitions<CR>')
vim.keymap.set('n', '<F4>', ':Glance references<CR>')
vim.keymap.set('n', '<leader>gt', ':Glance type_definitions<CR>')
vim.keymap.set('n', '<leader>gi', ':Glance implementations<CR>')
vim.keymap.set('n', '<leader>gN', ':Lspsaga diagnostic_jump_prev<cr>')
vim.keymap.set('n', '<leader>gn', ':Lspsaga diagnostic_jump_next<cr>')

vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder)
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder)
vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end)

-- t: terminal
-- use <f5> to toggle terminal, this can be set in lua/configs/terminal.lua
-- the default position is also set in lua/configs/terminal.lua
local terminal = require('toggleterm.terminal')
vim.keymap.set('t', '<C-g>', '<C-\\><C-n>')
vim.keymap.set('n', '<leader>tt', ':ToggleTerm direction=tab<cr>')
vim.keymap.set('n', '<leader>tn', function() terminal.Terminal:new():toggle() end)
vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<cr>')
vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<cr>')
vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical<cr>')

-- h: git
vim.keymap.set('n', '<leader>hu', ':Gitsigns undo_stage_hunk<cr>')
vim.keymap.set('n', '<leader>hn', ':Gitsigns next_hunk<cr>')
vim.keymap.set('n', '<leader>hN', ':Gitsigns next_hunk<cr>')
vim.keymap.set('n', '<leader>hc', ':Gitsigns preview_hunk<cr>')
vim.keymap.set('n', '<leader>hr', ':Gitsigns reset_hunk<cr>')
vim.keymap.set('n', '<leader>hR', ':Gitsigns reset_buffer')
vim.keymap.set('n', '<leader>hb', ':Gitsigns blame_line<cr>')
vim.keymap.set('n', '<leader>hd', ':Gitsigns diffthis<cr>')
vim.keymap.set('n', '<leader>hs', ':<C-U>Gitsigns select_hunk<CR>')
