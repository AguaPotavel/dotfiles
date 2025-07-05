-- Detecção de filetype para Move
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.move",
  callback = function()
    vim.bo.filetype = "move"
  end,
})