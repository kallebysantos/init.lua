return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
        hide_by_name = {
          "node_modules",
        },
        never_show = {
          ".git",
        },
      },
    },
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function(_arg)
          vim.cmd([[
              setlocal relativenumber
            ]])
        end,
      },
    },
  },
}
