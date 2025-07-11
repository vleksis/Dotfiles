-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set("v", "d", '"_d', opts)
vim.keymap.set("n", "dd", '"_dd', opts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Toggle line wrapping
vim.keymap.set("n", "<leader>uw", "<cmd>set wrap!<CR>", { desc = "Toggle Line Wrapping" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- -- Format entire file in normal mode
-- vim.keymap.set('n', '<leader>f', ':lua vim.lsp.buf.format()<CR>',
--   { noremap = true, silent = true, desc = "Format the whole file" })
--
-- -- Format selected block in visual mode
-- vim.keymap.set('v', '<leader>f', "gq", { noremap = true, silent = true, desc = "Format selected" })

-- FIX: DAP is not intalled yet
-- Refactor that to DAP file
vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
vim.keymap.set("n", "<leader>dc", "<cmd> DapContinue <CR>", { desc = "Run or continue debug" })
vim.keymap.set("n", "<leader>de", "<cmd> DapDisconnect", { desc = "Stop debug" })
vim.keymap.set("n", "<F10>", "<cmd> DapStepOver <CR>")
vim.keymap.set("n", "<F11>", "<cmd> DapStepInto <CR>")
vim.keymap.set("n", "<F12>", "<cmd> DapStepOut <CR>")
