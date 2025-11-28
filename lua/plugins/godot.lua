return {
  -- add the LSP server configuration through lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- ---@type lspconfig.options
      servers = {
        gdscript = {}, -- NOTE: To change the port, you need to set the environment variable GDScript_Port to the correct port number.
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.clang_format,
          -- gdtoolkit needs to be installed manually (at least in windows, for now)
          null_ls.builtins.formatting.gdformat,
          null_ls.builtins.diagnostics.gdlint,
          -- should use ruff-lsp
          -- null_ls.builtins.formatting.autopep8,
          -- null_ls.builtins.diagnostics.ruff,
          null_ls.builtins.diagnostics.mypy.with({
            extra_args = function()
              local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
              return { "--python-executable", virtual .. "/bin/python" }
            end,
          }),
        },
      })
    end,
  },
  -- add an nvim-dap configuration for gdscript and a DAP client adapter configuration for it.
  {
    "mfussenegger/nvim-dap",
    opts = {},
    config = function(_, opts)
      local dap = require("dap")
      dap.configurations.gdscript = {
        {
          type = "godot",
          request = "launch",
          name = "Launch scene",
          project = "${workspaceFolder}",
          launch_scene = true,
        },
      }
      dap.adapters.godot = {
        type = "server",
        host = "127.0.0.1",
        port = 6006,
      }
    end,
  },
}
