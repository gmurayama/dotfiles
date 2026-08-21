local lazyvim = {
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

local custom = {
  {
    "itchyny/vim-qfedit",
  },
}

return {
  unpack(lazyvim),
  unpack(custom),
}
