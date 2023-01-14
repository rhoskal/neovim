-- Plugin: null-ls
-- https://github.com/jose-elias-alvarez/null-ls.nvim

local status_ok, null = pcall(require, "null-ls")
if not status_ok then
  return
end

local formatters = null.builtins.formatting
local linters = null.builtins.diagnostics

null.setup {
  debug = false,
  on_attach = function(client)
    if client.server_capabilities.document_formatting then
      vim.cmd([[
        augroup LspFormatting
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
        augroup END
      ]])
    end
  end,
  sources = {
    formatters.elm_format,
    formatters.mix,
    formatters.nixfmt,
    formatters.prettier,
    linters.credo,
    linters.eslint,
  },
}
