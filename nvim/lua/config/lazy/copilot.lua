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

        -- add spinner animation during model thinking
        local spinner = require("config.lazy.helper.fidget-spinner")
        spinner:init()

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
            display = {
                chat = {
                    intro_message = "Hi Copilot here!✨ Press ? for options",
                    show_settings = true,
                },
                inline = {
                    layout = "buffer", -- vertical|horizontal|buffer
                },
            },
            keymaps = {
                send = {
                    callback = function(chat)
                        vim.cmd("stopinsert")
                        chat:submit()
                        chat:add_buf_message({ role = "llm", content = "" })
                    end,
                    index = 1,
                    description = "Send",
                },
            },
        })

        -- keymaps
        vim.keymap.set("n", "<leader>ct", codecompanion.toggle, {})
        vim.keymap.set("n", "<leader>cc", codecompanion.chat, {})
        vim.keymap.set("n", "<leader>ca", codecompanion.actions, {})
    end,
}
