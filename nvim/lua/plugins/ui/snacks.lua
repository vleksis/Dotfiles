return {
  {
    "snacks.nvim",
    opts = {
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = false }, -- we set this in options.lua
      toggle = { map = vim.keymap.set },
      words = { enabled = true },
    },
    -- stylua: ignore
    keys = {
      { "<leader>nh", function() Snacks.picker.notifications() end, desc = "Notification History" },
      { "<leader>nd", function() Snacks.notifier.hide() end,        desc = "Dismiss All Notifications" },
      { "<leader>nt", function() Snacks.picker.notifications() end, desc = "Notification Picker" },
    },
  }
}
