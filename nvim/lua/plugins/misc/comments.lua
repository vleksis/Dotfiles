return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    keys = {
      { "]t",         function() require("todo-comments").jump_next() end,              desc = "Next Todo Comment" },
      { "[t",         function() require("todo-comments").jump_prev() end,              desc = "Previous Todo Comment" },
      { "<leader>xt", "<cmd>Trouble todo toggle<cr>",                                   desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>",                                         desc = "Todo" },
      { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",                 desc = "Todo/Fix/Fixme" },
    },

    opts = {
      signs = true, -- show icons in the sign column
      keywords = {
        FIX  = { icon = " ", color = "error" },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning" },
        PERF = { icon = " ", color = "warning" },
        NOTE = { icon = " ", color = "hint" },
        TEST = { icon = "⏲ ", color = "test" },
      },

      highlight = {
        multiline = true,               -- enable multine todo comments
        multiline_pattern = "^.",       -- lua pattern to match the next multiline from the start of the matched keyword
        multiline_context = 10,         -- extra lines that will be re-evaluated when changing a line
        before = "",                    -- "fg" or "bg" or empty
        keyword = "bg",               -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        after = "fg",                     -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*]], -- pattern or table of patterns, used for highlighting (vim regex)
        comments_only = true,           -- uses treesitter to match keywords in comments only
        max_line_len = 400,             -- ignore lines longer than this
        exclude = {},                   -- list of file types to exclude highlighting
      },

      merge_keywords = true,

    }
  },
}
