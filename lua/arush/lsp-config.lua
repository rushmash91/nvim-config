local lsp = require('lsp-zero')

lsp.preset('recommended')

-- Configure sumneko_lua (or another LSP if needed)
lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

lsp.setup_servers()
