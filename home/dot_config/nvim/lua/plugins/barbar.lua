return {
  {
    "romgrk/barbar.nvim",
    event = "VeryLazy",
    dependencies = {
      "lewis6991/gitsigns.nvim"
    },
    opts = {
    },
    config = function(_, opts)
      require("barbar").setup(opts)
    end
  }
}
