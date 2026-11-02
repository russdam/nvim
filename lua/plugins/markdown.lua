return {
  "MeanderingProgrammer/render-markdown.nvim", -- The plugin repository string

  config = function()
    -- This runs the require statement inside a function block as Neovim expects
    require("render-markdown").setup({
      latex = { enabled = false },
    })
  end,
}
