-- VARIABLES -----------------------------------------
local map = vim.keymap.set


-- GENERAL -------------------------------------------
-- Save / Quit
map('n', '<leader>w<Enter>', '<cmd>w<cr>',     { desc = "Save file" })
map('n', '<leader>ww', '<cmd>wq<cr>',   { desc = "Save file and quit window" })
map('n', '<leader>qq', '<cmd>q!<cr>',   { desc = "Quit window without saving" })

-- Clear search highligh
map('n', '<leader>h', '<cmd>nohlsearch<cr>', { desc = "Clear search highlight" })

-- BUFFER MANAGEMENT --------------------------------
-- Close buffer
map('n', '<leader>q',   '<cmd>bdelete<cr>', { desc = "Close buffer" })
map('n', '<C-b>',       '<cmd>bdelete<cr>', { desc = "Close buffer" })


-- MOVEMENT ------------------------------------------
-- Move through wrapped lines
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true, desc = "Move up through wrapped lines" })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true, desc = "Move down through wrapped lines" })

-- Move whole lines up/down
map("n", "J", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "K", ":m .-2<CR>==", { desc = "Move line up" })

-- Move whole selection blocks up/down
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move block up" })


-- COMMENTING ----------------------------------------
-- Line comment
map('n', '<C-l>', 'gcc',        { remap = true, desc = "Line comment this line" })
map('v', '<C-l>', 'gc',         { remap = true, desc = "Line comment these lines" })
map('n', '<leader>o', 'gcO',    { remap = true, desc = "Make comment above line" })
map('n', '<leader>a', 'gcA',    { remap = true, desc = "Make comment at end of line" })

-- Block comment
map('v', '<C-b>', 'gb',         { remap = true, desc = "Block comment this/these line(s)" })


-- TERMINAL ------------------------------------------
-- Exit terminal
map('t', '<Esc>', [[<C-\><C-n>]], { desc = "Exit terminal mode" })
