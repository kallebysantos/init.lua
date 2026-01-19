return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "williamboman/mason-nvim-dap.nvim",
    },
    config = function()
      local dap = require("dap")

      dap.configurations.rust = dap.configurations.rust or {}

      table.insert(dap.configurations.rust, {
        name = "Attach edge-runtime (lldb-server)",
        type = "codelldb",
        request = "attach",
        program = "${workspaceFolder}/target/debug/edge-runtime",
        cwd = "${workspaceFolder}",
        host = "127.0.0.1",
        port = 2345,
      })
    end,
  },
}
