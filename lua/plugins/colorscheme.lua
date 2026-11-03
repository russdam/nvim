-- lua/plugins/colorscheme.lua

return {
  --   {
  --     "rezniqov/soviet.nvim",
  --     lazy = false,
  --     priority = 1000,
  --     opts = {},
  --   },

  --   {
  --     "LazyVim/LazyVim",
  --     opts = {
  --       colorscheme = "soviet-dark",
  --       -- colorscheme = "soviet-light",
  --     },
  --   },

  -- {
  --   "oxidescheme/nvim",
  --   name = "oxide",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("oxide").setup()
  --     -- vim.cmd.colorscheme("oxide")
  --   end,
  -- },

  -- {
  --   "nasccped/rustheme.nvim",
  --   name = "rusttheme",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme("rustheme-core-light")
  --   end,
  -- },

  {
    "kryptamine/gruber-darker-renaissance",
    lazy = false,
    priority = 1000,
    config = function()
      -- 1. Setup the theme to satisfy strict types
      require("gruber-darker-renaissance").setup({
        bold = true,
        italic = {
          strings = true,
          comments = true,
          operators = false,
          folds = true,
        },
        invert = {
          signs = false,
          tabline = false,
          visual = false,
        },
        undercurl = true,
        underline = true,
        transparent = false,
        terminal_colors = true,
        sidebars = { "qf", "help" },
        plugins = {},
        on_colors = function(colors) end,
        on_highlights = function(highlights, colors) end,
      })

      -- 2. Load the colorscheme
      vim.cmd.colorscheme("gruber-darker-renaissance")

      -- 3. Explicitly initialize rustaceanvim options right here
      -- This guarantees it is registered before your LSP attaches to the Rust file
      vim.g.rustaceanvim = {
        tools = {
          float_win_config = {
            border = "rounded",
          },
        },
      }

      -- 4. Set the colors *and* explicitly clear the "link" metadata
      -- If a theme "links" NormalFloat to something else, setting just 'bg' can fail.
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#f4ecd8", fg = "#3c3836", link = nil })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#f4ecd8", fg = "#e1d4b7", link = nil })
    end,
  },

  -- {
  --   "metalelf0/black-metal-theme-neovim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     theme = "burzum", -- Replace with your preferred band theme
  --     plain_float = false,
  --   },
  --   config = function(_, opts)
  --     require("black-metal").setup(opts)
  --     require("black-metal").load()
  --   end,
  -- },
}
