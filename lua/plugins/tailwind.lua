return {
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      server = {
        override = true,
        settings = {
          experimental = {
            classRegex = {
              -- Matches: Tw("flex", "text-2xl") and @Tw("flex", "text-2xl")
              "Tw\\(([^)]*)\\)",
              { "\\Tw\\s+\\[([\\s\\S]*)\\]", '["\\:]([^\\s"]*)["]?' },
              { "\\@Tw\\s+\\[([\\s\\S]*)\\]", '["\\:]([^\\s"]*)["]?' },
            },
          },
        },
      },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      -- original LazyVim kind icon formatter
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
}
