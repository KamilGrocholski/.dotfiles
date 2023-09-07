require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'rose-pine',
    globalstatus = true,
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
