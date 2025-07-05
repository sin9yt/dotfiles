return {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = { "UIEnter" },
    dependencies = {
        "tpope/vim-fugitive",
    },

    config = function ()
        require("gitsigns").setup{
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local opts = { buffer = bufnr }

                -- Navigation
                vim.keymap.set("n", "]c", function()
                    if vim.wo.diff then
                        return "]c"
                    end
                    vim.schedule(function() gs.next_hunk() end)
                    return "<Ignore>"
                end, { expr = true, buffer = bufnr})

                vim.keymap.set("n", "[c", function()
                    if vim.wo.diff then
                        return "[c"
                    end
                    vim.schedule(function() gs.prev_hunk() end)
                    return "<Ignore>"
                end, { expr = true , buffer = bufnr })

                -- Actions
                vim.keymap.set("n", "<leader>gs", gs.stage_hunk, opts)
                vim.keymap.set("n", "<leader>gr", gs.reset_hunk, opts)
                vim.keymap.set("n", "<leader>gu", gs.undo_stage_hunk, opts)

                vim.keymap.set("v", "<leader>gs", function()
                    gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, opts)
                vim.keymap.set("v", "<leader>gr", function()
                    gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, opts)

                vim.keymap.set("n", "<leader>gS", gs.stage_buffer, opts)
                vim.keymap.set("n", "<leader>gR", gs.reset_buffer, opts)

                vim.keymap.set("n", "<leader>pi", gs.preview_hunk_inline, opts)
                vim.keymap.set("n", "<leader>ph", gs.preview_hunk, opts)

                vim.keymap.set("n", "<leader>td", gs.toggle_deleted, opts)
                vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame, opts)
                vim.keymap.set("n", "<leader>gb", function()
                    gs.blame_line({ full = true })
                end, opts)

                vim.keymap.set("n", "<leader>di", gs.diffthis)
                vim.keymap.set("n", "<leader>dI", function()
                    gs.diffthis("~1")
                end, opts)
            end
        }
    end
}
