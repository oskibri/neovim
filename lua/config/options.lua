-- SHORTCUT FOR OPTIONS ------------------------------------------------
local opt = vim.opt


-- UI --
opt.number          = true		        -- show line numbers
opt.relativenumber 	= true		        -- relative numbers
opt.cursorline 		= true		        -- highlight current line
opt.termguicolors 	= true		        -- 24-bit colors
opt.signcolumn		= "yes"		        -- always show sign column


-- INDENTATION / TABS --------------------------------------------------
opt.expandtab		= true		        -- use spaces instead of tabs
opt.tabstop		    = 4		            -- how many spaces a <Tab> counts for
opt.shiftwidth		= 4		            -- spaces for each indentation step
opt.softtabstop		= 4		            -- spaces when hittin <Tab> in insert mode
opt.smartindent		= true		        -- smarter autoindenting


-- SEARCH --------------------------------------------------------------
opt.ignorecase      = true              -- case-insensitive search
opt.smartcase       = true              -- ...unless search has capitals
opt.hlsearch        = true              -- highlight matches
opt.incsearch       = true              -- show matches as you type


-- SPLITS --------------------------------------------------------------
opt.splitright      = true              -- vertical splits open to the right
opt.splitbelow      = true              -- horizontal splits open below


-- CLIPBOARD -----------------------------------------------------------
opt.clipboard       = "unnamedplus"     -- copy/paste to both Neovim and system clipboard


-- MISC ----------------------------------------------------------------
opt.mouse           = "a"               -- enable mouse
opt.scrolloff       = 8                 -- keep some lines visible above/below cursor
opt.undofile        = true              -- keep persistent undos/redos after closing

-- REMOVE --------------------------------------------------------------
opt.formatoptions:remove({ 'r', 'o' })
