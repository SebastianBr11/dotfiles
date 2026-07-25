if vim.fn.executable("mise") == 0 then
  vim.notify("Mise not found!", "warn")
  return
end

local dotfiles_dir = vim.fn.expand("~/.dotfiles")

-- Automatically switch to the dotfiles git repo when a file managed by Mise is opened.
-- If a file in another git repo is opened, that repo is loaded by setting the env variables
-- to make sure that e.g. Neogit works as expected.
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function(ev)
    local current_file_path = ev.file

    -- Strip oil prefix
    if vim.startswith(current_file_path, "oil://") then
      current_file_path = current_file_path:gsub("oil://", "", 1)
    end

    -- Reset env variables to make sure git uses
    -- the current file path to decide if the file
    -- is part of a git repo
    vim.env.GIT_DIR = nil
    vim.env.GIT_WORK_TREE = nil

    local current_file_parent_path = current_file_path
    local is_directory = vim.endswith(current_file_path, "/")
    if not is_directory then
      -- Only use parent if current_file_path is not a directory
      current_file_parent_path = vim.fn.fnamemodify(current_file_path, ":h")
    end

    -- Get the current file's get repo
    local result =
      vim.system({ "git", "-C", current_file_parent_path, "rev-parse", "--show-toplevel" }):wait()
    local existing_git_repo_dir = vim.trim(result.stdout)

    -- If the current file is in a repo and that repo is not the dotfiles repo
    if result.code == 0 and existing_git_repo_dir ~= dotfiles_dir then
      -- Update env variables to use git repo of open buffer
      vim.env.GIT_DIR = existing_git_repo_dir .. "/.git"
      vim.env.GIT_WORK_TREE = existing_git_repo_dir
      return
    end

    result = vim
      .system({ "mise", "bootstrap", "dotfiles", "status", "--json" }, { cwd = dotfiles_dir })
      :wait()
    if result.code ~= 0 then
      vim.notify("Error running mise bootstrap dotfiles status --json", "error")
      return
    end

    local ok, data = pcall(vim.json.decode, result.stdout, { luanil = { object = true } })
    if not ok then
      vim.notify("mise produced invalid json: %s", result.stdout, "error")
      return
    end

    for _, value in pairs(data.files) do
      local mise_file_path = vim.fn.expand(value.target)
      local mise_source_path = vim.fn.expand(value.source)
      if
        vim.startswith(current_file_path, mise_file_path)
        or vim.startswith(current_file_path, mise_source_path)
      then
        vim.api.nvim_set_current_dir(dotfiles_dir)
        vim.env.GIT_DIR = dotfiles_dir .. "/.git"
        vim.env.GIT_WORK_TREE = dotfiles_dir
        break
      end
    end
  end,
})
