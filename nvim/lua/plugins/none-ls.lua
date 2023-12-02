return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        local sources = { null_ls.builtins.formatting.goimports, null_ls.builtins.formatting.autopep8 }
        null_ls.setup({ sources = sources })
    end
}
