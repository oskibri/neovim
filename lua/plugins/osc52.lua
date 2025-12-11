-- REQUIRE -------------------------------------------------------------------
local osc52 = require('osc52')


-- SETUP ---------------------------------------------------------------------
osc52.setup {
    max_length = 0,
    silent = false,
    trim = false,
}


-- HELPER FUNCTIONS -----------------------------------------------------------
local function copy(lines, _)
    osc52.copy(table.concat(lines, '\n'))
end

local function paste()
    -- we don't really paste *from* local clipboardhere,
    -- just use Neovim's default register content
    return { vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('') }
end


-- CLIPBOARD -------------------------------------------------------------------
vim.g.clipboard = {
    name = 'osc52',
    copy = {
        ['+'] = copy,
        ['*'] = copy,
    },
    paste = {
        ['+'] = paste,
        ['*'] = paste,
    },
}
