-- MAP LEADER ----------------------------------------------------------
vim.g.mapleader = " "

-- VARIABLES -----------------------------------------------------------
local stdpath   = vim.fn.stdpath

local config    = stdpath('config')
local data      = stdpath('data')
local state     = stdpath('state')
local cache     = stdpath('cache')
local log       = stdpath('log')

-- GENERAL CONFIGS ------------------------------------------------------
require('config.options')           -- OPTIONS
require('config.keymaps')           -- KEYMAPS
require('config.autocmds')          -- AUTOCMDS
require('config.colorscheme')       -- COLORSCHEMES

-- BOILERPLATE ----------------------------------------------------------
require('boilerplate.html')         -- HTML
require('boilerplate.bash')         -- BASH
require('boilerplate.python')       -- Python

-- -- PLUGIN CONFIGS -------------------------------------------------------
-- require('plugins.treesitter')       -- Treesitter
require('plugins.mason')            -- Mason
require('plugins.cmp')              -- LSP Complition (auto complition)
require('plugins.comment')          -- Comment (+ts_context_commentstring)
require('plugins.osc52')            -- Osc52 (Clipboard functionality over SSH)
require('plugins.autopairs')        -- Auto pairs
require('plugins.autotag')          -- Auto tag (html, xml etc.)
require('plugins.neogen')           -- Neogen (generate function text)
require('plugins.markdown-plus')    -- Markdown Plus (markdown preview, markdown lint etc.)
require('plugins.remote')           -- Remote Neovim over SSH with local config (remote Neovim file editing)
require('plugins.render-markdown')

-- LSP ------------------------------------------------------------------
require('lsp.config')               -- LSP Config (Language Server Protocol)
require('lsp.gopls')

vim.lsp.config('basedpyright', {
    settings = {
        basedpyright = {
            analysis = {
                diagnosticSeverityOverrides = {
                    reportUnusedCallResult = false,
                },
            },
        },
    },
})

vim.keymap.set("n", "gx", function()
  local url = vim.fn.expand("<cfile>")
  vim.fn.jobstart({ "xdg-open", url }, { detach = true })
end, { desc = "Open link under cursor" })

vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if lang and vim.treesitter.language.add(lang) then
            vim.treesitter.start()
        end
    end
})

vim.lsp.config('basedpyright', {
  cmd = { vim.fn.expand('~/.local/bin/basedpyright-langserver'), '--stdio' },
})
vim.lsp.enable('basedpyright')
