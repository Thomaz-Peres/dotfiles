return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VimEnter",
    opts = { signs = false },
    keys = {
        { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo" },
        { "[t", function() require("todo-comments").jump_prev() end, desc = "Prev Todo" },
        { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
    },
}
