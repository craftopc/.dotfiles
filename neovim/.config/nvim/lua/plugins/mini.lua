return {
    "echasnovski/mini.nvim",
    version = false,

    config = function ()
        require('mini.ai').setup()
        require("mini.pairs").setup()
        require("mini.diff").setup()
        require("mini.files").setup()
        require("mini.cursorword").setup()
        require("mini.icons").setup()
        -- require("mini.surround").setup()
    end
}
