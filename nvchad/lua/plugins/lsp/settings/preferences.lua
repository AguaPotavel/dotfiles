-- Flag global
return {
local lsp_float_enabled = true

function ToggleLspFloatingWindows()
  lsp_float_enabled = not lsp_float_enabled
  vim.notify("LSP floating windows " .. (lsp_float_enabled and "enabled" or "disabled"))
end

vim.api.nvim_set_keymap('n', '<leader>lu', '<cmd>lua ToggleLspFloatingWindows()<CR>', { noremap = true, silent = true })

-- Handlers que normalmente exibem janelas
local blocked_handlers = {
  ["textDocument/hover"] = true,
  ["textDocument/signatureHelp"] = true,
  ["textDocument/publishDiagnostics"] = true,
}

-- Intercepta todos os handlers LSP
local orig_lsp_handler = vim.lsp.handlers

vim.lsp.handlers = setmetatable({}, {
  __index = function(_, key)
    local original = orig_lsp_handler[key]
    if blocked_handlers[key] then
      return function(err, result, ctx, config)
        if lsp_float_enabled then
          return original(err, result, ctx, config)
        else
          -- ignora
          return
        end
      end
    else
      return original
    end
  end
})
}
