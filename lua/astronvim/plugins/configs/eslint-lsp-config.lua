

return function(_, _)
  local setup_servers = function()
    local eslint = {
      lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
      lintStdin = true,
      lintFormats = {"%f:%l:%c: %m"},
      lintIgnoreExitCode = true,
      formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
      formatStdin = true
    }

    local null_ls = require("null-ls")
    null_ls.config({
      sources = { null_ls.builtins.diagnostics.eslint.with(eslint) },
    })

    require("lspconfig")["null-ls"].setup({})
  end

  local astrocore = require "astrocore"
  if astrocore.is_available "mason-lspconfig.nvim" then
    astrocore.on_load("mason-lspconfig.nvim", setup_servers)
  else
    setup_servers()
  end
end

