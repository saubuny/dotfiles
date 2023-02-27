-- Mason for installing servers (and some other stuff)
require('mason').setup({
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗'
    }
  },
  keymaps = {
    -- Keymap to expand a package
    toggle_package_expand = '<CR>',
    -- Keymap to install the package under the current cursor position
    install_package = 'i',
    -- Keymap to reinstall/update the package under the current cursor position
    update_package = 'u',
    -- Keymap to check for new version for the package under the current cursor position
    check_package_version = 'c',
    -- Keymap to update all installed packages
    update_all_packages = 'U',
    -- Keymap to check which installed packages are outdated
    check_outdated_packages = 'C',
    -- Keymap to uninstall a package
    uninstall_package = 'X',
    -- Keymap to cancel a package installation
    cancel_installation = '<C-c>',
    -- Keymap to apply language filter
    apply_language_filter = '<C-f>',
  },
})

-- Compatibility with nvim lsp
require('mason-lspconfig').setup({
  -- Servers that mason should automatically install
  ensure_installed = { 'asm_lsp', 'clangd', 'cssls', 'emmet_ls', 'jsonls', 'tsserver', 'lua_ls', 'tailwindcss', 'rust_analyzer', 'html' },
})

-- Cool UI
require('fidget').setup()

-- Server setup (note: tsserver only works when a tsconfig.json or jsconfig.json are present)
local lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  -- Mappings
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)

  -- Extra config
  local config = {
    virtual_text = {
      prefix = '',
    },
    update_in_insert = true,
    underline = false,
    serverity_sort = true,
  }
  vim.diagnostic.config(config)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Better signs in gutter
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Borders on floating windows
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })

-- Lua
lsp['lua_ls'].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      },
      completion = {
        showWord = 'Disable',
      },
    },
  },
})

-- JS, TS, JSX, TSX

-- Tailwind in html, JSX, TSX

-- Rust

-- html

-- css

-- emmet in html, JSX, TSX

-- C
