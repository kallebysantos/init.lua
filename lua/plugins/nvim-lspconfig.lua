return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- Typescript
      denols = {
        root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
      },
      tsserver = {
        root_dir = require("lspconfig").util.root_pattern("package.json"),
        single_file_support = false,
      },
      vtsls = {
        root_dir = require("lspconfig").util.root_pattern("package.json"),
        single_file_support = false,
        enabled = true,
      },
      -- PostgreSQL
      postgres_lsp = {
        enabled = false,
        filetypes = { "sql" },
      },
    },
  },
}
