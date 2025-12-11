local neogen = require('neogen')
neogen.setup()
vim.keymap.set('n', '<leader>nf', neogen.generate, { desc = "(Neo)generate function text"})
