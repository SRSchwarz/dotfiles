local opt = vim.opt

opt.relativenumber = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.swapfile = false
opt.backup = false
opt.showcmd = false
opt.ruler = false

vim.o.updatetime = 250

vim.cmd([[
  autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false, border = "rounded" })
]])
