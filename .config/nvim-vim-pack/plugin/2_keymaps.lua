vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

local set = vim.keymap.set

for i = 1, 9 do
	set({ "i", "n" }, "<C-" .. i .. ">", i .. "gt", { unique })
end

set({ "i", "n" }, "<C-0>", ":tablast<CR>")

-- Thanks TJ
set("n", "j", function(...)
	local count = vim.v.count

	if count == 0 then
		return "gj"
	else
		return "j"
	end
end, { expr = true })

set("n", "k", function(...)
	local count = vim.v.count

	if count == 0 then
		return "gk"
	else
		return "k"
	end
end, { expr = true })
