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
  cmdheight = 1,
  splitbelow = true,
  splitright = true,
  wrap = true,
  showmode = true,
  termguicolors = true,
  signcolumn = 'yes',
  -- Editing
  fileencoding = 'utf-8',
  clipboard = 'unnamedplus',
  mouse = 'c',
  completeopt = { 'menuone', 'noselect' },
}

-- Let - work with word commands
vim.cmd [[set iskeyword+=-]]

-- Remove annoying autocommenting
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
  end,
})

-- Apply options
for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Smaller indents for some languages
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "html", "javascript", "typescript", "typescriptreact", "javascriptreact" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})
