return {
    -- Great tutorial: https://miguelcrespo.co/posts/debugging-javascript-applications-with-neovim/
    -- nvim-dap adapter for vscode-js-debug.
    'mxsdev/nvim-dap-vscode-js',
    dependencies = {
        "microsoft/vscode-js-debug",
        -- After install, build it and rename the `dist` directory to `out`.
        build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"

        -- (Alternatively) Manual download: https://github.com/mxsdev/nvim-dap-vscode-js?tab=readme-ov-file#manually
        -- Move file to `~/.local/share/nvim/lazy/vscode-js-debug`
    },
    config = function()
        require("dap-vscode-js").setup({
            -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
            -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug",                         -- Path to vscode-js-debug installation.
            debugger_path = vim.fn.stdpath('data') .. "/lazy/vscode-js-debug",
            -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
            adapters = {
                'pwa-node',
                'pwa-chrome',
                'pwa-msedge',
                'node-terminal',
                'pwa-extensionHost'
            }, -- which adapters to register in nvim-dap
            -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
            -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
            -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
        })

        for _, language in ipairs({
            "typescript",
            "javascript",
            "typescriptreact",
            "javascriptreact",
        }) do
            require("dap").configurations[language] = {
                {
                    -- Debug single `Node.js` files.
                    type = "pwa-node",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                },
                {
                    -- Debug node processes like `express` applications.
                    type = "pwa-node",
                    request = "attach",
                    name = "Attach",
                    processId = require 'dap.utils'.pick_process,
                    cwd = "${workspaceFolder}",
                },
                {
                    -- Debug web applications.
                    -- The line userDataDir will save Chrome profile in a file
                    type = "pwa-chrome",
                    request = "launch",
                    name = "Start Chrome with \"localhost\"",
                    url = "http://localhost:3000",
                    webRoot = "${workspaceFolder}",
                    userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
                }
            }
        end
    end,
}
