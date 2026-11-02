-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.winborder = "rounded"

local function set_completion_border_highlights()
  local normal_float = vim.api.nvim_get_hl(0, { name = "NormalFloat", link = false })
  local float_border = vim.api.nvim_get_hl(0, { name = "FloatBorder", link = false })
  local documentation_background = vim.o.background == "dark" and "#33251C" or "#F4ECD8"

  -- A warm paper-like background in light themes and dark brown in dark themes.
  vim.api.nvim_set_hl(0, "BlinkCmpDoc", { fg = normal_float.fg, bg = documentation_background })

  -- Blink's defaults deliberately blend its borders into the panel background.
  -- Keep the menu border theme-coloured, while matching the documentation border
  -- to the documentation panel.
  vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "FloatBorder" })
  vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = float_border.fg, bg = documentation_background })
end

set_completion_border_highlights()
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_completion_border_highlights,
})
