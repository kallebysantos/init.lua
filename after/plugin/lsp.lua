local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- Make sure you setup `cmp` after lsp-zero

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
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
    local opts = { buffer = bufnr, remap = false }

    client.server_capabilities.semanticTokensProvider = nil

    vim.keymap.set("n", "<C-Space>", function() vim.lsp.buf.hover() end, opts)
    --vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.hover()]])
end)

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
lsp.setup()
