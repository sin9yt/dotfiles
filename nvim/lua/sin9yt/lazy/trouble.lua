return {
	"folke/trouble.nvim",
	config = function()
		require("trouble").setup({
			opts = {},
			cmd = "Trouble",
            focus = true,
			auto_close = true,
		})

		local trouble = require("trouble")

		vim.keymap.set("n", "<leader>tt", function()
			trouble.toggle("diagnostics")
		end)

		vim.keymap.set("n", "]d", function()
			trouble.next("diagnostics")
		end)

		vim.keymap.set("n", "[d", function()
			trouble.prev("diagnostics")
		end)
	end,
}
