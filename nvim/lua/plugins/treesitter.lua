return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            highlight = {
                enable = true
            },
        })
    end
}
