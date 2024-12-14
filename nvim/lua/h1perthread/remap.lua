vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<space>-", require("oil").toggle_float)

-- Function to wrap symbols
local function wrap_with(symbol, closing_symbol)
    -- Insert the symbol at the cursor position
    vim.api.nvim_put({symbol}, '', false, true)

    -- Move the cursor to the end of the current word and insert the closing symbol
    vim.cmd('normal! e')
    vim.api.nvim_put({closing_symbol}, '', true, true)

    -- Move the cursor back inside the symbols
    vim.cmd('normal! i')
end

-- Register the function globally so it can be called from a keymap
_G.wrap_with = wrap_with

-- Mapping the wrap function to keys using <Cmd>
vim.api.nvim_set_keymap('n', '<leader>{', "<Cmd>lua wrap_with('{', '}')<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>(', "<Cmd>lua wrap_with('(', ')')<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>[', "<Cmd>lua wrap_with('[', ']')<CR>", {noremap = true, silent = true})

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

-- Get lsp help for var, object, package, etc.
vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })

-- Get error msg as hover if not fully visible
vim.keymap.set('n', '<leader>e', '<cmd> lua vim.diagnostic.open_float(nil, {focus=false})<CR>',
    { noremap=true, silent=true, desc="Show diagnostics" })

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

-- Yank text into host clipboard using C-y
vim.api.nvim_set_keymap('v', '<C-y>', '""+y', {noremap = true, silent = true})
