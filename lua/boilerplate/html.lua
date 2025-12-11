-- HTML --------------------------------------------------------------------------  
vim.api.nvim_create_autocmd('BufNewFile', {
    pattern = '*.html',
    callback = function() 
        local filename = vim.fn.expand('%:t:r')  -- filename without extension

        local lines = {
            '<!DOCTYPE html>',
            '<html lang="en">',
            '    <head>',
            '        <meta charset="UTF-8">',
            '        <meta name="viewport" content="width=device-width, initial-scale=1.0">',
            '        <meta name="author" content="Oskar Voldbakken Hesle">',
            '        <title>' .. filename .. '</title>',
            '    </head>',
            '    <body>',
            '         ',
            '    </body>',
            '</html>',
        }

        vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)  -- insert into buffer startinsert
        vim.api.nvim_win_set_cursor(0, { 10, 8 })  -- line 9 (1-based), column 0
        vim.cmd('normal! A')
        vim.cmd('startinsert')
    end
})
