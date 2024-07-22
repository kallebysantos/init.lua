return {
  "nvim-telescope/telescope.nvim",
  priority = 1000,
  keys = {
    -- disable the keymap to grep files
    -- {"<leader>/", false},

    -- change a keymap
    { "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find Files" },
    -- add a keymap to browse plugin files
    {
      "<leader>fp",
      function()
        require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Find Plugin File",
    },
  },
}
