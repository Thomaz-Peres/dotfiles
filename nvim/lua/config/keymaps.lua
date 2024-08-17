vim.g.mapleader = ' ';
vim.g.maplocalleader = ' ';

vim.keymap.set('n', '<C-b>', ':Neotree filesystem reveal left<CR>', {});
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {});
