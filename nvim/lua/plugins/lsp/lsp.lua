return {
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'williamboman/mason-lspconfig.nvim' },
    config = function()
      local lspconfig = require('lspconfig')
      require('mason-lspconfig').setup()
      require('mason-lspconfig').setup_handlers {
        function(server_name)
          lspconfig[server_name].setup {}
        end,
      }
    end,
  }
}
