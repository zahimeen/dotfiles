local M = {
	"ahmedkhalf/project.nvim",
	event = "VeryLazy",
}

function M.config()
	require("project_nvim").setup({
		manual_mode = true,
		silent_chdir = false,
		detection_methods = { "pattern", "lua" },
		patterns = { ".editorconfig", ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pom.xml" },
	})

	vim.keymap.set("n", "<leader>p", "<cmd>ProjectRoot<cr>")

	local exists, telescope = pcall(require, "telescope")
	if exists then
		telescope.load_extension("projects")
		vim.keymap.set("n", "<leader>fp", telescope.extensions.projects.projects)
	end
end

return M
