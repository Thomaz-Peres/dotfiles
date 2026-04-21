return {
    "goolord/alpha-nvim",
    -- dependencies = { 'nvim-mini/mini.icons' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.header.val = {
            "███╗   ██╗██╗   ██╗██╗███╗   ███╗",
            "████╗  ██║██║   ██║██║████╗ ████║",
            "██╔██╗ ██║██║   ██║██║██╔████╔██║",
            "██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
            "██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
            "╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
        }
        dashboard.section.buttons.val = {
            dashboard.button("e", "  > New file", ":lua require('core.utils.utils').create_new_file()<CR>"),
            dashboard.button("f", "  > Find file in git repo", ":Telescope git_files <CR>"),
            dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
            dashboard.button("l", "🗘  > Open last session", ":SessionManager load_last_session<CR>"),
            dashboard.button("o", "  > Open session", ":SessionManager load_session<CR>"),
            dashboard.button("p", "  > Open project", ":Telescope projects<CR>"),
        }
        local fortune = require("alpha.fortune")
        dashboard.section.footer.val = fortune()

        require("alpha").setup( dashboard.opts )
    end,
}
