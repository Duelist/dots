local dap = require'dap'
local dapui = require'dapui'

-- Setup
dapui.setup {}
dap.set_log_level('TRACE');

-- Automatically open UI
dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open();
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close();
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close();
end

dap.configurations.python = {
  {
    name = 'Python: Current file',
    type = 'python',
    request = 'launch',
    program = '${file}',
    pythonPath = function()
      -- Check for a Python executable in an existing virualenv before using
      -- the default Python
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end,
  }
}
