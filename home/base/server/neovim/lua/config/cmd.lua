vim.cmd([[
    " Excel data cleanup function
    " Removes ^M characters, sorts and deduplicates
    function! ExcelCleanup()
        " Remove ^M (carriage return) characters
        %s/\r$//ge
        " Remove empty lines (use silent to suppress errors)
        silent! %g/^\s*$/d
        " Remove trailing whitespace
        silent! %s/\s\+$//e
        " Sort and remove duplicates
        sort u
        echo "Excel data cleaned, sorted and deduplicated!"
    endfunction

    " Create command for easy access
    command! ExcelClean call ExcelCleanup()
]])
