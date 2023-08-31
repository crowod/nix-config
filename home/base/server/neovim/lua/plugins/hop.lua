return {
    {
        "phaazon/hop.nvim",
        name = "hop",
        config = function()
            require 'hop'.setup {
                keys = 'etovxqpdygfblzhckisuran',
                jump_on_sole_occurrence = {
                    s = "<leader>",
                    l = "<leader>",
                }
            }
        end,
        keys = {
            {
                "<Leader>s",
                mode = { "n" },
                function ()
                    require("hop").hint_char1()
                end, {remap = true}
            },
            {
                "<Leader><Leader>s",
                mode = { "n" },
                function ()
                    require("hop").hint_char2()
                end, {remap = true}
            },
            {
                "<Leader>w",
                mode = { "n" },
                function ()
                    require("hop").hint_words()
                end, {remap = true}
            },
            {
                "<Leader>l",
                mode = { "n" },
                function ()
                    require("hop").hint_vertical()
                end, {remap = true}
            },
        }
    }
}
