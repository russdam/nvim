return {
  "nvim-neotest/neotest",
  opts = {
    -- This merges with LazyVim's default neotest configurations
    floating = {
      border = "rounded", -- Options: "single", "double", "rounded", "solid", "shadow"
      max_width = 90,
      max_height = 0.8,
    },
    output = {
      open_on_run = true,
    },
  },
}
