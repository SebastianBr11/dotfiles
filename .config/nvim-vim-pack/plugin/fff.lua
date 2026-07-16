local version = "v0.9.6"
vim.pack.add({ { src = "https://github.com/dmtrKovalenko/fff.nvim", version = version } })

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "fff.nvim" and (kind == "install" or kind == "update") then
      if not ev.data.active then
        vim.cmd.packadd("fff.nvim")
      end
      require("fff.download").ensure_downloaded({ force = true, version = version })
    end
  end,
})

vim.g.fff = {
  lazy_sync = true,
  debug = { enabled = true, show_scores = true },
}

vim.keymap.set("n", "<leader>ff", function()
  require("fff").find_files()
end, { desc = "[F]FF [f]iles" })
vim.keymap.set("n", "<leader>fg", function()
  require("fff").live_grep()
end, { desc = "[F]FF [g]rep" })
vim.keymap.set({ "n", "x" }, "<leader>fw", function()
  require("fff").live_grep_under_cursor()
end, { desc = "[F]FF current [w]ord / selection" })
vim.keymap.set({ "n" }, "<leader>fr", "<cmd>FFFResume<CR>", { desc = "[F]FF [R]esume" })
