-- TREESITTER VARIABLES -------------------------------------------------
local configs = require('nvim-treesitter.configs')

-- TREESITTER CONFIGURATION ---------------------------------------------
configs.setup {
    ensure_installed = {
        'lua',
        'c',
        'cpp',
        'python',
        'bash',
        'javascript',
        'json',
        'jsonc',
        'yaml',
        'toml',
        'vim',
        'vimdoc',
        'html',
        'css',
        'ruby',
    },
    sync_install = false, -- Install parsers asynchornously (false = async)
    auto_install = true, -- Automatically install missing parsers
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true }, -- Indentation based on Treesitter
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection      = 'gnn',
            node_incremental    = 'grn',
            scope_incremental   = 'grc',
            node_decremental    = 'grm',
        },
    },


    -- TEXTOBJECTS -------------------------------------------------------
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Jump forward to textobj

            keymaps = {
                -- functions
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",

                -- classes
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",

                -- parameters
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",

                -- loops
                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",
            },
        },

        move = {
            enable = true,
            set_jumps = true, -- add to jumplist

            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            got_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
        },
    },

    -- ENDWISE -------------------------------------------------------
    endwise = { enable = true }
}
