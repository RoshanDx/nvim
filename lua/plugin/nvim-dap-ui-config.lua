local dap, dapui, dap_virtual_text = require("dap"), require("dapui"), require("nvim-dap-virtual-text")

dapui.setup({})
dap_virtual_text.setup({})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    -- dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    -- dapui.close()
end

vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticSignError', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'DiagnosticSignWarn', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DiagnosticSignError', linehl = '', numhl = '' })
