return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "│" },
      change = { text = "│" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "┆" },
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      map("n", "]h", function()
        if vim.wo.diff then
          return "]h"
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<Ignore>"
      end, { expr = true, desc = "Next git hunk" })

      map("n", "[h", function()
        if vim.wo.diff then
          return "[h"
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<Ignore>"
      end, { expr = true, desc = "Previous git hunk" })

      map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview git hunk" })
      map("n", "<leader>gb", gs.blame_line, { desc = "Git blame line" })
      map("n", "<leader>gr", gs.reset_hunk, { desc = "Reset git hunk" })
      map("n", "<leader>gd", gs.diffthis, { desc = "Git diff" })
    end,
  },
}
