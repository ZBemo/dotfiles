-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"

lvim.leader = "space"
vim.cmd('let maplocalleader=","') 
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode["t"] = "\"_d"
-- lvim.keys.normal_mode["T"] = "\"_dd"
lvim.keys.normal_mode["tt"] = "\"_dd"
lvim.keys.visual_mode["t"] = "\"_x"

lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

lvim.builtin.treesitter.ensure_installed = { "rust", "clojure", "lua" } -- change back to "mantained" if things stop working
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.line_wrap_cursor_movement = false

lvim.plugins = {
  {
    "Olical/conjure",
    tag = "v4.23.0",
    requires = {
      -- "tpope/vim-dispatch",
      "radenling/vim-dispatch-neovim",
      "clojure-vim/vim-jack-in"
    }
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
        hide_cursor = false,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,        -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,              -- Function to run after the scrolling animation ends
      })
    end
  },
  {
    "metakirby5/codi.vim",
    cmd = "Codi",
  },

}

-- disable things that increase latency when connnected over ssh
-- if not vim.env["SSH_CLIENT"] or vim.env["SSH_CLIENT"] == false or #vim.env["SSH_CLIENT"] == 0 then
--   vim.opt.relativenumber = true
--   vim.g.smoothie_enabled = true
-- else
--   vim.g.smoothie_enabled = false
--   vim.opt.relativenumber = false
-- end

lvim.lang.rust.formatters = { { exe = "rustfmt" } }

vim.opt.history = 500
vim.opt.wildmode = { "list", "longest" }
vim.opt.cmdheight = 1
vim.opt.swapfile = true
vim.opt.relativenumber = true
vim.opt.scrolloff  = 15
