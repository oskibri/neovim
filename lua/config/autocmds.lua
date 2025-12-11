-- VARIABLES ------------------------------------------------
local autocmd = vim.api.nvim_create_autocmd


-- POSITION -------------------------------------------------
-- Remember last file pos
autocmd('BufReadPost', {
    callback = function()
        local last_pos = vim.fn.line([['"]])
        local last_line = vim.fn.line('$')

        -- only jump if the mark is in a valid line
        if last_pos > 0 and last_pos <= last_line then
            vim.cmd('normal! g`\"')
        end
    end,
})

autocmd("FileType", {
    callback = function()
        vim.opt.formatoptions:remove({ "r", "o" })
    end,
})
