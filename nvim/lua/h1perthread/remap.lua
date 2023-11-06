vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- { Brackets (makes a newline and indent)
vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true })

-- ( Parentheses
vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true })

-- [ Brackets
vim.api.nvim_set_keymap('i', '[', '[]<Left>', { noremap = true })

-- " Double Quotes
vim.api.nvim_set_keymap('i', '"', '""<Left>', { noremap = true })

-- ' Single Quotes
vim.api.nvim_set_keymap('i', "'", "''<Left>", { noremap = true })

-- ` Backticks
vim.api.nvim_set_keymap('i', '`', '``<Left>', { noremap = true })

-- Move line or visual block up
vim.api.nvim_set_keymap('n', '<A-k>', ':move -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<A-k>', ':move -2<CR>gv', { noremap = true, silent = true })

-- Move line or visual block down
vim.api.nvim_set_keymap('n', '<A-j>', ':move +1<CR>', { noremap = true, silent = true })

-- Define a function to handle the find and replace
vim.api.nvim_exec([[
  function! FindReplacePrompt()
    let search_term = input("Find: ")
    let replace_term = input("Replace with: ")
    execute "%s/" . search_term . "/" . replace_term . "/g"
  endfunction
]], false)

vim.api.nvim_set_keymap('x', '<A-j>', ':move \'>+1<CR>gv', { noremap = true, silent = true })
-- Map the function to <leader>r
vim.api.nvim_set_keymap('n', '<leader>r', ':call FindReplacePrompt()<CR>', { noremap = true, silent = true })


-- In Visual mode, pressing Tab will indent the selection
vim.api.nvim_set_keymap('v', '<Tab>', '>gv', {noremap = true, silent = true})
-- In Visual mode, pressing Shift+Tab will un-indent the selection
vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', {noremap = true, silent = true})

-- In Normal mode, pressing Tab will indent the current line and stay on it
vim.api.nvim_set_keymap('n', '<Tab>', '>>_', {noremap = true, silent = true})
-- In Normal mode, pressing Shift+Tab will un-indent the current line and stay on it
vim.api.nvim_set_keymap('n', '<S-Tab>', '<<_', {noremap = true, silent = true})
