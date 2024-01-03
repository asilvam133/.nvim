local sign_define = vim.fn.sign_define

sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
sign_define("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})
