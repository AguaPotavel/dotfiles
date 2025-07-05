---@type NvPluginSpec
-- NOTE: Vim motion trainer
return {
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  keys = {
    { "<leader>ht", "<cmd>Hardtime toggle<cr>", desc = "Hardtime | Toggle" },
    { "<leader>hr", "<cmd>Hardtime report<cr>", desc = "Hardtime | Report" },
  },
  opts = {
    -- Default configuration
    max_time = 1000,
    max_count = 2,
    disable_mouse = true,
    hint = true,
    notification = true,
    allow_different_key = false,
    enabled = false,
  },
}

