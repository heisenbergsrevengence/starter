local base = require("config.lspconfig")
local client = require("vim.lsp.client")
local on_attach = base.on_attach
local capabilities = base.capabilities
local lspconfig = require("lspconfig")

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
