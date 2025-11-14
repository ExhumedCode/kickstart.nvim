-- ~/.config/nvim/lua/custom/keymaps.lua
vim.api.nvim_set_keymap('n', '<leader>z', ':w<bar>!zig run %<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>j', ':w<bar>!javac % && java %:r<CR>', { noremap = true, silent = true })
-- compile & run C++: <Space>c
vim.api.nvim_set_keymap('n', '<leader>c', ':w<bar>!g++ -std=c++17 % -o %:r && ./%:r<CR>', { noremap = true, silent = true })
-- compile & run C with CS50 library: <leader>cc (static linking)
vim.api.nvim_set_keymap('n', '<leader>cc', ':w<bar>!gcc -Wall -Wextra -Werror -std=c11 % -o %:r /usr/local/lib/libcs50.a -lm && ./%:r<CR>', { noremap = true, silent = false })
-- C# (.NET SDK): <leader>cs
vim.api.nvim_set_keymap(
  'n',
  '<leader>cs',
  -- save file, then run `dotnet run` in the current folder
  ':w<bar>!dotnet run<CR>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap('n', '<leader>p', ':w<bar>!python3 %<CR>', { noremap = true, silent = false })
