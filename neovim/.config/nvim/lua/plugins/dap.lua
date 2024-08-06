return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require('dap')

            -- ui
            vim.fn.sign_define('DapBreakpoint', {
                text = '🛑',
                texthl = '',
                linehl = '',
                numhl = ''
            })
            vim.fn.sign_define('DapStopped', {
                text = " ",
                texth1 = '',
                lineh1 = '',
                numhl = ''
            })

            dap.adapters.cppdbg = {
                id = 'cppdbg',
                type = 'executable',
                command = '/home/craftopc/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7'
            }

            dap.configurations.c = {
                {
                    name = "Launch file",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ',
                                            vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopAtEntry = true
                }
            }

            dap.configurations.cpp = dap.configurations.c
        end
    }, {
        "rcarriga/nvim-dap-ui",
        version = false,
        dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
        opts = {controls = {element = 'repl', enabled = 'true'}}
    }, {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {"williamboman/mason.nvim", "mfussenegger/nvim-dap"}
    }, {
        'theHamsta/nvim-dap-virtual-text',
        dependencies = {
            "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter"
        },
        opts = {}
    }

}
