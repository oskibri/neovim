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

-- BOILERPLATE ----------------------------------------------------------
require('boilerplate.html')         -- HTML
require('boilerplate.bash')         -- BASH

-- -- PLUGIN CONFIGS -------------------------------------------------------
-- require('plugins.treesitter')       -- Treesitter
require('plugins.mason')            -- Mason
require('plugins.cmp')              -- LSP Complition (auto complition)
require('plugins.comment')          -- Comment (+ts_context_commentstring)
require('plugins.osc52')            -- Osc52 (Clipboard functionality over SSH)
require('plugins.autopairs')        -- Auto pairs
require('plugins.autotag')          -- Auto tag (html, xml etc.)
require('plugins.neogen')           -- Neogen (generate function text)

-- LSP ------------------------------------------------------------------
require('lsp.config')
