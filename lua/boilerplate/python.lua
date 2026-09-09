-- TEMPLATE --------------------------------------------------------------------------  
vim.api.nvim_create_autocmd('BufNewFile', {
    pattern = '*.py',
    callback = function() 
        local filename = vim.fn.expand('%:t:r')  -- filename without extension

        local lines = {
            '#!/usr/bin/env python3',
            '# Program:     ' .. filename,
            '# Author:      Oskar Voldbakken Hesle',
            '# Date:        ' .. os.date('%Y-%m-%d'),
            '',
        }

        if filename == "main" then
            vim.list_extend(lines, {
                "def main():", '\t', '',
                "if __name__ == '__main__':",
                "\tmain()",
            })
        end

        vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)  -- insert into buffer startinsert
        vim.api.nvim_win_set_cursor(0, { 7, 4 })  -- set cursor
        vim.cmd('normal! A')
        vim.cmd('startinsert')
    end
})
