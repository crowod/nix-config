-- define common options
local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ","

-----------------
-- Normal mode --
-----------------
keymap('n', '<C-s>', ':w<CR>', opts);
keymap('n', '<Leader>q', ':q!<CR>', opts);
keymap('n', '<Leader>qa', ':qa!<CR>', opts);
keymap('n', '<Leader>wq', ':wq!<CR>', opts);
keymap('n', '<Leader>c', '<C-w>c', opts);

-----------------
-- Visual mode --
-----------------
keymap('v', '<Leader>y', '"+y', opts)
keymap('v', '<Leader>j.', [[:!jq '.'<CR>]], opts)
keymap('v', '<Leader>jf', [[:!jq '. | fromjson'<CR>]], opts)
keymap('v', '<Leader>jt', [[:!jq '. | tojson'<CR>]], opts)

-----------------
-- VS Code --
-----------------
if vim.g.vscode then
    keymap('n', '<Leader>gi', "<Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>", {})
end