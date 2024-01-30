return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "j-hui/fidget.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        require("fidget").setup({})

        -- vim diagnostics
        vim.diagnostic.config({
            update_in_insert = true,
            virtual_text = true
        })

        -- mason lsp servers setup
        require("mason").setup()
        require("mason-lspconfig").setup {
            ensure_installed = {
                "lua_ls",
                "pyright",
                "rust_analyzer"
            },
            handlers = {
                function (server_name) -- default handler
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function ()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        }
                    }
                end,
            },
        }
    end
}
