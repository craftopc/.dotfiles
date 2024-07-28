local map = vim.keymap.set

local opts = {noremap = true, silent = true}

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
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- Telescope
map('n', '<leader><leader>', ':Telescope fd theme=dropdown<CR>', opts)
map('n', '<leader>b', ':Telescope buffers theme=dropdown<CR>', opts)

-- conform (format)
map('n', '<leader>cf', ':Format<CR>', opts)
