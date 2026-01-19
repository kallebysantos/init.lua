return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      require("mason").setup({
        registries = {
          "github:mason-org/mason-registry",
          "github:crashdummyy/mason-registry",
        },
      })

      -- Optional: Ensure desired packages are installed
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
        "lua-language-server",
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      })
    end,
  },

  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
      },
    },
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },
}
