local fn = vim.fn

-- Auto-install Packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing Packer... Please restart Neovim";
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
local status_ok, packer = pcall(require, "packer");
if not status_ok then
    return
end

-- Packer settings
packer.init {
    display = {
        -- Display in a popup window
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    }
}

-- Install plugins here
return packer.startup(function(use)
    use "wbthomason/packer.nvim" -- Self-managing packer
    -- ...
    
    -- Automaticall set up packer config (Put at end)
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)




