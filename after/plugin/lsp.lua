local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = { 'jedi_language_server', 'lua_ls', 'jsonls', 'helm_ls', 'gopls', 'dockerls', 'bashls', 'marksman', 'sqlls', 'hydra_lsp'},
  handlers = {
    lsp_zero.default_setup,
  }
})
