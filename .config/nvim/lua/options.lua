vim.opt.clipboard = 'unnamedplus' -- Use system clipboard
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'a' -- Allow mouse

-- Tab
vim.opt.tabstop = 4 -- Visual spaces per tab
vim.opt.softtabstop = 4 -- Spaces in tab while editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- Tabs are spaces (nice for e.g. Python)

-- UI
vim.opt.number = true -- Show abs number
vim.opt.relativenumber = true
vim.opt.cursorline = true --  Highlight cursor line underneath cursor horizontally.
vim.opt.splitbelow = true -- New vertical split on bottom
vim.opt.splitright = true -- New horizontal split on right

-- Search
vim.opt.incsearch = true -- Search as characters are inserted
vim.opt.hlsearch = true -- Highlight matches
vim.opt.ignorecase = true -- Do not care about casing 
vim.opt.smartcase = true -- ...but make it care if an uppercase is entered
