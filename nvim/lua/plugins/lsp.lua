return {
    {
        "neovim/nvim-lspconfig",
        -- dependencies = {
        --     "williamboman/mason.nvim",
        --     "williamboman/mason-lspconfig.nvim",
        -- },
        config = function()
            -- require("mason").setup()
            -- require("mason-lspconfig").setup({
            --     ensure_installed = { "lua_ls", "gopls" },
            --     automatic_installation = true,
            -- })

            local lspconfig = require("lspconfig")
            local picker = require("snacks.picker")
            local on_attach = function(client, bufnr)
                local opts = { buffer = bufnr }

                vim.keymap.set("n", "gd", function()
                    picker.lsp_definitions(opts)
                end, { desc = "LSP Definitions" })

                vim.keymap.set("n", "gD", function()
                    picker.lsp_declarations(ops)
                end, { desc = "LSP Declarations" })

                vim.keymap.set('n', 'gi', function()
                    picker.lsp_implementations(opts)
                end, { desc = 'LSP Implementations' })

                vim.keymap.set('n', 'gr', function()
                    picker.lsp_references(opts)
                end, { desc = 'LSP References' })

                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)



                vim.diagnostic.config({
                    signs = {
                        text = {
                            [vim.diagnostic.severity.ERROR] = " ",
                            [vim.diagnostic.severity.WARN]  = " ",
                            [vim.diagnostic.severity.HINT]  = " ",
                            [vim.diagnostic.severity.INFO]  = " ",
                        },
                    },
                    virtual_text = false, -- or true, depending on your preference
                    underline = true,
                    update_in_insert = false,
                    severity_sort = true,
                })
                if client.supports_method("textDocument/formatting") then
                    local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = false })
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            -- local mason_lspconfig = require("mason-lspconfig")
            -- local installed_servers = mason_lspconfig.get_installed_servers()
            local installed_servers = { "gopls", "lua_ls" }
            for _, server in ipairs(installed_servers) do
                lspconfig[server].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end
            --
            -- require("mason-lspconfig").setup_handlers({
            --     function(server_name)
            --         lspconfig[server_name].setup({
            --             on_attach = on_attach,
            --             capabilities = capabilities,
            --         })
            --     end,
            -- })
        end,
    },
}
