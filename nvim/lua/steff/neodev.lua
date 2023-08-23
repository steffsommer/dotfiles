-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
  library = {
    enabled = true,
    runtime = true,
    types = true,
    plugins = true,
  },
  setup_jsonls = true,
  lspconfig = true,
  pathStrict = true,
})
