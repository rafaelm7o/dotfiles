return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = {
    },
    opts = {
    },
    config = function(_, opts)
      vim.o.timeout = true
      vim.o.timeoutlen = 600
      require("which-key").setup(opts)
    end
  }
}
