return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-neotest/neotest-go",
        "rouge8/neotest-rust",
    },
    config = function()
        local neotest_ns = vim.api.nvim_create_namespace("neotest")
        vim.diagnostic.config({
            virtual_text = {
                format = function(diagnostic)
                    local message =
                        diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                    return message
                end,
            },
        }, neotest_ns)
        require("neotest").setup({
            -- your neotest config here
            adapters = {
                require("neotest-go"),
                require("neotest-rust"),
            },
        })
    end,
    keys = {
        {
            "<leader>rt",
            function()
                require("neotest").run.run()
            end,
        },
        {
            "<leader>rat",
            function()
                require('neotest').run.run(vim.fn.expand('%'))
            end,
        }
    }
}
