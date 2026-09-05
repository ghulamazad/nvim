-- lua/core/keymaps.lua

-- Space as leader: unused by default Vim, thumb-reachable on any QWERTY
-- layout regardless of keyboard variant — this is exactly why we're
-- NOT copying ThePrimeagen's config, which leans on his specific
-- Colemak-DH-adjacent remaps that assume a different home row.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- Clear search highlight without losing search history
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Keep cursor centered when jumping half-pages or searching
keymap("n", "<C-d>", "<C-d>zz", { desc = "Half-page down, centered" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Half-page up, centered" })
keymap("n", "n", "nzzzv", { desc = "Next search result, centered" })
keymap("n", "N", "Nzzzv", { desc = "Prev search result, centered" })

-- Move selected lines up/down in visual mode (native-feeling, not a plugin)
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })



-- Direct window navigation — one key instead of two (<C-w> then h/j/k/l).
-- Chosen now specifically because vim-tmux-navigator (Stage 13) uses
-- this exact same convention to move between tmux panes — so once
-- tmux integration lands, these keys transparently extend beyond
-- Neovim's own splits into tmux panes too, with zero relearning.
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })