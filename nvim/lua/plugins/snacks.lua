return {
    "folke/snacks.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        explorer = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        picker = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },
    keys = {
        { "<leader>ff", function() Snacks.picker.files() end,  desc = "Find Files" },
        { "<leader>fg", function() Snacks.picker.grep() end,   desc = "Grep" },
        { "<leader>t",  function() Snacks.explorer.open() end, desc = "Toggle Explorer" },
    }
}
