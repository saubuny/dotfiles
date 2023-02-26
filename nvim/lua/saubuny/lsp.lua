-- Mason for installing servers (and some other stuff)
require('mason').setup({
  ui = {
    icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
  },
  keymaps = {
    -- Keymap to expand a package
    toggle_package_expand = "<CR>",
    -- Keymap to install the package under the current cursor position
    install_package = "i",
    -- Keymap to reinstall/update the package under the current cursor position
    update_package = "u",
    -- Keymap to check for new version for the package under the current cursor position
    check_package_version = "c",
    -- Keymap to update all installed packages
    update_all_packages = "U",
    -- Keymap to check which installed packages are outdated
    check_outdated_packages = "C",
    -- Keymap to uninstall a package
    uninstall_package = "X",
    -- Keymap to cancel a package installation
    cancel_installation = "<C-c>",
    -- Keymap to apply language filter
    apply_language_filter = "<C-f>",
  }, 
})

-- Compatibility with nvim lsp
require('mason-lspconfig').setup({
  -- Servers that mason should automatically install
  ensure_installed = { 'asm_lsp', 'clangd', 'cssls', 'emmet_ls', 'jsonls', 'tsserver', 'lua_ls', 'tailwindcss', 'rust_analyzer', 'html'  },
})

-- Server setup
local lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  -- Mappings
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)
end

-- Lua
lsp['lua_ls'].setup({
  on_attach = on_attach,
})
