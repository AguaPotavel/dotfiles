return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "svelte",
        "javascript",
        "typescript",
      },

      highlight = { enabled = true },
    },
  },

  {
    "ggandor/leap.nvim",
    enabled = true,
  },

  {
    "windwp/nvim-ts-autotag",
  },

  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function ()
     vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true }),
     vim.keymap.set('i', '<c-.>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true}),
     vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true}),
     vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true}),
    end
  }
}
