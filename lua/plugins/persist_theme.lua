-- Define where to save the last colorscheme name
local cache_path = vim.fn.stdpath("cache") .. "/last_colorscheme.txt"

-- Helper function to read the saved colorscheme
local function get_saved_theme()
  local file = io.open(cache_path, "r")
  if not file then
    return nil
  end
  local theme = file:read("*l")
  file:close()
  return theme and vim.trim(theme) or nil
end

-- Helper function to save the current colorscheme
local function save_theme(theme)
  local file = io.open(cache_path, "w")
  if file then
    file:write(theme)
    file:close()
  end
end

-- Read the saved theme right now (during startup)
local last_theme = get_saved_theme()

return {
  -- Inject our saved theme directly into LazyVim's core configuration options
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      if last_theme and last_theme ~= "" then
        opts.colorscheme = last_theme
      end
    end,
  },

  -- Set up an event listener to track future changes (e.g., via Telescope or :colorscheme)
  {
    "nvim-treesitter/nvim-treesitter", -- Using a core plugin hook to set up our autocommand cleanly
    init = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function(args)
          -- Ignore intermediate 'default' theme triggers during startup
          if args.match ~= "default" then
            save_theme(args.match)
          end
        end,
      })
    end,
  },
}
