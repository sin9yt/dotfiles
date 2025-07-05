return {
    "olimorris/codecompanion.nvim",
    event = "VeryLazy", -- Load on very lazy event
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "github/copilot.vim",
        {
            "MeanderingProgrammer/render-markdown.nvim",
            ft = { "markdown", "codecompanion" }
        },
    },
    config = function ()
        local codecompanion = require("codecompanion")

        codecompanion.setup({
            adapters = {
                copilot = function()
                    return require("codecompanion.adapters").extend("copilot", {
                        schema = {
                            model = {
                                default = "gpt-4o",
                            },
                        },
                    })
                end,
            },
            strategies = {
                chat = {
                    adapter = "copilot",
                },
                inline = {
                    adapter = "copilot",
                },
            },
        })

        -- keymaps
        vim.keymap.set("n", "<leader>ct", codecompanion.toggle, {})
        vim.keymap.set("n", "<leader>cc", codecompanion.chat, {})
        vim.keymap.set("n", "<leader>ca", codecompanion.actions, {})
    end,
}
