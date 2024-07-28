return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs");
        config.setup({
            ensure_installed = { "lua", "tsx", "rust", "yaml", "typescript", "ocaml", "nix", "c_sharp", "markdown", "javascript" },
            sync_install = false,
            highlight = { enable = true},
            indent = { enable = true},
        })
    end
}
