require("nvim-treesitter.configs").setup({
  -- A list of parser names, or "all"
  ensure_installed = {
    "html",
    "c",
    "bash",
    "css",
    "glsl",
    "json",
    "make",
    "markdown",
    "python",
    "rust",
    "scss",
    "sql",
    "toml",
    "typescript",
    "tsx",
    "lua",
    "javascript",
    "help",
    "comment",
    "cmake",
  },
  -- Other settings
  sync_install = false,
  auto_install = true,
  -- For when ensure_installed = "all"
  ignore_install = {},
  -- Highlighting settings
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
})
