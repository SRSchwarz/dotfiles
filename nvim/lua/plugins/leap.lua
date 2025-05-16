return {
  "ggandor/leap.nvim",
  event = "VeryLazy",
  config = function()
    local leap = require("leap")
    leap.add_default_mappings()

    vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { fg = '#1F1F28', bg = '#DCA561', bold = true })
    vim.api.nvim_set_hl(0, 'LeapLabelSecondary', { fg = '#1F1F28', bg = '#7FB4CA', bold = true })
    vim.api.nvim_set_hl(0, 'LeapBackdrop', { fg = '#727169' })
  end,
}
