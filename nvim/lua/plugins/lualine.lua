return {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                always_show_tabline = true,
                globalstatus = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                    refresh_time = 16, -- ~60fps
                    events = {
                        'WinEnter',
                        'BufEnter',
                        'BufWritePost',
                        'SessionLoadPost',
                        'FileChangedShellPost',
                        'VimResized',
                        'Filetype',
                        'CursorMoved',
                        'CursorMovedI',
                        'ModeChanged',
                    },
                }
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff',
                    {
                        'diagnostics',
                        sources = { "nvim_diagnostic" },
                        sections = { "error", "warn" },
                        colored = true,
                    }
                    , 'filetype' },
                lualine_c = {
                    {
                        'filename',
                        -- Show relative path and modified status
                        path = 1, -- 0 = filename, 1 = relative path, 2 = absolute path
                        symbols = {
                            modified = '●', -- Text to show when the buffer is modified
                            readonly = '', -- Text to show when the buffer is readonly
                            unnamed = '[No Name]', -- Text to show for unnamed buffers
                        },
                    },
                },
                -- Right side: LSP status, file info, position
                lualine_x = {
                    {
                        -- Show attached LSP servers
                        function()
                            local clients = vim.lsp.get_clients { bufnr = 0 }
                            if #clients == 0 then
                                return ''
                            end

                            local names = {}
                            for _, client in ipairs(clients) do
                                table.insert(names, client.name)
                            end
                            return ' ' .. table.concat(names, ', ')
                        end,
                        color = { gui = 'italic' },
                    },
                    'encoding',
                    'fileformat',
                    'filetype',
                },
                lualine_y = { 'progress' },
                lualine_z = {
                    {
                        'location',
                        -- Show line:column
                        fmt = function(str)
                            return str:gsub('%%l:%%c', '%l:%c')
                        end,
                    },
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end
}
