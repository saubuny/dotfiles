local fn = vim.fn

-- Auto-install Packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    }
    print 'Installing Packer... Please restart Neovim';
    vim.cmd [[packadd packer.nvim]]
end

-- Autoreload Neovim on plugins.lua save
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Packer protected call (No annoying errors)
local status_ok, packer = pcall(require, 'packer');
if not status_ok then
    return
end

-- Packer settings
packer.init {
    display = {
        -- Display in a popup window
        open_fn = function()
            return require('packer.util').float { border = 'rounded' }
        end,
    }
}

-- Install plugins here
return packer.startup(function(use)
    use 'wbthomason/packer.nvim' -- Self-managing packer
    
    -- Free colorschemes
    -- use 'lunarvim/colorschemes'

    -- Best colorscheme
    use 'navarasu/onedark.nvim'

    -- Practically mandatory
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- File tree
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- Annoying dependencies that act weird 
    use 'nvim-lua/plenary.nvim'
    use 'nvim-tree/nvim-web-devicons'

    -- Fuzzy finding (make sure ripgrep is installed)
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    -- Set up LSP
    
    -- Automaticall set up packer config (Put at end)
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)



