return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    dependencies = {
        { "nvim-treesitter/nvim-treesitter-context", opts = { enable = true, mode = "topline" } }
    },
    event = { "BufReadPre", "BufNewFile" }, -- Load when opening files
    config = function()
        require "nvim-treesitter.install".compilers = { "clang" }
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                -- Core for neovim config
                "lua",
                "luadoc",
                "vim",
                "vimdoc",
                "query",

                -- "bash",

                -- Web dev
                "html",
                "css",
                "javascript",
                "typescript",
                "tsx",

                --
                "json",

                -- Systems
                "c",
                "cpp",
                "rust",
                "c_sharp",
                "fsharp",
                "ocaml",
                "nix",


                -- Markup and data
                "yaml",
                "markdown",
                "markdown_inline",
                "toml",


                -- Git and diffs
                -- Documentation
                "comment",
            },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            sync_install = false,
        }
    end
}
