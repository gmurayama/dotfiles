local lazyvim = {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_hidden = false,
          hide_by_name = { ".git", "node_modules" },
        },
      },
    },
  },
  {
    "folke/trouble.nvim",
    opts = {
      auto_preview = false,
    },
  },
}

local custom = {
  {

    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
    opts = {
      completions = {
        lsp = { enabled = true },
      },
    },
  },
}

return {
  unpack(lazyvim),
  unpack(custom),
}
