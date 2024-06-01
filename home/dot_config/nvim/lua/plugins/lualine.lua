return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
    },
    opts = {
      options = {
        theme = 'dracula',
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = ''}
      }
    },
    config = function(_, opts)
      require("lualine").setup(opts)
    end
  }
}
