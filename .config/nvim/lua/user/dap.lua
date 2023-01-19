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


-- Adapters
-- dap.adapters.chrome = {
--   type = 'executable',
--   command = 'node',
--   args = { vim.fn.stdpath "data" .. '/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js' };
-- }
-- dap.adapters.firefox = {
--   type = 'executable',
--   command = 'node',
--   args = { vim.fn.stdpath "data" .. '/mason/packages/firefox-debug-adapter/dist/adapter.bundle.js' };
-- }
require'dap-vscode-js'.setup {
  -- node_path = 'node',
  -- debugger_path = vim.fn.stdpath 'data' .. '/site/pack/packer/opt/vscode-js-debug',
  debugger_path = vim.fn.stdpath 'data' .. '/mason/packages/js-debug-adapter',
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
}
dap.adapters.python = {
  type = 'executable',
  command = 'python',
  args = { '-m', 'debugpy.adapter' },
}


-- Configurations
-- dap.configurations.javascript = {
--   {
--     type = 'firefox',
--     request = 'launch',
--     reAttach = true,
--     url = 'http://localhost:8000',
--     webRoot = '${workspaceFolder}',
--     firefoxExecutable = '/usr/bin/firefox',
--   },
-- }
dap.configurations.javascript = {
  -- {
  --   type = 'pwa-chrome',
  --   name = 'Attach Chrome - Remote Debugging',
  --   request = 'attach',
  --   program = '${file}',
  --   cwd = vim.fn.getcwd(),
  --   sourceMaps = true,
  --   protocol = 'inspector',
  --   port = 9222,
  --   webRoot = '${workspaceFolder}',
  -- },
  {
    type = "pwa-chrome",
    name = "Launch Chrome",
    request = "launch",
    url = "http://localhost:3000",
  }
}
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
