return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'folke/lazydev.nvim',
    },
    config = function()
      require("lazydev").setup()
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "rust_analyzer", "prettier", "csharpier", "netcoredbg", "fantomas" },

        handlers = {
          function(server_name)

            if server_name == "omnisharp" then return end

            require("lspconfig")[server_name].setup({})
          end,

          ["lua_ls"] = function()
            require("lspconfig").lua_ls.setup({
              settings = {
                Lua = {
                  diagnostics = { globals = { "vim" } },
                  telemetry = { enable = false },
                },
              },
            })
          end,
        },
      })
    end
  },

   -- 2. Solution Management (The "Project Explorer")
  {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
      require("easy-dotnet").setup()
    end,
  },

  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
        require("roslyn").setup({
          args = {
            "--logLevel=Information",
            "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
          },
          config = {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
          },
      })
    end,
  },

  {
    "mfussenegger/nvim-dap",
    -- optional = true,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "NicholasMata/nvim-dap-cs", -- Helper for c# debbuging
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("dap-cs").setup()
      require("dapui").setup()
    end
  }
}
