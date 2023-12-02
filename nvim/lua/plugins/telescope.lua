return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-live-grep-args.nvim",
        "nvim-telescope/telescope-ui-select.nvim"
    },
    keys = {
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files()
            end,
        },
        {
            "<leader>fg",
            function()
                require('telescope').extensions.live_grep_args.live_grep_args()
            end
        },
        {
            "<leader>fr",
            function()
                require("telescope.builtin").lsp_references()
            end
        },
        {
            "<leader>fb",
            function()
                require("telescope.builtin").buffers()
            end
        },
    },
    config = function()
        require("telescope").load_extension("live_grep_args")
        require("telescope").load_extension("ui-select")
    end
}
