return {
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        dependencies = {{'nvim-tree/nvim-web-devicons'}},
        opts = function()
            local logo = [[
         ██████╗██████╗  █████╗ ███████╗████████╗ ██████╗ ██████╗  ██████╗
        ██╔════╝██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗██╔════╝
        ██║     ██████╔╝███████║█████╗     ██║   ██║   ██║██████╔╝██║     
        ██║     ██╔══██╗██╔══██║██╔══╝     ██║   ██║   ██║██╔═══╝ ██║     
        ╚██████╗██║  ██║██║  ██║██║        ██║   ╚██████╔╝██║     ╚██████╗
         ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝        ╚═╝    ╚═════╝ ╚═╝      ╚═════╝
            ]]
            logo = string.rep("\n", 4) .. logo .. "\n\n"

            return {
                theme = "doom",
                config = {
                    header = vim.split(logo, "\n"),
                    center = {
                        {
                            desc = 'Find Files',
                            action = 'lua vim.cmd("Telescope fd")',
                            icon = ' ',
                            key = 'f'
                        }, {
                            desc = 'Config',
                            action = 'lua require("telescope.builtin").find_files({cwd="~/.dotfiles/neovim/.config/nvim"})',
                            icon = ' ',
                            key = 'c'
                        }, {
                            desc = 'Recent Files',
                            action = 'lua vim.cmd("Telescope oldfiles")',
                            icon = ' ',
                            key = 'r'
                        }, {
                            desc = 'Lazy Manager',
                            action = 'lua vim.cmd("Lazy")',
                            icon = '󰒲 ',
                            key = 'l'
                        },
                        {
                            desc = 'Quit',
                            action = 'lua vim.cmd("q")',
                            icon = ' ',
                            key = 'q'
                        }
                    }
                },
                footer = {}
            }
        end
    }
}
