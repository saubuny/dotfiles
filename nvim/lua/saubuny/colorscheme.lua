-- Set theme
local onedark = require('onedark')
onedark.setup {
    style = 'dark',
    transparent = false,
    term_colors = true,
    ending_tildes = false,

    -- Change theme style
    toggle_style_key = '<leader>ts', 
    toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'},
    
    -- Change code style (italic, bold, underline, none)
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },

    -- Lualine config 
    lualine = {
        transparent = false,
    },

    --[[ Use this to enable the theme with lualine
    require('lualine').setup {
        options = {
            theme = 'onedark'
            -- ... your lualine config
      }
    }
    --]]

    -- Custom colors and highlights (requires TreeSitter)
    colors = {},
    highlights = {
        -- ['@string'] = { fg = '$cyan' },
    },
}
onedark.load();

