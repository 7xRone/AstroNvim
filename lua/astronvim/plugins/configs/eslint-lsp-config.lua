
local lspconfig = require 'lspconfig'
local eslint = require 'eslint-lsp'

lspconfig.eslint.setup{
  settings = {
    languages = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
    autoFixOnSave = true,
  }
}

