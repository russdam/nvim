-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- ~/.config/nvim/lua/config/keymaps.lua
vim.keymap.set("n", "<leader>ci", function()
  -- 1. Grab the current active buffer and window details first
  local current_win = vim.api.nvim_get_current_win()

  -- 2. Execute Inspect safely *within* the context of your code window
  local output = ""
  vim.api.nvim_win_call(current_win, function()
    output = vim.fn.execute("Inspect")
  end)

  -- 3. Now open the vertical split panel
  vim.cmd("vnew")
  local buf = vim.api.nvim_get_current_buf()

  -- 4. Configure scratchpad options so it doesn't try to save as a real file
  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].swapfile = false
  vim.bo[buf].filetype = "query" -- Adds nice syntax highlighting to the capture list

  -- 5. Dump the captured lines into the split
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(output, "\n"))
end, { desc = "Inspect Syntax (Permanent Split)" })
