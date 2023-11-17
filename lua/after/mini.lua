-- mini pairs
require('mini.pairs').setup()

-- mini surround
require('mini.surround').setup()

-- mini ai
require('mini.ai').setup((function()
  local ai = require("mini.ai")
  return {
    n_lines = 500,
    custom_textobjects = {
      o = ai.gen_spec.treesitter({
        a = { "@block.outer", "@conditional.outer", "@loop.outer" },
        i = { "@block.inner", "@conditional.inner", "@loop.inner" },
      }, {}),
      f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
      c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
      t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
    },
  }
end)())

-- register all text objects with which-key
require('util').on_load("which-key.nvim", function()
  local i = {
    [" "] = "Whitespace",
    ["?"] = "User Prompt",
    _ = "Underscore",
    a = "Argument",
    b = "Balanced ), ], }",
    c = "Class",
    f = "Function",
    o = "Block, conditional, loop",
    q = "Quote `, \", '",
    t = "Tag",
  }
  local a = vim.deepcopy(i)
  for k, v in pairs(a) do
    a[k] = v:gsub(" including.*", "")
  end

  local ic = vim.deepcopy(i)
  local ac = vim.deepcopy(a)
  for key, name in pairs({ n = "Next", l = "Last" }) do
    i[key] = vim.tbl_extend("force", { name = "Inside " .. name .. " textobject" }, ic)
    a[key] = vim.tbl_extend("force", { name = "Around " .. name .. " textobject" }, ac)
  end
  require("which-key").register({
    mode = { "o", "x" },
    i = i,
    a = a,
  })
end)
