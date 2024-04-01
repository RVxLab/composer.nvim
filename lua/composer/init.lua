local M = {}

---@param opts composer.Config
function M.setup(opts)
	require("composer.config").setup(opts)
	require("composer.commands").register()

	-- Debug command
	vim.api.nvim_create_user_command("Crlp", function()
		M.setup(opts)
		vim.notify("Reloaded")
	end, {
		nargs = 0,
	})
end

return M
