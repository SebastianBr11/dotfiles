vim.pack.add({ "https://github.com/rmagatti/auto-session" })
require("auto-session").setup({})

vim.keymap.set("n", "<leader>wr", "<cmd>AutoSession search<CR>", { desc = "Session search" })
vim.keymap.set("n", "<leader>ws", "<cmd>AutoSession save<CR>", { desc = "[S]ave session" })
vim.keymap.set("n", "<leader>wa", "<cmd>AutoSession toggle<CR>", { desc = "Toggle autosave" })

vim.o.sessionoptions =
  "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
