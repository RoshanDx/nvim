local dap, dapui, dap_virtual_text = require("dap"), require("dapui")
--require("nvim-dap-virtual-text")

dapui.setup({})
--dap_virtual_text.setup({})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    -- dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    -- dapui.close()
end

vim.api.nvim_set_hl(0, 'DapStoppedCursorLine', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })

vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticSignError', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped',
    { text = '', texthl = 'DiagnosticSignWarn', linehl = 'DapStoppedCursorLine', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DiagnosticSignError', linehl = '', numhl = '' })
