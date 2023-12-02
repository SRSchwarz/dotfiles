return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-nvim-lua" },
        { "L3MON4D3/LuaSnip" },
        { "saadparwaiz1/cmp_luasnip" },
    },
    config = function()
        local lsp = require("lsp-zero").preset({})
        local lspconfig = require("lspconfig")
        local cmp = require("cmp")


        lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

        lsp.on_attach(function(_, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
            lsp.buffer_autoformat()
        end)
        lsp.set_sign_icons({
            error = '✘',
            warn = '▲',
            hint = '⚑',
            info = '»'
        })
        lsp.setup()

        cmp.setup({
            completion = { completeopt = "menu,menuone,noinsert" },
            mapping = {
                ["<CR>"] = cmp.mapping.confirm(),
            }
        })
    end
}
