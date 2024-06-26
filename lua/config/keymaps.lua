local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Move selected line / block of text in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Fast saving
map("n", "<Leader>w", ":write!<CR>", opts)
map("n", "<Leader>q", ":q!<CR>", opts)

-- Remap for dealing with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- better indenting
map("v", "<LEFT>", "<gv")
map("v", "<RIGHT>", ">gv")

-- paste over currently selected text without yanking it
map("v", "p", '"_dP')
map("v", "P", '"_dp')

-- copy everything between { and } including the brackets
-- p puts text after the cursor,
-- P puts text before the cursor.
map("n", "YY", "va{Vy", opts)

-- Move line on the screen rather than by line in the file
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)

-- Exit on jj and jk
map("i", "jj", "<ESC>", opts)
map("i", "jk", "<ESC>", opts)

-- Move to start/end of line
map({ 'n', 'x', 'o' }, 'H', '^', opts)
map({ 'n', 'x', 'o' }, 'L', '$', opts)

-- Navigate buffers
map("n", "<A-.>", ":bnext<CR>", opts)
map("n", "<A-,>", ":bprevious<CR>", opts)
map("n", "<A-c>", ":bd<CR>", opts)

-- Panes resizing
map("n", "+", ":vertical resize +5<CR>")
map("n", "_", ":vertical resize -5<CR>")
map("n", "=", ":resize +5<CR>")
map("n", "-", ":resize -5<CR>")

-- Map enter to ciw in normal mode
map("n", "<BS>", 'ci', opts)

-- Map telescope
map("n", ";;", "<cmd>lua require('telescope.builtin').resume(require('telescope.themes').get_dropdown({}))<cr>", opts)
map("n", ";f", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
map("n", ";r", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
map("n", "//", "<cmd>Telescope buffers<cr>", opts)

-- Map ranger
map("n", "sf", "<cmd>RnvimrToggle<cr>", opts)

-- LSP
--map("n", "'f", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
map('n', '<C-j>', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
map('n', '<C-J>', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)

-- Window navigation
map("n", "sh", "<C-w>h", opts)
map("n", "sk", "<C-w>k", opts)
map("n", "sj", "<C-w>j", opts)
map("n", "sl", "<C-w>l", opts)
map("n", "ss", ":split<CR><C-w>w", opts)
map("n", "sv", ":vsplit<CR><C-w>w", opts)

vim.keymap.set('n', '<C-s>', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'Fuzzily search in current buffer' })

-- Split line with X
map('n', 'X', ':keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>', { silent = true })
