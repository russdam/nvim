return {
  "nvim-lua/plenary.nvim", -- Leverage standard plenary library if needed, but we keep this lightweight
  keys = {
    {
      "gh",
      function()
        -- 1. Get the current active mode
        local mode = vim.api.nvim_get_mode().mode
        local url = ""

        if mode:match("^[vV]") then
          -- Visual Mode: Extract exactly what the user highlighted
          local saved_reg = vim.fn.getreg('"')
          vim.cmd('normal! "vy')
          url = vim.fn.getreg('"')
          vim.fn.setreg('"', saved_reg)
        else
          -- Normal Mode: Grab the whole line text to ensure zero punctuation truncation
          local line = vim.api.nvim_get_current_line()
          -- Target file:// links, standard web links, or raw unquoted strings
          url = line:match('file://[^"]+') or line:match("file://%S+") or line:match("https?://%S+")

          -- Fallback if the regex yields nothing
          if not url or url == "" then
            url = vim.fn.expand("<cfile>")
          end
        end

        -- 2. Strip trailing/leading quotes or brackets often grabbed by text expansion
        url = url:gsub("[\"']+$", ""):gsub("^[\"']+", ""):gsub("[%s()]+$", "")

        -- 3. Execute background process targeting macOS native open binary
        if url and url ~= "" then
          vim.notify("Launching browser: " .. vim.fn.fnamemodify(url, ":t"), vim.log.levels.INFO)
          vim.fn.jobstart({ "open", url }, { detach = true })
        else
          vim.notify("No valid URL target found under cursor", vim.log.levels.WARN)
        end
      end,
      mode = { "n", "v" },
      desc = "Open link under cursor in macOS browser",
    },
  },
}
