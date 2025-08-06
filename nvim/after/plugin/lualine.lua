local custom_theme = require'lualine.themes.codedark'

-- Change the background of lualine_c section for normal mode
-- custom_theme.normal.c.fg = '#112233'

require('lualine').setup {
  options = {
    theme = custom_theme,
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    }
  }
}
