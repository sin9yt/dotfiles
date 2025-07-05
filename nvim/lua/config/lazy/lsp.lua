return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "j-hui/fidget.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        require("fidget").setup({})


        ON_ATTACH = function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }
            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "nd", function()
                vim.lsp.buf.definition()
            end, opts)
            vim.keymap.set("n", "K", function()
                vim.lsp.buf.hover()
            end, opts)
            vim.keymap.set("n", "<leader>lss", function()
                builtin.lsp_document_symbols({})
            end, opts)
            vim.keymap.set("n", "<leader>lws", function()
                builtin.lsp_workspace_symbols({ query = vim.fn.input("Query: ") })
            end, opts)
            vim.keymap.set("n", "<leader>ld", function()
                vim.diagnostic.open_float()
            end, opts)
            vim.keymap.set("n", "<leader>lca", function()
                vim.lsp.buf.code_action()
            end, opts)
            vim.keymap.set("n", "<leader>lrr", function()
                vim.lsp.buf.references()
            end, opts)
            vim.keymap.set("n", "<leader>lrn", function()
                vim.lsp.buf.rename()
            end, opts)
            vim.keymap.set("i", "<C-h>", function()
                vim.lsp.buf.signature_help()
            end, opts)

            -- highlight references depends on lsp capabilities
            if client.server_capabilities.documentHighlightProvider then
                vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
                vim.api.nvim_clear_autocmds({ buffer = bufnr, group = "lsp_document_highlight" })
                vim.api.nvim_create_autocmd("CursorHold", {
                    callback = vim.lsp.buf.document_highlight,
                    buffer = bufnr,
                    group = "lsp_document_highlight",
                    desc = "Document Highlight",
                })
                vim.api.nvim_create_autocmd("CursorMoved", {
                    callback = vim.lsp.buf.clear_references,
                    buffer = bufnr,
                    group = "lsp_document_highlight",
                    desc = "Clear All the References",
                })
            end
        end

        -- vim diagnostics
        vim.diagnostic.config({
            update_in_insert = true,
            virtual_text = true,
        })

        -- mason lsp servers setup
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                "rust_analyzer",
            },
        })

        -- native lsp server setup
        vim.lsp.config("*", { -- default handler
            capabilities = capabilities,
            on_attach = ON_ATTACH,
        })

        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            on_attach = ON_ATTACH,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        })

        -- linters, formatters and DAP tool installers
        require("mason-tool-installer").setup({
            ensure_installed = {
                "prettier", -- prettier formatter
                "stylua",   -- lua formatter
                "isort",    -- python formatter
                "black",    -- python formatter
                "ruff",   -- python linter
            },
        })
    end,
}
