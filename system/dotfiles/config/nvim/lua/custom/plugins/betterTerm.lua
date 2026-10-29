-- betterTerm.nvim
-- https://github.com/CRAG666/betterTerm.nvim
-- Alternative: toggleterm.nvim (https://github.com/akinsho/toggleterm.nvim) is also popular.

return {
	"CRAG666/betterTerm.nvim",
	event = "VeryLazy",
	opts = {
		-- Set the default shell to the user's shell
		shell = vim.o.shell,
		-- Open terminal in a horizontal split at the bottom
		-- height can be a number (lines) or a string (percentage)
		height = 0.3,
		-- Set to true if you want the terminal to be focused when opened
		focus_on_open = true,
		-- Set the direction: "horizontal", "vertical", "float", "tab"
		direction = "horizontal",
		-- Set the border style for floating terminals (if direction is float)
		-- border = "single",
		-- Highlight group for the terminal buffer
		-- highlights = {
		--   Normal = { guibg = "#1e1e1e" },
		--   NormalFloat = { guibg = "#1e1e1e" },
		-- },
	},
	config = function(_, opts)
		require("betterTerm").setup(opts)
		-- Optional: set up keybindings here or let the user set them in their keymaps
		-- Example:
		-- vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
	end,
}
