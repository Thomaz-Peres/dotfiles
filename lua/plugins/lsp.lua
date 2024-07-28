return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'folke/neodev.nvim',
  },
  config = function()
    require("mason").setup();
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "rust_analyzer" }
    });

    local lsp = require("lspconfig");
    lsp.lua_ls.setup({});
    lsp.rust_analyzer.setup({});
  end
}
