require "nvchad.options"

local o = vim.o

o.title = true
vim.o.guifont = "JetbrainsMono Nerd Font:h10"

vim.g.neovide_refresh_rate = 75

vim.g.neovide_cursor_vfx_mode = "railgun"

o.cursorlineopt = 'both' -- to enable cursorline!

o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

vim.api.nvim_create_autocmd("BufDelete", {
  callback = function()
    local bufs = vim.t.bufs
    if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
      vim.cmd "Nvdash"
    end
  end,
})
