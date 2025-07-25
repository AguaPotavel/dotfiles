require("nvchad.mappings")

local map = vim.keymap.set

-- commons
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")

-- move lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move line Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move line Up" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- splits
--
-- windows
map("n", "<leader>w", "<c-w>", { desc = "Windows", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
map("n", "<space><space>", "<cmd>set nohlsearch<CR>")
map("v", "<space><space>", "<Esc>")

-- Quicker close split
map("n", "<leader>qq", ":q<CR>", { silent = true, noremap = true })

-- Codeium commands

-- stop autocomplete
map("n", "<leader>ad", "<cmd>Codeium Disable<cr>", { desc = "Codeium Disable" })
-- start autocomplete
map("n", "<leader>ae", "<cmd>Codeium Enable<cr>", { desc = "Codeium Enable" })

-- buffers
map("n", "<S-l>", function()
	require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-h>", function()
	require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })
