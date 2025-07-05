return {
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                keymaps = {
                    change = "rs",
                    change_line = "rS",
                },
            })
        end
    },
    {
        'rmagatti/auto-session',
        -- lazy = false,
        lazy_support = true,
        keys = {
            { '<leader>wr', '<cmd>SessionSearch<CR>', desc = 'Session search' },
            { '<leader>ws', '<cmd>SessionSave<CR>', desc = 'Save session' },
            { '<leader>wa', '<cmd>SessionToggleAutoSave<CR>', desc = 'Toggle autosave' },
        },
        opts = {
            suppressed_dirs = { '~/', '~/Downloads', '/' },
            -- log_level = 'debug',
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = { "UIEnter" },
        opts = {
            indent = { char = "▏" },
            scope = { show_start = false, show_end = false },
        },

    }
}
