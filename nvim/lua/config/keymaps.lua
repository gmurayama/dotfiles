-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

if vim.g.vscode then
  vim.keymap.del("n", "<S-h>")
  vim.keymap.del("n", "<S-l>")
  vim.keymap.del("n", "[b")
  vim.keymap.del("n", "]b")
  vim.keymap.del("n", "<leader>bb")
  vim.keymap.del("n", "<leader>`")
else
  vim.keymap.set("n", "]<tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Tab" })
  vim.keymap.set("n", "[<tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Prev Tab" })

  -- Switch commands to move between windows and resize window
  vim.keymap.del("n", "<C-h>")
  vim.keymap.del("n", "<C-j>")
  vim.keymap.del("n", "<C-k>")
  vim.keymap.del("n", "<C-l>")
  vim.keymap.del("n", "<C-Left>")
  vim.keymap.del("n", "<C-Down>")
  vim.keymap.del("n", "<C-Up>")
  vim.keymap.del("n", "<C-Right>")

  vim.keymap.set("n", "<C-Left>", "<C-w>h", { desc = "Go to left window", remap = true })
  vim.keymap.set("n", "<C-Down>", "<C-w>j", { desc = "Go to lower window", remap = true })
  vim.keymap.set("n", "<C-Up>", "<C-w>k", { desc = "Go to upper window", remap = true })
  vim.keymap.set("n", "<C-Right>", "<C-w>l", { desc = "Go to right window", remap = true })

  vim.keymap.set("n", "<C-k>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
  vim.keymap.set("n", "<C-j>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
  vim.keymap.set("n", "<C-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
  vim.keymap.set("n", "<C-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

  -- Debugger
  vim.keymap.set("n", "<F11>", "<leader>di", { desc = "Step into", remap = true })
  vim.keymap.set("n", "<F10>", "<leader>dO", { desc = "Step over", remap = true })
end
