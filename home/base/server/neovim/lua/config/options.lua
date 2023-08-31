-- Hint: use `:h <option>` to figure out the meaning if needed
local options = {
    clipboard = "unnamedplus", -- use system clipboard
    mouse = "a", -- enable mouse support in all modes
    undofile = true, -- enable persistent undo
    ignorecase = true, -- ignore case when searching
    smartcase = true, -- use case-sensitive search if search query contains uppercase letters
    showmode = false, -- do not show current mode in the status line
    showtabline = 2, -- always show the tab bar
    smartindent = true, -- automatically indent new lines based on the previous line
    autoindent = true, -- automatically indent new lines based on the current line
    swapfile = true, -- enable swap file for crash recovery
    hidden = true, -- allow hiding unsaved buffers
    expandtab = false, -- use tabs instead of spaces for indentation
    cmdheight = 1, -- set the height of the command-line window to 1 row
    shiftwidth = 4, -- set the number of spaces for each indentation level when using the > and < commands
    tabstop = 4, -- set the number of spaces for each tab character
    cursorline = false, -- do not highlight the current line
    cursorcolumn = false, -- do not highlight the current column
    number = true, -- show line numbers
    numberwidth = 4, -- set the width of the line number column to 4 characters
    scrolloff = 8, -- set the number of lines to keep visible above and below the cursor
    fileencodings = "utf-8,gbk", -- set the file encodings to try when opening a file
    updatetime = 50, -- set the time in milliseconds for writing swap files and updating the status line
    foldenable = false, -- disable code folding
    foldlevel = 99, -- set the maximum fold level to 99
}

for k, v  in pairs(options) do
    vim.o[k] = v
end