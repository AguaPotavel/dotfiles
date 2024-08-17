--
-- Setup mini ai
--

local ai = require('mini.ai')

require('mini.ai').setup({
  n_lines = 500,
  custom_textobjects = {
    o = ai.gen_spec.treesitter({ -- code block
      a = { "@block.outer", "@conditional.outer", "@loop.outer" },
      i = { "@block.inner", "@conditional.inner", "@loop.inner" },
    }),
    f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
    c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
    t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
    d = { "%f[%d]%d+" }, -- digits
    e = { -- Word with case
      { "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
      "^().*()$",
    },
    u = ai.gen_spec.function_call(), -- u for "Usage"
    U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
  },
})

--
-- setup mini sessions
--
require("mini.sessions").setup()

--
-- setup mini starter
--
local pad = string.rep(" ", 22)
local new_section = function(name, action, section)
  return { name = name, action = action, section = pad .. section}
end

local logo = table.concat({
"   █████╗  ██████╗ ██╗   ██╗ █████╗ ██████╗  ██████╗ ████████╗ █████╗ ██╗   ██╗███████╗██╗      ",
"  ██╔══██╗██╔════╝ ██║   ██║██╔══██╗██╔══██╗██╔═══██╗╚══██╔══╝██╔══██╗██║   ██║██╔════╝██║      ",
"  ███████║██║  ███╗██║   ██║███████║██████╔╝██║   ██║   ██║   ███████║██║   ██║█████╗  ██║      ",
"  ██╔══██║██║   ██║██║   ██║██╔══██║██╔═══╝ ██║   ██║   ██║   ██╔══██║╚██╗ ██╔╝██╔══╝  ██║      ",
"  ██║  ██║╚██████╔╝╚██████╔╝██║  ██║██║     ╚██████╔╝   ██║   ██║  ██║ ╚████╔╝ ███████╗███████╗ ",
"  ╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝      ╚═════╝    ╚═╝   ╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚══════╝ ",
}, "\n")

local starter = require('mini.starter')
local ts = require('telescope.builtin')
local configPath = "~/.config/"
starter.setup({
  evaluate_sigle = true,
  header = logo,
  items = {
    -- Files
    new_section("Find file (Folder)", ts.find_files, "Files"),
    new_section("Find file (Root)", ts.live_grep, "Files"),
    new_section("Recent files", ts.oldfiles, "Files"),
    -- Config
    new_section("Zellij", "Telescope find_files cwd=" .. configPath .. "/zellij", "Config"),
    new_section("Kitty", "Telescope find_files cwd=" .. configPath .. "/kitty", "Config"),
    new_section("Nvim", "Telescope find_files cwd=" .. configPath .. "/nvim", "Config"),
    -- Sessions
    new_section("Sessions",  starter.sections.sessions(), "Session")
  },
  content_hooks = {
    starter.gen_hook.adding_bullet(pad .. "░ ", false),
    starter.gen_hook.aligning("center", "center"),
  },
  footer = nil
})


--
-- setup mini animate 
--
require('mini.animate').setup({
  cursor = {
    enable = true
  },

  scroll = {
    enable = true
  },


  resize = {
    enable = true
  },

  open = {
    enable = true
  },

  close = {
    enable = true
  }
})
