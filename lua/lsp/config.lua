---------------------------------------------------------------------------------------
-- UI
---------------------------------------------------------------------------------------
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = { border = 'rounded' },
})

---------------------------------------------------------------------------------------
-- DEFAULTS -- For attach & capabilities
---------------------------------------------------------------------------------------

-- Function that will run when LSP attaches to a buffer
local on_attach = function(_, bufnr)
    local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    -----------------------------------------------------------------------------
    -- LSP Navigation / actions
    -----------------------------------------------------------------------------
    map('n', 'gd',          vim.lsp.buf.definition,         "Go to definition")
    map('n', 'gD',          vim.lsp.buf.declaration,        "Go to declaration")
    map('n', 'gi',          vim.lsp.buf.implementation,     "Go to implementation")
    map('n', 'gr',          vim.lsp.buf.references,         "List references")
    map('n', '<C-k>',   vim.lsp.buf.hover,              "Hover documentation")
    map('n', '<leader>rn',  vim.lsp.buf.rename,             "Rename symbol")
    map('n', '<leader>ca',  vim.lsp.buf.code_action,        "Code action")

    -----------------------------------------------------------------------------
    -- Diagnostics keymaps
    -----------------------------------------------------------------------------
    map('n', '<C-;>',       vim.diagnostic.open_float,     "Open diagnostics under cursor")
    map('n', '<leader>loc', vim.diagnostic.setloclist,     "Diagnostics to loclist")

    -----------------------------------------------------------------------------
    -- Manual format keymap
    -----------------------------------------------------------------------------
    map('n', '<leader>f', function()
        vim.lsp.buf.format({ async = true })
    end, "Format buffer")
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

---------------------------------------------------------------------------------------
-- DEFAULT CONFIGURATION For all servers
---------------------------------------------------------------------------------------
vim.lsp.config('*', {
    on_attach = on_attach,
    capabilities = capabilities
})


---------------------------------------------------------------------------------------
-- Lua LSP Configuration
---------------------------------------------------------------------------------------
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim' } },
            workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME },
            },
            completion = { callSnippet = "Replace" },
            telemetry = { enable = true },
        },
    },
})


---------------------------------------------------------------------------------------
-- Python LSP Configuration
---------------------------------------------------------------------------------------
vim.lsp.config('pylsp', {
    settings = { 
        pylsp = { 
            plugins = { 
                pycodestyle = {
                    ignore = { 'E501', 'E305', 'E302', 'E303'}
                },
                pyflakes = { enabled = false }
            },
        },
    },
})

---------------------------------------------------------------------------------------
-- ENABLE Servers
---------------------------------------------------------------------------------------
vim.lsp.enable('lua_ls')
vim.lsp.enable('clangd')
vim.lsp.enable('ts_ls')
vim.lsp.enable('pylsp')
