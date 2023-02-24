-- :help options

local options = {
    -- Indentation 
    expandtab = true,
    smartindent = true,
    shiftwidth = 4,
    tabstop = 4,

    -- Visuals
    number = true,
    numberwidth = 4,
    relativenumber = false,
    cmdheight = 2,
    splitbelow = true,
    splitright = true,
    wrap = false,
    showmode = true,
    termguicolors = true,
    -- vim.opt.signcolumn = 'yes',

    -- Editing
    fileencoding = 'utf-8',
    clipboard = 'unnamedplus',
    mouse = 'c',
    completeopt = { 'menuone', 'noselect' },
}

-- Let - work with word commands
vim.cmd [[set iskeyword+=-]]

-- Apply options
for k, v in pairs(options) do
    vim.opt[k] = v
end
