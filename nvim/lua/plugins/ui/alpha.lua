return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    -- Set the header and the buttons for the Alpha dashboard
    dashboard.section.header.val = {
      "",
      "",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "",
      "",
    }

    -- Create the buttons including the "Choose Color Scheme" button
    dashboard.section.buttons.val = {
      dashboard.button("n", "  New File", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "󰈞  Find File", ":Telescope find_files <CR>"),
      dashboard.button("r", "  Recent Files", ":Telescope oldfiles <CR>"),
      dashboard.button("c", "  Config", ":Neotree dir=~/.config/nvim/ <CR>"),
      dashboard.button("s", "  Restore Session", [[<cmd>lua require("persistence").load({ last = true })<cr>]]),
      dashboard.button("C", "  Color Scheme", ":Namu colorscheme <CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
  end,
}
