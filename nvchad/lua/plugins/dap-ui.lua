return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  config = function()
    require("dapui").setup({
      layouts = {
        {
          elements = {
            { id = "scopes",      size = 0.35 },
            { id = "breakpoints", size = 0.15 },
            { id = "stacks",      size = 0.25 },
            { id = "watches",     size = 0.25 },
          },
          position = "left",
          size = 50,
        },
        {
          elements = {
            { id = "repl",    size = 0.5 },
            { id = "console", size = 0.5 },
          },
          position = "bottom",
          size = 15,
        },
      },
    })

    -- Autocmds para abrir/fechar automaticamente
    vim.api.nvim_create_autocmd("User", {
      pattern = "DapStopped",
      callback = function()
        vim.schedule(function()
          require("dapui").open({ reset = true })
        end)
      end,
    })
  end
}
