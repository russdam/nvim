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
  -- }

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
  {
    "nasccped/rustheme.nvim",
    name = "rusttheme",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("rustheme-core-light")
    end,
  },

  -- {
  --   "kryptamine/gruber-darker-renaissance",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("gruber-darker-renaissance").setup({})
  --     vim.cmd.colorscheme("gruber-darker-renaissance")
  --   end,
  -- },

  -- ~/.config/nvim/lua/plugins/theme.lua
  -- ~/.config/nvim/lua/plugins/theme.lua
  -- ~/.config/nvim/lua/plugins/theme.lua
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
