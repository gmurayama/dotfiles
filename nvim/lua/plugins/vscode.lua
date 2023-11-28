if vim.g.vscode then
  return {
    { import = "lazyvim.plugins.extras.vscode" },
    { "folke/tokyonight.nvim", vscode = true },
    {
      "LazyVim/LazyVim",
      config = function(_, opts)
        opts.colorscheme = function()
          require("tokyonight").load()
        end
        require("lazyvim").setup(opts)
      end,
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      vscode = true,
    },
    { "echasnovski/mini.indentscope", vscode = true },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = { highlight = { enable = true } },
    },
  }
else
  return {}
end
