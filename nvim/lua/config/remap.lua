-- Leader must be set before loading lazy
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pf", vim.cmd.Ex)

-- move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- remap the mode escape
vim.keymap.set("i", "<C-c>", "<Esc>")

-- remap source command
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
