vim.opt.number = true
vim.opt.relativenumber = false

vim.opt.expandtab = true
vim.opt.softtabstop = -1
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

vim.opt.updatetime = 50
vim.opt.autoindent = true

vim.opt.list = true

vim.opt.colorcolumn = '88'
vim.opt.linebreak = true
vim.opt.showbreak = "↳ "

-- https://www.compart.com/en/unicode/U+XXXX (unicode character code)
-- stylua: ignore
vim.opt.fillchars = {
  fold      = '·',
  horiz     = '━',
  horizdown = '┳',
  horizup   = '┻',
  vert      = '┃',
  vertleft  = '┫',
  vertright = '┣',
  verthoriz = '╋',
}

vim.opt.formatoptions = vim.opt.formatoptions - 'a' - 't' + 'c' + 'q' - 'l' + 'j' + 'r' - 'o' + 'n' - '2'

vim.opt.listchars = vim.opt.listchars + 'nbsp:⦸' + 'tab:▷┅' + 'extends:»' + 'precedes:«' + 'trail:•'

vim.opt.shortmess = vim.opt.shortmess + 'A' + 'I' + 'O' + 'T' + 'W' + 'a' + 'o' + 't' + 'c'

vim.opt.whichwrap = vim.opt.whichwrap + 'b' + 's' + 'h' + 'l' + '<' + '>' + '[' + ']'

vim.opt.wildmode = {
  'longest',
  'list',
  'full',
}

vim.cmd([[
  augroup Yank
  autocmd!
  autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
  augroup END
]])

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- https://github.com/microsoft/terminal/issues/13420
vim.cmd(':au VimLeave * set guicursor= | call chansend(v:stderr, "\x1b[ q")')

vim.api.nvim_create_autocmd(
  'BufReadPost',
  { command = [[setlocal spell spelllang=en_us,ru]] }
)
