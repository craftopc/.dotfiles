return {
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        opts = {
            theme = 'doom',
            config = {
                header = {},
                center = {
                    {
                        icon = ' ',
                        icon_h1 = 'Recent files',
                        desc = 'Find File',
                        desc_h1 = 'String',
                        key = 'b',
                        keymap = 'SPC f f',
                        key_h1 = 'Number',
                        key_format = ' %s',
                        action = 'lua print(2)'
                    }
                }
            }
        },
        dependencies = {{'nvim-tree/nvim-web-devicons'}}
    }
}
