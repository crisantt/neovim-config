return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "gopls", "lua_ls" }
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lsp = require("vim.lsp")
			lsp.enable("lua_ls")
			lsp.enable("gopls")
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action, {})

			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('my.lsp', {}),
				callback = function(args)
					local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
					if client:supports_method('textDocument/implementation') then
						-- Create a keymap for vim.lsp.buf.implementation ...
					end

					-- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
					if client:supports_method('textDocument/completion') then
						-- Optional: trigger autocompletion on EVERY keypress. May be slow!
						-- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
						-- client.server_capabilities.completionProvider.triggerCharacters = chars

						vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
					end

					-- Auto-format ("lint") on save.
					-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
					if not client:supports_method('textDocument/willSaveWaitUntil')
							and client:supports_method('textDocument/formatting') then
						vim.api.nvim_create_autocmd('BufWritePre', {
							group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
							buffer = args.buf,
							callback = function()
								vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
							end,
						})
					end
				end,
			})
		end
	}
}
