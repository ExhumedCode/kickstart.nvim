-- Toggle between cindent and treesitter indentation for C/C++
-- Usage: :ToggleCIndent

local function toggle_c_indent()
  local c_indent_file = vim.fn.stdpath('config') .. '/lua/custom/c_indent.lua'
  local init_file = vim.fn.stdpath('config') .. '/init.lua'

  -- Read current c_indent.lua
  local lines = vim.fn.readfile(c_indent_file)
  local current_method = 'cindent'

  -- Find current method
  for i, line in ipairs(lines) do
    if line:match("local INDENT_METHOD = '(%w+)'") then
      current_method = line:match("local INDENT_METHOD = '(%w+)'")
      break
    end
  end

  -- Toggle to the other method
  local new_method = current_method == 'cindent' and 'treesitter' or 'cindent'

  -- Update c_indent.lua
  for i, line in ipairs(lines) do
    if line:match("local INDENT_METHOD = '") then
      lines[i] = string.format("local INDENT_METHOD = '%s'  -- Toggle: 'cindent' or 'treesitter'", new_method)
      break
    end
  end

  vim.fn.writefile(lines, c_indent_file)

  -- If switching to treesitter, need to update init.lua
  if new_method == 'treesitter' then
    local init_lines = vim.fn.readfile(init_file)
    for i, line in ipairs(init_lines) do
      if line:match("indent = { enable = true, disable = { 'ruby', 'c', 'cpp' }") then
        init_lines[i] = "      indent = { enable = true, disable = { 'ruby' } },  -- Tree-sitter enabled for C/C++"
        vim.fn.writefile(init_lines, init_file)
        break
      end
    end
  elseif new_method == 'cindent' then
    local init_lines = vim.fn.readfile(init_file)
    for i, line in ipairs(init_lines) do
      if line:match("indent = { enable = true, disable = { 'ruby' }") then
        init_lines[i] = "      indent = { enable = true, disable = { 'ruby', 'c', 'cpp' } },  -- Let cindent handle C/C++ for predictable behavior"
        vim.fn.writefile(init_lines, init_file)
        break
      end
    end
  end

  -- Reload config
  vim.cmd('source ' .. init_file)

  -- Notify user
  vim.notify(
    string.format('Switched to %s indentation method.\nReopen C/C++ files for changes to take effect.', new_method),
    vim.log.levels.INFO
  )
end

-- Create the command
vim.api.nvim_create_user_command('ToggleCIndent', toggle_c_indent, {
  desc = 'Toggle between cindent and treesitter indentation for C/C++'
})

return {
  toggle = toggle_c_indent
}
