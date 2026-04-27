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

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(ev)
                    local map = function(keys, fn, desc)
                        vim.keymap.set("n", keys, fn, { buffer = ev.buf, desc = desc })
                    end
                    map("gd", vim.lsp.buf.definition, "Go to Definition")
                    map("gD", vim.lsp.buf.declaration, "Go to Declaration")
                    map("gr", vim.lsp.buf.references, "Go to References")
                    map("gi", vim.lsp.buf.implementation, "Go to Implementation")
                    map("K", vim.lsp.buf.hover, "Hover Documentation")
                    map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
                    map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
                    map("]d", vim.diagnostic.goto_next, "Next Diagnostic")
                    map("[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
                end,
            })

      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "rust_analyzer" },

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
    },

    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim", -- show diagnostics using virtual lines
        config = function()
            local lsp_lines = require("lsp_lines")

            lsp_lines.setup()

            vim.keymap.set("n", "g?", function()
                local lines_enabled = not vim.diagnostic.config().virtual_lines
                vim.diagnostic.config(
                    {
                        virtual_lines = lines_enabled,
                        virtual_text = not lines_enabled
                    }
                )
            end, { noremap = true, silent = true, desc = "Change diagnostics style" })

            vim.diagnostic.config({
                virtual_text = true,
                virtual_lines = false
            })
        end
    },
}
