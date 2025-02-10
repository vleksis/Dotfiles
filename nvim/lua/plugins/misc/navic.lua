return {
  {
    "SmiteshP/nvim-navic",
    dependencies = {
      "neovim/nvim-lspconfig"
    },
    opts = {
      icons = {
        File          = "󰈙 ",
        Module        = " ",
        Namespace     = "(Namespace) ",
        Package       = " ",
        Class         = "(Class) ",
        Method        = "󰆧 ",
        Property      = " ",
        Field         = " ",
        Constructor   = " ",
        Enum          = "(Enum) ",
        Interface     = "󰕘",
        Function      = "󰊕 ",
        Variable      = "󰆧 ",
        Constant      = "󰏿 ",
        String        = "󰀬 ",
        Number        = "󰎠 ",
        Boolean       = "◩ ",
        Array         = "󰅪 ",
        Object        = "󰅩 ",
        Key           = "󰌋 ",
        Null          = "󰟢 ",
        EnumMember    = " ",
        Struct        = "(Struct) ",
        Event         = " ",
        Operator      = "󰆕 ",
        TypeParameter = "󰊄 ",
      },
      highlight = true,
      separator = " >>> ",
      depth_limit = 0,
      depth_limit_indicator = "..",
    },
  }
}
