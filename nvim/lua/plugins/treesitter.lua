return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-context", opts = { enable = true, mode = "topline" } }
    },
    config = function()
        require "nvim-treesitter.install".compilers = { "clang" }
        require("nvim-treesitter.configs").setup {
            ensure_installed = { "c", "cpp", "html", "lua", "tsx", "rust", "yaml", "typescript", "ocaml", "nix", "c_sharp", "markdown", "javascript", "fsharp" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            sync_install = true,
        }
    end
}
