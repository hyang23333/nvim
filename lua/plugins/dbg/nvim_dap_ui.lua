return {
    -- A UI for nvim-dap.
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
        require('dapui').setup()
        local dap, dapui = require("dap"), require("dapui")

        -- Automatically open/close UI once debupping session created/finished.
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open({})
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            -- dapui.close({})
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            -- dapui.close({})
        end

        vim.keymap.set('n', '<leader>dui', require 'dapui'.toggle)
    end,
}
