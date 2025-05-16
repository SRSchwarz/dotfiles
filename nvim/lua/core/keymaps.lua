local g = vim.g
local keymap = vim.keymap

g.mapleader = " "

keymap.set("n", "<Esc>", function()
    local has_hl = vim.v.hlsearch == 1
    if has_hl then
        vim.cmd("nohlsearch")
    end

    local ok, noice = pcall(require, "noice")
    if ok then
        noice.cmd("dismiss")
    end

    if not has_hl then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
    end
end, { noremap = true, silent = true })


vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Q', 'q', {})
vim.api.nvim_create_user_command('Qa', 'qa', {})
vim.api.nvim_create_user_command('QA', 'qa', {})
vim.api.nvim_create_user_command('Wqa', 'wqa', {})
vim.api.nvim_create_user_command('WQa', 'wqa', {})


-- comment
