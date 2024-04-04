local M = {
	"ahmedkhalf/project.nvim",
	event = "VeryLazy",
}

function M.config()
	require("project_nvim").setup({
		detection_methods = { "pattern", "lua" },
		patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pom.xml" },
	})

	local exists, telescope = pcall(require, "telescope")
	if exists then
		telescope.load_extension("projects")
		vim.keymap.set("n", "<leader>fp", telescope.extensions.projects.projects)
		vim.keymap.set("n", "<c-p>", "<cmd>ProjectRoot<cr>")
	end
end

return M
