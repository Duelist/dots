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

dap.adapters['pwa-node'] = {
    type = 'server',
    host = '127.0.0.1',
    port = 8123,
    executable = {
        command = 'js-debug-adapter',
    }
}

dap.configurations.javascript = {
    type = 'pwa-node',
    request = 'launch',
    name = 'Launch file',
    program = '${file}',
    cwd = '${workspaceFolder}',
    runtimeExecutable = 'node',
}

dap.configurations.typescript = {
    type = 'pwa-node',
    request = 'launch',
    name = 'Launch file',
    program = '${file}',
    cwd = '${workspaceFolder}',
    runtimeExecutable = 'node',
}
