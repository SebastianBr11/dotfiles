local files = require 'overseer.files'

---@param opts overseer.SearchParams
local function get_candidate_rush_files(opts)
  return vim.fs.find('rush.json', {
    upward = true,
    type = 'file',
    path = vim.fn.getcwd(),
  })
end

---@param opts overseer.SearchParams
local function get_command_line_file(opts)
  return vim.fs.find('command-line.json', {
    type = 'file',
    path = vim.fn.getcwd(),
  })[1]
end

---@type overseer.TemplateFileProvider
return {
  generator = function(opts)
    local candidate_packages = get_candidate_rush_files(opts)
    if next(candidate_packages) == nil then
      return 'No rush.json file found'
    end

    if vim.fn.executable 'rush' == 0 then
      return string.format 'Could not find command rush'
    end

    local rush_commands_file = get_command_line_file(opts)

    -- In load_json_file comments in the form "/**" are not ignored
    -- so, change the line that detects them to the following:
    -- if to_end:match("^//") or to_end:match("^/%*%*") or to_end:match("^%*") then
    local data = files.load_json_file(rush_commands_file)
    local ret = {}
    local cwd = vim.fs.dirname(candidate_packages[1])
    if data.commands then
      for _, v in ipairs(data.commands) do
        table.insert(ret, {
          name = string.format('rush %s (%s)', v.name, v.summary),
          builder = function()
            return {
              cmd = { 'rush', v.name },
              cwd = cwd,
            }
          end,
        })
        if v.watchOptions ~= nil then
          table.insert(ret, {
            name = string.format('rush %s --watch', v.name),
            builder = function()
              return {
                cmd = { 'rush', v.name, '--watch' },
                cwd = cwd,
              }
            end,
          })
        end
      end
    end

    if data.parameters then
      for _, param in ipairs(data.parameters) do
        if param.associatedCommands ~= nil then
          for _, command in ipairs(param.associatedCommands) do
            table.insert(ret, {
              name = string.format('rush %s %s', command, param.longName),
              builder = function()
                return {
                  cmd = { 'rush', command, param.longName },
                  cwd = cwd,
                }
              end,
            })
          end
        end
      end
    end

    table.insert(ret, {
      name = 'rush' .. ' update',
      builder = function()
        return {
          cmd = { 'rush', 'update' },
          cwd = cwd,
        }
      end,
    })
    return ret
  end,
}
