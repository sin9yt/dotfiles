return {
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                graphql = { "prettier" },
                lua = { "stylua" },
                python = { "isort", "black" },
            },
            -- Disable format_on_save by default
            -- format_on_save = {
            -- 	lsp_fallback = true,
            -- 	async = false,
            -- 	timeout_ms = 1000,
            -- 	inherit = true,
            -- },
            formatters = {
                stylua = {
                    args = { "--indent-type", "Spaces", "--indent-width", "4" },
                },
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>mp", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}