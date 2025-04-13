---@type NvPluginSpec
-- NOTE: Debug
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "microsoft/vscode-js-debug",
    build = "npm install --legacy-peer-deps && npm run compile",
    lazy = true,
  },
  init = function()
    vim.g.dap_virtual_text = true
  end,
  config = function()
    local dap = require("dap")

    -- Adaptador para Node.js/TypeScript
    dap.adapters["pwa-node"] = {
      type = "pwa-node",
      request = "launch",
      name = "Debug Current File (TS/Next.js)",
      program = "${file}",
      cwd = "${workspaceFolder}",
      sourceMaps = true,
      skipFiles = {
        "<node_internals>/**",            -- Ignora arquivos internos do Node
        "${workspaceFolder}/node_modules/**", -- Ignora dependências
        "**/.next/**",                    -- Ignora cache do Next.js (opcional)
        "/home/ruan/.nvm/**"              -- Ignora módulos globais (ajuste o caminho)
      },
      protocol = "inspector",
      console = "integratedTerminal",
      outFiles = {
        "${workspaceFolder}/dist/**/*.js", -- Para projetos TypeScript padrão
        "${workspaceFolder}/.next/**/*.js", -- Para Next.js
        "${workspaceFolder}/out/**/*.js" -- Para projetos com export estático
      },
      resolveSourceMapLocations = {
        "${workspaceFolder}/**", -- Procura sourcemaps em todo o projeto
        "!**/node_modules/**", -- Exceto em node_modules
        "!**/.next/**"       -- E no cache do Next.js (opcional)
      },
      -- Configurações específicas para Next.js:
      runtimeExecutable = "next", -- Ou "${workspaceFolder}/node_modules/.bin/next"
      runtimeArgs = { "dev" }, -- Argumentos para o Next.js
      env = {
        NODE_ENV = "development", -- Garante ambiente de desenvolvimento
        DEBUG = "*"           -- Habilita logs de debug (opcional)
      },
      -- Para projetos com ts-node:
      runtimeArgs = { "--loader", "ts-node/esm" }, -- Se estiver usando ESM
      smartStep = true,                        -- Pula código gerado automaticamente
      trace = true                             -- Logs detalhados (útil para troubleshooting)
    }

    -- Configurações compartilhadas
    local shared_config = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Debug Current File (TS)",
        program = "${file}",
        cwd = "${workspaceFolder}",
        sourceMaps = true,
        skipFiles = { "<node_internals>/**" },
        protocol = "inspector",
      },
      {
        type = "pwa-node",
        request = "launch",
        name = "Debug Next.js",
        runtimeExecutable = "next",
        args = { "dev" },
        rootPath = "${workspaceFolder}",
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal",
      }
    }

    -- Aplicar configurações
    for _, lang in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
      dap.configurations[lang] = shared_config
    end
  end,
  keys = {
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end,                                    desc = "Toggle Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end,                                             desc = "Run/Continue" },
    { "<leader>da", function() require("dap").continue({ before = get_args }) end,                        desc = "Run with Args" },
    { "<leader>dC", function() require("dap").run_to_cursor() end,                                        desc = "Run to Cursor" },
    { "<leader>dg", function() require("dap").goto_() end,                                                desc = "Go to Line (No Execute)" },
    { "<leader>di", function() require("dap").step_into() end,                                            desc = "Step Into" },
    { "<leader>dj", function() require("dap").down() end,                                                 desc = "Down" },
    { "<leader>dk", function() require("dap").up() end,                                                   desc = "Up" },
    { "<leader>dl", function() require("dap").run_last() end,                                             desc = "Run Last" },
    { "<leader>do", function() require("dap").step_out() end,                                             desc = "Step Out" },
    { "<leader>dO", function() require("dap").step_over() end,                                            desc = "Step Over" },
    { "<leader>dP", function() require("dap").pause() end,                                                desc = "Pause" },
    { "<leader>dr", function() require("dap").repl.toggle() end,                                          desc = "Toggle REPL" },
    { "<leader>ds", function() require("dap").session() end,                                              desc = "Session" },
    { "<leader>dt", function() require("dap").terminate() end,                                            desc = "Terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end,                                     desc = "Widgets" },
    { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end,                      desc = "Debug Nearest" }
  },
}
