return {
  "aktersnurra/no-clown-fiesta.nvim",
  "datsfilipe/vesper.nvim",
  "projekt0n/github-nvim-theme",
  "dustypomerleau/tol.nvim",
  "drazil100/dusklight.vim",
  "slugbyte/lackluster.nvim",
  "olivercederborg/poimandres.nvim",
  "paulfrische/reddish.nvim",
  "nyoom-engineering/oxocarbon.nvim",
  {
    "wurli/cobalt.nvim",
    opts = {
      overrides = function(colors)
        return {
          LspReferenceWrite = { bg = colors.palette.MintyFresh, fg = colors.palette.MochaBrown },
          LspReferenceRead = { bg = colors.palette.MintyFresh, fg = colors.palette.MochaBrown },
          LspReferenceText = { bg = colors.palette.MintyFresh, fg = colors.palette.MochaBrown },
          vim_lsp_references = { bg = colors.palette.MintyFresh, fg = colors.palette.MochaBrown },
          vim.api.nvim_set_hl(0, "@lsp.type.lifetime.rust", { italic = true }),
        }
      end,
    },
  },
}
