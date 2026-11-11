vim.api.nvim_create_user_command("PackUpdate", function()
  vim.pack.update()
end, {})

vim.api.nvim_create_user_command("PackSync", function()
  vim.pack.update(nil, { target = "lockfile" })
end, {})

vim.api.nvim_create_user_command("PackStatus", function()
  vim.pack.update(nil, { offline = true })
end, {})

vim.api.nvim_create_user_command("LtexLanguage", function(opts)
  -- Set the LTEX language by inserting or updating its comment at the top of the buffer.
  local languages = { de = "de-DE", en = "en-US", es = "es-ES" }
  local lang = languages[opts.args]

  if not lang then
    vim.notify("Usage: :LtexLanguage de|en|es", vim.log.levels.ERROR)
    return
  end

  local ft = vim.bo.filetype
  local prefixes = {
    bib = "% ",
    gitcommit = "# ",
    html = "<!-- ",
    markdown = "<!-- ",
    org = "# ",
    mdx = "<!-- ",
    tex = "% ",
    latex = "% ",
    text = "# ",
    typst = "// ",
  }

  local prefix = prefixes[ft]
  if not prefix then
    vim.notify("Unsupported filetype: " .. ft, vim.log.levels.ERROR)
    return
  end

  local suffix = (ft == "html" or ft == "markdown" or ft == "mdx") and " -->" or ""
  local line = prefix .. "LTeX: language=" .. lang .. suffix
  local first = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1] or ""

  if first:match("LTeX: language=") then
    vim.api.nvim_buf_set_lines(0, 0, 1, false, { line })
  else
    vim.api.nvim_buf_set_lines(0, 0, 0, false, { line, "" })
  end
end, {
  nargs = 1,
  complete = function()
    return { "de", "en", "es" }
  end,
})
