vim.cmd("colorscheme catppuccin")

-- auto update for treesitter
-- TODO: noice verylazy load that screen flash.should be perf.
-- vim.cmd(
--    "TSUpdate lua c python java markdown markdown_inline vimdoc query diff bash fish html javascript json regex toml yaml ini asm vim"
-- )

-- Define a command to run async formatting
vim.api.nvim_create_user_command("Format", function(args)
    local range = nil
    if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_line(0, args.line2 - 1, args.line2, true)[1]
        range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
        }
    end
    require("conform").format({
        async = true,
        lsp_format = "fallback",
        range = range,
    })
end, { range = true })

-- dap
local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end
