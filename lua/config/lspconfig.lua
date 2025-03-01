local base = require("config.lspconfig")
local client = require("vim.lsp.client")
local on_attach = base.on_attach
local capabilities = base.capabilities
local lspconfig = require("lspconfig")

lspconfig.arduino_language_server.setup({
  cmd = {
    "arduino-language-server",
    "-clangd",
    "/bin/clang-11",
    "-cli",
    "/bin/arduino-cli",
    "-cli-config",
    "~/.config/arduino-ide/config.json",
  },
})

lspconfig.clangd.setup({
  on_attach = function(client, bufner)
    client.server_capabilities.signature_HelpProvider = false
    on_attach(client, bufner)
  end,
  settings = {
    clangd = {
      includePath = "usr/include",
      "${workspaceFolder}/**",
      -- Other settings...
    },
  },
})
