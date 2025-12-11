-- Context-aware commentstring setup
require('ts_context_commentstring').setup {
    enable_autocmd = false, -- we let Comment.nvim drive it
}


-- Comment.nvim setup
local pre_hook_ts = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
require('Comment').setup {
    -- pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),

    pre_hook = function(ctx)
        -- Disable for C files
        if vim.bo.filetype == 'c' then
            return
        end
        return pre_hook_ts(ctx)
    end,

    toggler = {
        line = 'gcc',
        block = 'gbc',
    },
    opleader = {
        line = 'gc',
        block = 'gb',
    },
    extra = {
        above = 'gcO',
        below = 'gco',
        eol = 'gcA',
    },
}

local ft = require('Comment.ft')
ft.set({'c', 'cpp', 'h'}, {'// %s', '/* %s */'})
