return {
  "rest-nvim/rest.nvim",
  ft = "http",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("rest-nvim").setup({
      result_split_horizontal = false,
      result_split_in_place = false,
      skip_ssl_verification = false,
      encode_url = true,
      highlight = {
        enabled = true,
        timeout = 150,
      },
      result = {
        show_url = true,
        show_http_info = true,
        show_headers = true,
        formatters = {
          json = "jq",
          html = function(body)
            return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
          end,
        },
      },
    })

    vim.keymap.set("n", "<leader>rr", "<Plug>RestNvim", { desc = "Run REST request" })
    vim.keymap.set("n", "<leader>rp", "<Plug>RestNvimPreview", { desc = "Preview REST request" })
    vim.keymap.set("n", "<leader>rl", "<Plug>RestNvimLast", { desc = "Re-run last REST request" })
  end,
}
