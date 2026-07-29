local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

local dapui_status_ok, dapui = pcall(require, "dapui")
if not dapui_status_ok then
  return
end

dapui.setup()

local virtual_text_status_ok, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if virtual_text_status_ok then
  dap_virtual_text.setup()
end

local dap_python_status_ok, dap_python = pcall(require, "dap-python")
if dap_python_status_ok then
  -- adapter interpreter: one mason-managed debugpy shared across all
  -- projects, same model VS Code/PyCharm use (bundled debugger, not a
  -- project dependency). dap-python separately auto-detects VIRTUAL_ENV/
  -- ./.venv to pick the interpreter that actually runs your code.
  local mason_debugpy = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
  dap_python.setup(mason_debugpy)
end

local vscode_js_status_ok, dap_vscode_js = pcall(require, "dap-vscode-js")
if vscode_js_status_ok then
  dap_vscode_js.setup({
    debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
    adapters = { "pwa-node" },
  })

  local js_languages = { "typescript", "javascript", "typescriptreact", "javascriptreact" }
  for _, language in ipairs(js_languages) do
    dap.configurations[language] = {
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach to process on :9229",
        port = 9229,
        address = "localhost",
        restart = true,
        sourceMaps = true,
        cwd = "${workspaceFolder}",
        skipFiles = { "<node_internals>/**", "**/node_modules/**" },
      },
    }
  end
end

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require('dap').continue()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require('dap').step_over()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require('dap').step_into()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require('dap').step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require('dap').repl.toggle()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", opts)
