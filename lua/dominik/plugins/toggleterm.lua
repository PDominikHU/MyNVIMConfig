return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })

    local Terminal = require("toggleterm.terminal").Terminal

    local lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = "float",
      float_opts = {
        border = "none",
        width = 100000,
        height = 100000,
      },
      on_open = function(_)
        vim.cmd("startinsert!")
      end,
      on_close = function(_)
      end,
      count = 99,
    })

    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end

    vim.keymap.set("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { desc = "LazyGit" })
    vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Terminal float" })
    vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "Terminal horizontal" })
    vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "Terminal vertical" })
  end,
}
