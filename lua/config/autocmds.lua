-- -----------------------------------------------------------------------
-- removing the redundant pair on '  as we have lifetime symbols in Rust
-- =======================================================================

local rust_group = vim.api.nvim_create_augroup("RustDisableSingleQuote", { clear = true })

-- Unmap single quote pairing when a Rust file is opened
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  group = rust_group,
  callback = function()
    if pcall(require, "mini.pairs") then
      MiniPairs.unmap("i", "'", "''")
    end
  end,
  desc = "Disable single quote autopair for Rust lifetimes",
})

-- Handle edge case where mini.pairs lazy-loads after the Rust file is already open
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = rust_group,
  callback = function(event)
    if event.data == "mini.pairs" and vim.bo.filetype == "rust" then
      MiniPairs.unmap("i", "'", "''")
    end
  end,
  desc = "Ensure single quote is unmapped if mini.pairs loads lazily",
})
