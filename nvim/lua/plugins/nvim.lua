if not vim.g.vscode then
  return {
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.dap.core" },
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
      "nvim-telescope/telescope.nvim",
      opts = {
        pickers = {
          live_grep = {
            additional_args = function(_)
              return { "--hidden" }
            end,
          },
        },
      },
    },
  }
end
