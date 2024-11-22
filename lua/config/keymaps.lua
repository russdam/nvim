-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remap q to :Macro
vim.keymap.set("n", "q", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_create_user_command("Macro", function(args)
  vim.cmd("normal! q" .. args.args)
end, { nargs = 1, desc = "Create macro" })
