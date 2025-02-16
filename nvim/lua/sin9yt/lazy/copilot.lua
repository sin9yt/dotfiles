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
            keys = {
                ["<leader>cc"] = "toggle",
                ["<leader>ca"] = "code_actions",
                ["<leader>ct"] = "generate_tests",
                ["<leader>cr"] = "review_code",
                ["<leader>ce"] = "explain_code",
                ["<leader>cs"] = "suggest_code",
            },
        })

        -- keymaps
        vim.keymap.set("n", "<leader>ct", codecompanion.toggle, {})
        vim.keymap.set("n", "<leader>cc", codecompanion.chat, {})
    end,
}
