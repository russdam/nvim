return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000, -- Load early
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "modern", -- Gives you the clean Helix-style arrow aesthetic
        options = {
          softwrap = 30,
          multilines = {
            enabled = true,
            always_show = false, -- Only shows when your cursor is on the line
          },
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Disables LazyVim's default end-of-line virtual text so it doesn't double-render
      diagnostics = {
        virtual_text = false,
      },
    },
  },
}
