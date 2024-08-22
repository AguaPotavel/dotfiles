-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = function (mode, keys, action, opts)
  vim.keymap.set(mode, keys, action, opts)
end

map("i", "jj", "<Esc>", { noremap = false})
map("i", "WW", "<Esc>:w!<enter>", { noremap = false})

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- files
map("n", "QQ", ":qa!<enter>", {noremap=false})
map("n", "WW", ":w!<enter>", {noremap=false})
map("n", "E", "$", {noremap=false})
map("n", "B", "^", {noremap=false})
map("n", "TT", ":TransparentToggle<CR>", {noremap=true})
map("n", "ss", ":noh<CR>", {noremap=true})

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })
--
-- splits
--
-- windows
map("n", "<leader>w", "<c-w>", { desc = "Windows", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
map('n', '<space><space>', "<cmd>set nohlsearch<CR>")
map('v', '<space><space>', "<Esc>")

-- Quicker close split
map("n", "<leader>qq", ":q<CR>",
  {silent = true, noremap = true}
)

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map("n", "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map("n", "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Noice
map("n", "<leader>nn", ":Noice dismiss<CR>", {noremap=true})

map("n", "<leader>He", "<cmd>GoIfErr<cr>",
  {silent = true, noremap = true}
)
