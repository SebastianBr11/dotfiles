vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require("snacks").setup({
  bigfile = {},
  gitbrowse = {},
  image = {},
  ---@class snacks.indent.Config
  indent = {
    chunk = {
      enabled = true,
    },
  },
  notifier = {},
  picker = {},
  scratch = {},
})

vim.api.nvim_create_user_command("LspInfo", function()
  Snacks.picker.lsp_config()
end, {})

vim.keymap.set("n", "<leader>nd", function()
  Snacks.notifier.hide()
end)

vim.keymap.set("n", "<leader>sh", function()
  Snacks.picker.help()
end, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", function()
  Snacks.picker.keymaps()
end, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", function()
  Snacks.picker.smart()
end, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", function()
  Snacks.picker.pickers()
end, { desc = "[S]earch [S]elect Snacks" })
vim.keymap.set({ "n", "x" }, "<leader>sw", function()
  Snacks.picker.grep_word()
end, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", function()
  Snacks.picker.grep()
end, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", function()
  Snacks.picker.diagnostics()
end, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", function()
  Snacks.picker.resume()
end, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader><leader>", function()
  Snacks.picker.buffers()
end, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
  Snacks.picker.lines({})
end, { desc = "[/] Fuzzily search in current buffer}" })
vim.keymap.set("n", "<leader>sb", function()
  Snacks.picker.lines()
end, { desc = "[S]earch [B]uffer Lines" })
vim.keymap.set("n", "<leader>s/", function()
  Snacks.picker.grep_buffers()
end, { desc = "[S]earch [/] in Open Files" })
vim.keymap.set("n", "<leader>sn", function()
  Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })
vim.keymap.set("n", "<leader>gl", function()
  Snacks.picker.git_log({ confirm = "git_show" })
end, { desc = "Git Log" })
vim.keymap.set("n", "<leader>gb", function()
  Snacks.gitbrowse.open()
end, { desc = "[G]it [B]rowse" })
vim.keymap.set("n", "<leader>gc", function()
  Snacks.picker.git_branches()
end, { desc = "[G]it [C]heckout" })
vim.keymap.set("n", "<leader>gd", function()
  Snacks.picker.git_diff()
end, { desc = "[G]it [D]iff" })
vim.keymap.set("n", "<leader>gg", function()
  Snacks.picker.git_grep()
end, { desc = "[G]it [G]rep" })
vim.keymap.set("n", "z=", function()
  Snacks.picker.spelling()
end, { desc = "Spelling suggestions" })
vim.keymap.set("n", "<leader>sc", function()
  Snacks.picker.commands()
end, { desc = "[S]earch [C]ommands" })

-- INFO: Show LSP progress using snacks notifier

---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
local progress = vim.defaulttable()
vim.api.nvim_create_autocmd("LspProgress", {
  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
    if not client or type(value) ~= "table" then
      return
    end
    local p = progress[client.id]

    for i = 1, #p + 1 do
      if i == #p + 1 or p[i].token == ev.data.params.token then
        p[i] = {
          token = ev.data.params.token,
          msg = ("[%3d%%] %s%s"):format(
            value.kind == "end" and 100 or value.percentage or 100,
            value.title or "",
            value.message and (" **%s**"):format(value.message) or ""
          ),
          done = value.kind == "end",
        }
        break
      end
    end

    local msg = {} ---@type string[]
    progress[client.id] = vim.tbl_filter(function(v)
      return table.insert(msg, v.msg) or not v.done
    end, p)

    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    vim.notify(table.concat(msg, "\n"), "info", {
      id = "lsp_progress",
      title = client.name,
      opts = function(notif)
        notif.icon = #progress[client.id] == 0 and " "
          or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})
