-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com
-- Add any additional options here
vim.opt.winborder = "rounded"

-- 1. Explicitly initialize rustaceanvim options
vim.g.rustaceanvim = {
  tools = {
    float_win_config = {
      border = "rounded",
    },
  },
}

local function set_completion_border_highlights()
  -- Premium rich dark brown theme values
  local dark_brown_bg = "#261c14" -- Smooth dark chocolate background
  local warm_tan_fg = "#dabfa5" -- Muted clay-brown text for readability

  -- Border styling: Set background to transparent (nil) or black to match your theme
  local border_bg = nil -- Use `nil` for transparent background, or "#181818" for solid black
  local border_line = "#403022" -- A subtle brown/gray outline for the border ring itself

  -- Force global hover/popups to use the dark brown theme
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = dark_brown_bg, fg = warm_tan_fg, link = nil })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = border_bg, fg = border_line, link = nil })

  -- Align Blink's documentation popups to match the same theme perfectly
  vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = dark_brown_bg, fg = warm_tan_fg, link = nil })
  vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { bg = border_bg, fg = border_line, link = nil })
  vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "FloatBorder" })
end

-- Run it immediately on startup
set_completion_border_highlights()

-- Run it on colorscheme switches so it never gets overwritten again
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_completion_border_highlights,
})
