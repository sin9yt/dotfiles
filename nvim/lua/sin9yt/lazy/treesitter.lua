return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },

    config = function()
        -- import nvim-treesitter plugin
        local treesitter = require("nvim-treesitter.configs")

        -- configure treesitter
        treesitter.setup({ -- enable syntax highlighting
            highlight = {
                enable = false,
            },
            -- enable indentation
            indent = { enable = true },
            -- ensure these language parsers are installed
            ensure_installed = {
                "json",
                "javascript",
                "python",
                "rust",
                "tsx",
                "yaml",
                "html",
                "markdown",
                "markdown_inline",
                "graphql",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        })

    end
}
