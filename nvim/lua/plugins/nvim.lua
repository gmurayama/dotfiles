if vim.g.vscode then
  return {}
end

return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
      },
    },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      scroll = { enabled = false },
    },
  },
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
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_z = {},
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "itchyny/vim-qfedit",
  },
  {
    "ibhagwan/fzf-lua",
    opts = {
      grep = {
        hidden = true,
        rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -g '!.git/' -e",
      },
    },
  },
}
