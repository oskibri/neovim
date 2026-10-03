-- TEMPLATE --------------------------------------------------------------------------  
vim.api.nvim_create_autocmd('BufNewFile', {
    pattern = '*.go',
    callback = function() 
        local filename = vim.fn.expand('%:t:r')  -- filename without extension

        local lines = {
            '/*',
            'Program:     ' .. filename,
            'Author:      Oskar Voldbakken Hesle',
            'Date:        ' .. os.date('%Y-%m-%d'),
            '*/', 
            '',
        }

        if filename == "main" then
            vim.list_extend(lines, {
                'package main', '',
                'import "fmt"', '',
                'func main() {',
                '\t',
                '}',
            })
            vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)  -- insert into buffer startinsert
            vim.api.nvim_win_set_cursor(0, { 12, 4 })  -- set cursor
        else
            vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)  -- insert into buffer startinsert
            vim.api.nvim_win_set_cursor(0, { 6, 1 })  -- set cursor
        end
        vim.cmd('normal! A')
        vim.cmd('startinsert')
    end
})
