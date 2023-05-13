local lsp = require('lsp-zero').preset({
    float_border = 'rounded',
    call_servers = 'local',
    configure_diagnostics = true,
    setup_servers_on_start = true,
    set_lsp_keymaps = {
        preserve_mappings = false,
        omit = {},
    },
    manage_nvim_cmp = {
        set_sources = 'recommended',
        set_basic_mappings = true,
        set_extra_mappings = false,
        use_luasnip = true,
        set_format = true,
        documentation_window = true,
    },
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- Make sure you setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = {
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false, silent = true }

    client.server_capabilities.semanticTokensProvider = nil

    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<C-Space>", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set({ "i", "n" }, "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    --vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.hover()]])
end)

lsp.set_sign_icons({
    error = '‼️',
    warn = '⚠️',
    hint = '💡',
    info = '🔍'
})

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
