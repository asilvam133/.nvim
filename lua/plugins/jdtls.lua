-- Because JDT always import all the modules found in a project as soon as a Java file is open,
-- disabling auto import is the best choice.
-- Run :JdtAttach in a Java buffer.
return {
  {
    "mfussenegger/nvim-jdtls",
    -- Cancels the extra's `ft = { "java" }` autostart trigger.
    ft = false,
    lazy = true,
    opts = function(_, opts)
      opts.root_dir = function(path)
        return vim.fs.root(path, { "pom.xml", "build.gradle", "build.gradle.kts" })
          or vim.fs.root(path, { ".git" })
      end
      return opts
    end,
    init = function()
      vim.api.nvim_create_user_command("JdtAttach", function()
        require("lazy").load({ plugins = { "nvim-jdtls" } })
      end, { desc = "Start jdtls and attach it to the current buffer" })
    end,
  },
}
