return {
	'mfussenegger/nvim-lint',
	config = function()
		require('lint').linters_by_ft = {
			lua = { 'luacheck' }, -- Use 'eslint' for JS, 'luacheck' for Lua, etc.
			go = { 'golangci-lint' },
		}

		-- Automatically lint on file save
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end
}
