vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.python3_host_prog = '/home/seriy/.pyenv/shims/python3'

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'loctvl842/monokai-pro.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme monokai-pro')
    end,
    opts = {
      filter = 'machine',
    },
    enabled = false,
  },
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme duskfox')
    end,
    -- enabled = false,
  },
  {
    'svrana/neosolarized.nvim',
    priority = 1000,
    dependencies = {
      'tjdevries/colorbuddy.nvim',
    },
    config = function()
      local n = require('neosolarized')
      local cb = require('colorbuddy.init')

      n.setup({
        comment_italics = true,
        background_set = true,
      })

      local Color = cb.Color
      local colors = cb.colors
      local Group = cb.Group
      local groups = cb.groups
      local styles = cb.styles
      local cError = groups.Error.fg
      local cInfo = groups.Information.fg
      local cWarn = groups.Warning.fg
      local cHint = groups.Hint.fg

      Color.new('white', '#ffffff')
      Color.new('black', '#000000')

      Group.new('CursorLineNr', colors.yellow, colors.black, styles.NONE, colors.base1)

      Group.new('DiagnosticVirtualTextError', cError, cError:dark():dark():dark():dark(), styles.NONE)
      Group.new('DiagnosticVirtualTextInfo', cInfo, cInfo:dark():dark():dark(), styles.NONE)
      Group.new('DiagnosticVirtualTextWarn', cWarn, cWarn:dark():dark():dark(), styles.NONE)
      Group.new('DiagnosticVirtualTextHint', cHint, cHint:dark():dark():dark(), styles.NONE)
      Group.new('DiagnosticUnderlineError', colors.none, colors.none, styles.undercurl, cError)
      Group.new('DiagnosticUnderlineWarn', colors.none, colors.none, styles.undercurl, cWarn)
      Group.new('DiagnosticUnderlineInfo', colors.none, colors.none, styles.undercurl, cInfo)
      Group.new('DiagnosticUnderlineHint', colors.none, colors.none, styles.undercurl, cHint)

      Group.new('HoverBorder', colors.yellow, colors.none, styles.NONE)
    end,
    enabled = false,
  },

  -- DEFAULT
  --
  --

  {
    'eandrju/cellular-automaton.nvim',
    cmd = { 'CellularAutomaton' },
  },
  {
    'glepnir/flybuf.nvim',
    cmd = 'FlyBuf',
    config = function()
      require('flybuf').setup({})
    end,
  },
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  -- TODO: relocate InsertEnter events into cmp?
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    opts = {},
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },
  { 'echasnovski/mini.move', opts = {}, version = false },
  { 'numToStr/Comment.nvim', opts = {} },
  { 'max397574/better-escape.nvim', opts = {}, event = 'InsertEnter' },
  {
    'mcauley-penney/tidy.nvim',
    opts = {
      filetype_exclude = { 'markdown', 'diff' },
    },
  },
  {
    'mbbill/undotree',
    -- cmd = { 'UndotreeToggle' },
    keys = {
      { '<leader>uu', '<cmd>UndotreeToggle<cr>', desc = 'Undo tree' },
    },
    init = function()
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },
  {
    'ggandor/leap.nvim',
    keys = {
      { 's', mode = { 'n', 'x', 'o' }, desc = 'Leap forward to' },
      { 'S', mode = { 'n', 'x', 'o' }, desc = 'Leap backward to' },
      { 'gs', mode = { 'n', 'x', 'o' }, desc = 'Leap from windows' },
    },
    config = function(_, opts)
      local leap = require('leap')
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ 'x', 'o' }, 'x')
      vim.keymap.del({ 'x', 'o' }, 'X')
    end,
  },
  {
    'ggandor/flit.nvim',
    keys = function()
      local ret = {}
      for _, key in ipairs({ 'f', 'F', 't', 'T' }) do
        ret[#ret + 1] = { key, mode = { 'n', 'x', 'o' }, desc = key }
      end
      return ret
    end,
    opts = { labeled_modes = 'nx' },
  },
  {
    'iamcco/markdown-preview.nvim',
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    ft = { 'markdown', 'vimwiki' },
    cmd = { 'MarkdownPreview', 'MarkdownPreviewToggle' },
  },
  {
    'norcalli/nvim-colorizer.lua',
    event = 'VeryLazy',
    opts = {},
  },

  -- TODO: event for git, gitsigns
  {
    'dinhhuy258/git.nvim',
    opts = {},
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {},
  },

  {
    'ThePrimeagen/harpoon',
    keys = {
      {
        '<leader>a',
        function()
          require('harpoon.mark').add_file()
        end,
        mode = 'n',
        desc = '',
      },
      {
        '<C-e>',
        function()
          require('harpoon.ui').toggle_quick_menu()
        end,
        mode = 'n',
        desc = '',
      },
      {
        '<C-h>',
        function()
          require('harpoon.ui').nav_file(1)
        end,
        mode = 'n',
        desc = '',
      },
      {
        '<C-t>',
        function()
          require('harpoon.ui').nav_file(2)
        end,
        mode = 'n',
        desc = '',
      },
      {
        '<C-n>',
        function()
          require('harpoon.ui').nav_file(3)
        end,
        mode = 'n',
        desc = '',
      },
      {
        '<C-s>',
        function()
          require('harpoon.ui').nav_file(4)
        end,
        mode = 'n',
        desc = '',
      },
      {
        '<Tab>',
        function()
          require('harpoon.ui').nav_next()
        end,
        mode = 'n',
        desc = '',
      },
      {
        '<S-Tab>',
        function()
          require('harpoon.ui').nav_prev()
        end,
        mode = 'n',
        desc = '',
      },
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
    },
    config = function()
      require('telescope').setup({})
      require('telescope').load_extension('fzf')
    end,
    keys = {
      {
        '<leader>tf',
        function()
          require('telescope.builtin').find_files()
        end,
        mode = 'n',
        desc = '',
      },
      {
        '<leader>tg',
        function()
          require('telescope.builtin').grep_string({ search = vim.fn.input('Grep > ') })
        end,
        mode = 'n',
        desc = '',
      },
      {
        '<leader>tgf',
        function()
          require('telescope.builtin').git_files()
        end,
        mode = 'n',
        desc = '',
      },
      {
        '<leader>tt',
        function()
          require('telescope.builtin').buffers()
        end,
        mode = 'n',
        desc = '',
      },
    },
  },

  -- LSP
  --
  --
  -- TODO: Remove lsp-zero
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    lazy = true,
    config = function()
      require('lsp-zero.settings').preset({})
    end,
  },
  {
    'glepnir/lspsaga.nvim',
    event = 'LspAttach',
    config = function()
      require('lspsaga').setup({
        lightbulb = {
          enable = true,
        },
      })
      vim.keymap.set('n', 'gp', '<cmd>Lspsaga peek_definition<CR>')
      vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<CR>')
      vim.keymap.set('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>')

      vim.keymap.set('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
      vim.keymap.set('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>')

      vim.keymap.set({ 'n', 'v' }, '<leader>ca', '<cmd>Lspsaga code_action<CR>')

      vim.keymap.set('n', 'gl', '<cmd>Lspsaga show_line_diagnostics<CR>')
      vim.keymap.set('n', '<leader>sw', '<cmd>Lspsaga show_workspace_diagnostics<CR>')

      vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')

      vim.keymap.set({ 'n', 't' }, '<A-d>', '<cmd>Lspsaga term_toggle<CR>')

      vim.keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<CR>')

      vim.keymap.set('n', 'gr', '<cmd>Lspsaga rename ++project<CR>')
    end,
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
      { 'nvim-treesitter/nvim-treesitter' },
    },
  },
  {
    'neovim/nvim-lspconfig',
    cmd = 'LspInfo',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      {
        'williamboman/mason.nvim',
        build = ':MasonUpdate',
      },
      { 'hrsh7th/cmp-nvim-lsp' },

      { 'williamboman/mason-lspconfig.nvim' },
      -- { 'j-hui/fidget.nvim', tag = 'legacy' },
      -- NOTE: Maybe remove neodev?
      { 'folke/neodev.nvim' },
      { 'ray-x/lsp_signature.nvim' },
    },
    config = function()
      local lsp = require('lsp-zero')
      -- client first arg in 'on_attach' method
      lsp.on_attach(function(_, bufnr)
        require('lsp_signature').on_attach({
          bind = true,
          floating_window = false,
          transparency = 88,
          hint_enable = false,
          handler_opts = {
            border = 'single', -- double, rounded, single, shadow, none, or a table of borders
          },
          toggle_key = '<M-x>',
        }, bufnr)

        lsp.default_keymaps({
          buffer = bufnr,
          omit = { 'F2', 'F3', 'F4', 'K', 'gl', 'gd', 'gD', 'gi', 'go', 'gr', 'gs' },
        })

        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end

          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        nmap('<space>f', function()
          vim.lsp.buf.format({ async = true })
        end, 'Format')
        -- nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        -- nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        -- vim.keymap.set("i", "<M-x>", function() vim.lsp.buf.signature_help() end, { noremap=true, silent=true } )
        -- vim.keymap.set('i', '<M-x>', vim.lsp.buf.signature_help, { noremap = true, silent = true })
        -- nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
        nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
        nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
        nmap('<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, '[W]orkspace [L]ist Folders')
      end)

      lsp.ensure_installed({
        'pyright',
        'lua_ls',
        'tsserver',
        'yamlls',
        'docker_compose_language_service',
        'dockerls',
        'bashls',
        'jsonls',
        'sqlls',
        'taplo',
      })

      require('lspconfig').lua_ls.setup({
        settings = {
          Lua = {
            format = {
              enable = false,
            },
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      })

      require('lspconfig').pyright.setup({
        capabilities = (function()
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
          return capabilities
        end)(),
      })

      lsp.setup()
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'lukas-reineke/cmp-under-comparator',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
      'onsails/lspkind-nvim',
    },
    config = function()
      require('lsp-zero.cmp').extend()

      local cmp = require('cmp')
      local cmp_action = require('lsp-zero').cmp_action()
      local luasnip = require('luasnip')
      local lspkind = require('lspkind')

      require('luasnip.loaders.from_vscode').lazy_load()
      cmp.setup({
        formatting = {
          --   format = function(_, vim_item)
          --     vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
          --     return vim_item
          --   end,
          format = lspkind.cmp_format({
            mode = 'symbol_text',
            menu = {
              buffer = '[Buffer]',
              nvim_lsp = '[LSP]',
              luasnip = '[LuaSnip]',
              nvim_lua = '[Lua]',
              latex_symbols = '[Latex]',
            },
          }),
          experimental = {
            ghost_text = {
              hl_group = 'LspCodeLens',
            },
          },
          view = {
            entries = { name = 'custom', selection_order = 'top_down' },
          },
        },

        preselect = 'item',
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },
        sorting = {
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require('cmp-under-comparator').under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        sources = {
          { name = 'path' },
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'luasnip' },
          -- {name = 'buffer', keyword_length = 3},
          -- {name = 'luasnip', keyword_length = 2},
        },
        mapping = {
          -- ['<Tab>'] = cmp_action.luasnip_supertab(),
          -- ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
          ['<Tab>'] = cmp_action.tab_complete(),
          ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),

          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
      })
      local autopairs = require('nvim-autopairs')
      autopairs.setup({
        disable_filetype = { 'TelescopePrompt', 'vim' },
      })

      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {
      'mason.nvim',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local nls = require('null-ls')
      -- local util = require("null-ls.utils")
      -- local help = require("null-ls.helpers")

      local diagnostic = nls.builtins.diagnostics
      local formatting = nls.builtins.formatting
      -- local completions = nls.builtins.completion

      local sources = {
        formatting.prettierd,
        formatting.prettier.with({
          filetypes = { 'html', 'json', 'yaml', 'markdown', 'javascript', 'typescript' },
        }),
        formatting.stylua.with({
          extra_args = {
            '--indent-type',
            'Spaces',
            '--indent-width',
            '2',
            '--quote-style',
            'ForceSingle',
          },
        }),
        formatting.black,
        formatting.isort,
        formatting.ruff,
        diagnostic.ruff.with({
          diagnostics_postprocess = function(diagnostic_)
            diagnostic_.severity = vim.diagnostic.severity.INFO
          end,
        }),
        -- formatting.shfmt.with({
        --   extra_args = { "-ci", "-i", "2", "-s" },
        -- }),
        -- diagnostic.eslit_d,
        -- completions.luasnip,
      }

      nls.setup({
        sources = sources,
      })
    end,
  },

  -- UI
  --
  --

  {
    'nvim-lualine/lualine.nvim',
    opts = {
      sections = {
        lualine_c = {
          {
            'filename',
            file_status = true,
            path = 1,
          },
        },
      },
    },
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
    keys = {
      { '<leader>xx', '<cmd>TroubleToggle<cr>', mode = 'n', silent = true, noremap = true },
    },
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      cmdline = {
        view = 'cmdline',
        search_down = {
          view = 'cmdline',
        },
        search_up = {
          view = 'cmdline',
        },
      },
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
        },
        signature = {
          enabled = false,
        },
      },
      messages = {
        enabled = false,
      }
      -- presets = {
      --   bottom_search = true,
      --   command_paletter = true,
      --   long_message_to_split = true,
      --   inc_raname = false,
      --   lsp_doc_border = false,
      -- },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- 'rcarriga/nvim-notify',
    },
    keys = {
      {
        '<S-Enter>',
        function()
          require('noice').redirect(vim.fn.getcmdline())
        end,
        mode = 'c',
        desc = 'Redirect Cmdline',
      },
      {
        '<leader>snl',
        function()
          require('noice').cmd('last')
        end,
        desc = 'Noice Last Message',
      },
      {
        '<leader>snh',
        function()
          require('noice').cmd('history')
        end,
        desc = 'Noice History',
      },
      {
        '<leader>sna',
        function()
          require('noice').cmd('all')
        end,
        desc = 'Noice All',
      },
      {
        '<c-f>',
        function()
          if not require('noice.lsp').scroll(4) then
            return '<c-f>'
          end
        end,
        silent = true,
        expr = true,
        desc = 'Scroll forward',
        mode = { 'i', 'n', 's' },
      },
      {
        '<c-b>',
        function()
          if not require('noice.lsp').scroll(-4) then
            return '<c-b>'
          end
        end,
        silent = true,
        expr = true,
        desc = 'Scroll backward',
        mode = { 'i', 'n', 's' },
      },
    },
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      char = '┊',
      filetype_exclude = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy' },
      show_first_indent_level = false,
      show_trailing_blankline_indent = false,
      -- show_current_context = true,
      -- show_current_context_start = false,
      -- space_char_blankline = " ",
    },
    -- enabled = false,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    version = false, -- last release is way too old and doesn't work on Windows
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
        'JoosepAlviste/nvim-ts-context-commentstring',
      },
    },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        'bash',
        'c',
        'html',
        'javascript',
        'json',
        'lua',
        'luadoc',
        'luap',
        'markdown',
        'markdown_inline',
        'python',
        'query',
        'regex',
        'tsx',
        'typescript',
        'vim',
        'yaml',
      },
      autotag = {
        enable = true,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
})

require('options')
require('keymaps')

vim.cmd([[
  augroup Yank
  autocmd!
  autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
  augroup END
]])
