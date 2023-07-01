vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')

vim.keymap.set('n', ';', ':', { nowait = true })

vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-l>', '<Right>')
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-k>', '<Up>')

vim.keymap.set('n', 'ss', ':split<Return><C-w>w')
vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

vim.keymap.set("i", "<C-b>", "<ESC>^i")
vim.keymap.set("i", "<C-e>", "<end>")

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>')

vim.keymap.set("n", "x", '"_x')

-- vim.keymap.set("n", "<leader>Y", [["+Y]])
-- vim.keymap.set("x", "<leader>p", '"_DP')
