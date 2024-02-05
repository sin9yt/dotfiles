-- Initializes in order

require("sin9yt.remap")
require("sin9yt.set")
require("sin9yt.lazy_init")

-- Highlight on yank
local yank_group = vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function ()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            desc = "Highlight Yanked Text",
        })
    end
})
