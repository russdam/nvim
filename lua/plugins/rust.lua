-- lua/plugins/rust.lua
return {
  -- {
  --   "cordx56/rustowl",
  --   version = "*", -- Latest stable version
  --   build = "cargo install rustowl && rustowl toolchain install",
  --   lazy = false, -- This plugin is already lazy
  --   -- Define the keybind here so LazyVim and WhichKey register it properly
  --   keys = {
  --     {
  --       "<leader>ro",
  --       function()
  --         -- Directly fetches the current active buffer ID
  --         local bufnr = vim.api.nvim_get_current_buf()
  --         require("rustowl").toggle(bufnr)
  --       end,
  --       desc = "Toggle RustOwl",
  --       ft = "rust", -- Only registers this keybind in Rust files
  --     },
  --   },
  --   opts = {
  --     auto_enable = true,
  --     highlight_style = {
  --       definitely_live = "underline",
  --       maybe_initialized = "underline",
  --     },
  --     --colors = {
  --     --  lifetime = "#00cc00",
  --     --},
  --     client = {
  --       root_dir = function()
  --         -- Using 0 means current buffer, or you can use vim.api.nvim_get_current_buf()
  --         return vim.fs.root(0, { "Cargo.toml" })
  --       end,
  --       -- Removed on_attach keymap to avoid duplicate definitions
  --     },
  --   },
  -- },
  -- Rich Markdown Rendering for Floats & Buffers
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      -- Ensure floating LSP windows inherit tree-sitter markdown rendering
      win_options = {
        conceallevel = { default = 2, rendered = 2 },
      },
      file_types = { "markdown", "rust" },
    },
    ft = { "markdown", "rust" },
  },
  -- Rustaceanvim
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = { "rust" },
    opts = {
      -- 1. Configure popup floats and hover action borders
      tools = {
        float_wins = {
          auto_focus = false,
        },
        hover_actions = {
          border = "rounded",
          max_width = 80,
          max_height = 20,
          auto_focus = true,
        },
      },
      server = {
        -- 2. Bind 'K' on LSP attach to trigger hover docs/actions
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>cR", function()
            vim.cmd.RustLsp("codeAction")
          end, { buffer = bufnr, desc = "Code Action" })
          vim.keymap.set("n", "<leader>dr", function()
            vim.cmd.RustLsp("debuggables")
          end, { buffer = bufnr, desc = "Rust Debuggables" })
          vim.keymap.set("n", "K", function()
            vim.cmd.RustLsp({ "hover", "actions" })
          end, { buffer = bufnr, desc = "Rust Hover Actions / Documentation" })
        end,
        default_settings = {
          ["rust-analyzer"] = {
            -- 3. Explicitly enable hover documentation and links
            hover = {
              documentation = { enable = true },
              links = { enable = true },
            },
            -- Run Clippy instead of standard cargo check on save.
            checkOnSave = true,
            check = {
              command = "clippy",
              allTargets = true,
              extraArgs = { "--no-deps" },
            },
            -- Configure rust-analyzer inlay hints
            inlayHints = {
              bindingModeHints = { enable = true },
              chainingHints = { enable = true },
              closingBraceHints = { enable = true, minLines = 25 },
              closureReturnTypeHints = { enable = "always" },
              lifetimeElisionHints = { enable = "skip_trivial" },
              typeHints = { enable = true },
            },
            -- Enable procedural macro expansion and build script evaluation
            procMacro = {
              enable = true,
              attributes = { enable = true },
            },
            cargo = {
              buildScripts = { enable = true },
              allFeatures = true,
              loadOutDirsFromCheck = true,
            },
          },
        },
      },
    },
  },
}
