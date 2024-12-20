-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local plugins = {
  {
    'cpwrs/americano.nvim',
    opts = {},
    dependencies = {}
  },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  }, 
  { 'echasnovski/mini.nvim', version = false },
  {
      "folke/flash.nvim",
      event = "VeryLazy",
      ---@type Flash.Config
      opts = {},
      -- stylua: ignore
      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      },
    },

    {
        'nvim-telescope/telescope.nvim', version = '0.1.8',
        dependencies = { {'nvim-lua/plenary.nvim'} },
        
    },
    {
        'neoclide/coc.nvim',
        branch = 'release'
    },
    'ellisonleao/gruvbox.nvim',
    'lervag/wiki.vim',
    {   
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    {
        'ThePrimeagen/harpoon',
        branch = "harpoon2",
        dependencies = { {"nvim-lua/plenary.nvim"} }
    },
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
    "williamboman/mason.nvim",
    'williamboman/mason-lspconfig.nvim',
    'fatih/vim-go',
    {
        'numToStr/Comment.nvim', opts = {}
    },
    {
        'folke/noice.nvim',
        --[[ config = function()
        -- add any options here
      end, ]]
        dependencies = {
            'MunifTanjim/nui.nvim',
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to  the notification view.
            --   If not available, we  `mini` as the fallback
            -- 'rcarriga/nvim-notify',
        }
    }
}

local opts = {}

require("lazy").setup(plugins, opts)
