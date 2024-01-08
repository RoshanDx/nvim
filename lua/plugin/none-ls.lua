local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.diagnostics.eslint_d,

		null_ls.builtins.code_actions.gomodifytags,
		null_ls.builtins.code_actions.impl,
		null_ls.builtins.formatting.goimports_reviser,
		null_ls.builtins.formatting.gofumpt,
	},

	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})

local mason_null_ls = require("mason-null-ls")

mason_null_ls.setup({
	ensure_installed = {
		"goimports",
		"gomodifytags",
		"gofumpt",
		"goimports_reviser",
	},
})

vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
