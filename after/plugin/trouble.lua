require("trouble").setup {
    height = 5,        -- height of the trouble list when position is top or bottom
    width = 50,        -- width of the list when position is left or right
    icons = true,      -- use devicons for filenames
    mode = "document_diagnostics",
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = true, -- automatically close the list when you have no diagnostics
    padding = false,
}

vim.keymap.set("n", "<leader>err", ":TroubleToggle<CR>")
