local map = vim.keymap.set

local opts = {noremap = true, silent = true}

local currentPath = vim.fn.getcwd()
local fileName = vim.fn.expand('%:t')

local fileType = vim.filetype.match({
    filename = '' .. currentPath .. '/' .. fileName
})
-- code run
-- BUG: change workdir to current
if fileType == 'c' then
    map('n', '<F5>',
        ':!gcc ' .. currentPath .. '/' .. fileName .. ' -g -o ' .. currentPath ..
            '/' .. fileName:gsub(".c", '') .. '<CR>', opts)
    map('n', '<F6>',
        ":TermExec cmd=" .. "'" .. currentPath .. '/' .. fileName:gsub(".c", "") ..
            "'<CR>", opts)
elseif fileType == 'python' then
    map('n', '<F5>',
        ":TermExec cmd=" .. "'" .. "python " .. currentPath .. '/' .. fileName ..
            "'" .. ' dir=' .. "'" .. currentPath .. "'<CR>", opts)
end

-----------------
-- Normal mode --
-----------------

-- windows navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- quit
map('n', '<leader>qq', ':qall<CR>', opts)

-- adjust windows size
map('n', '<C-Up>', ':resize -2<CR>', opts)
map('n', '<C-Down>', ':resize +2<CR>', opts)
map('n', '<C-Left>', ':vertical resize -2<CR>', opts)
map('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-----------------
-- Visual mode --
-----------------

-- move line
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-----------------
--   Plugins   --
-----------------

-- tree
map('n', '<leader>e', ':Neotree toggle<CR>', opts)
map('n', '<leader>E', ':Neotree toggle document_symbols<CR>', opts)

-- Telescope
map('n', '<leader><leader>', ':Telescope fd theme=dropdown<CR>', opts)
map('n', '<leader>b', ':Telescope buffers theme=dropdown<CR>', opts)
map('n', '<leader>uc', ':Telescope colorscheme<CR>', opts)
map('n', '<leader>cc',
    ':lua require("telescope.builtin").find_files({cwd="~/.dotfiles/neovim/.config/nvim"})<CR>',
    opts)

-- conform (format)
map('n', '<leader>cf', ':Format<CR>', opts)

-- dap
map("n", '<leader>ds', ':DapNew<CR>', opts)
map("n", '<leader>db', ':DapToggleBreakpoint<CR>', opts)
map("n", '<leader>di', ':DapStepInto<CR>', opts)
map('n', '<leader>do', ':DapStepOver<CR>', opts)
map('n', '<leader>dt', ':DapStepOut<CR>', opts)

-- todo
map('n', '<leader>td', ':TodoLocList<CR>', opts)

-- format
map('n', '<leader>cb',
    ':!~/.local/share/nvim/mason/bin/clang-format -style=google -dump-config > ' ..
        currentPath .. '/.clang-format<CR>')

-- toggleTerm
-- HACK: trouble: ture map: <C-/> but when input <C-/> cound change <C-_>
map('n', '<C-_>', ':ToggleTerm direction=float dir=' .. currentPath .. "<CR>", opts)
