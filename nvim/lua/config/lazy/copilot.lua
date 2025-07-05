return {
    "olimorris/codecompanion.nvim",
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
                                -- default = "claude-3.5-sonnet",
                                default = "gpt-4o-2024-08-06",
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
    end,
}
