-- vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.softtabstop = -1
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.autoindent = true

-- local opt = vim.opt
--
-- opt.breakindent = true
-- opt.belloff = 'all'
-- vim.opt.autoindent = true
-- -- opt.clipboard = 'unnamedplus'
-- opt.confirm = true
-- opt.completeopt = 'menu,menuone,noselect'
-- opt.cursorline = true
-- opt.expandtab = true
-- opt.grepformat = '%f:%l:%c:%m'
-- opt.grepprg = 'rg --vimgrep'
-- opt.hidden = true
-- opt.ignorecase = true
-- opt.incsearch = true
-- opt.joinspaces = true
-- opt.list = true
-- opt.modelines = 5
-- opt.mouse = 'a'
-- opt.number = true
-- opt.relativenumber = true
-- opt.scrolloff = 3
-- opt.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize' }
-- opt.shiftround = true
-- opt.shiftwidth = 2
-- opt.showcmd = false
-- opt.showmode = false
-- opt.sidescrolloff = 8
-- opt.signcolumn = 'number'
-- opt.smartcase = true
-- opt.smarttab = true
-- opt.softtabstop = -1
-- opt.spellcapcheck = ''
-- opt.splitbelow = true
-- opt.splitright = true
-- opt.switchbuf = 'usetab'
-- opt.tabstop = 2
-- opt.termguicolors = true
-- opt.timeoutlen = 300
-- opt.title = false
-- opt.virtualedit = 'block'
-- opt.visualbell = false
-- opt.wildmenu = true
-- opt.undofile = true
-- opt.undolevels = 10000
--
-- opt.breakindentopt = {
--   shift = 2,
-- }
--
-- -- https://www.compart.com/en/unicode/U+XXXX (unicode character code)
-- -- stylua: ignore
-- opt.fillchars = {
--   fold      = '·',
--   horiz     = '━',
--   horizdown = '┳',
--   horizup   = '┻',
--   vert      = '┃',
--   vertleft  = '┫',
--   vertright = '┣',
--   verthoriz = '╋',
-- }
--
-- opt.formatoptions = opt.formatoptions
--   - 'a'
--   - 't'
--   + 'c'
--   + 'q'
--   + 'l'
--   + 'j'
--   + 'r'
--   - 'o'
--   + 'n'
--   - '2'
--
-- opt.listchars = opt.listchars
--   + 'nbsp:⦸'
--   + 'tab:▷┅'
--   + 'extends:»'
--   + 'precedes:«'
--   + 'trail:•'
--
-- opt.shortmess = opt.shortmess
--   + 'A'
--   + 'I'
--   + 'O'
--   + 'T'
--   + 'W'
--   + 'a'
--   + 'o'
--   + 't'
--   + 'c'
--
-- opt.whichwrap = opt.whichwrap
--   + 'b'
--   + 's'
--   + 'h'
--   + 'l'
--   + '<'
--   + '>'
--   + '['
--   + ']'
--
-- opt.wildmode = {
--   'longest',
--   'list',
--   'full',
-- }

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

-- vim.api.nvim_create_autocmd(
--   'BufReadPost',
--   { command = [[setlocal spell spelllang=en_us,ru]] }
-- )
