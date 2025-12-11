-- TEMPLATE --------------------------------------------------------------------------  
vim.api.nvim_create_autocmd('BufNewFile', {
    pattern = '*.FILE_EXTENSION',
    callback = function() 
        local filename = vim.fn.expand('%:t:r')  -- filename without extension

        local lines = {
            'LINES',
        }

        vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)  -- insert into buffer startinsert
        vim.api.nvim_win_set_cursor(0, { 1, 0 })  -- set cursor
        vim.cmd('normal! A')
        vim.cmd('startinsert')
    end
})
