require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all" 
  ensure_installed = 'all', 

  -- Other settings
  sync_install = false,
  auto_install = true,

  -- For when ensure_installed = "all"
  ignore_install = { },

  -- Highlighting settings
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
