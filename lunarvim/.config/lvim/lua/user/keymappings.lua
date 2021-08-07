lvim.leader = "space"

lvim.keys.normal_mode = {}

lvim.keys.normal_mode["Y"] = "y$"
lvim.keys.normal_mode["<Tab>"] = "<cmd>BufferNext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = "<cmd>BufferPrevious<CR>"
lvim.keys.normal_mode["<S-x>"] = "<cmd>BufferDelete<CR>"

lvim.builtin.which_key.mappings = {
	b = {
		name = "Buffers",
		n = { "<cmd>BufferNext<CR>", "Buffer Next" },
		p = { "<cmd>BufferPrevious<CR>", "Buffer Previous" },
		d = { "<cmd>BufferDelete<CR>", "Buffer Delete" },
		j = { "<cmd>BufferPick<CR>", "Buffer Pick" },
		l = { "<cmd>BufferLast<CR>", "Buffer Last" },
	},
	w = {
		name = "Windows",
		h = { "<C-w>h", "Window Left" },
		j = { "<C-w>j", "Window Down" },
		k = { "<C-w>k", "Window Up" },
		l = { "<C-w>l", "Window Right" },
		s = { "<C-w>s", "Window Split" },
		v = { "<C-w>v", "Window Vertical Split" },
	},
	f = {
		name = "Files",
		f = { "<cmd>Telescope find_files<CR>", "Find Files" },
		g = { "<cmd>Telescope git_files<CR>", "Find Git Files" },
		r = { "<cmd>Telescope oldfiles<CR>", "Find Recent Files" },
		w = { "<cmd>Telescope live_grep<CR>", "Find Word In File" },
	},
	o = {
		name = "Toggle/Open",
		e = { "<cmd>lua require'core.nvimtree'.toggle_tree()<CR>", "Toggle NvimTree" },
		z = { "<cmd>ZenMode<CR>", "Zen Mode" },
	},

	s = {
		name = "Sessions",
		s = { "<cmd>SessionSave<CR>", "Session Save" },
		l = { "<cmd>SessionLoad<CR>", "Session Load" },
	},

	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		d = {
			"<cmd>Telescope lsp_document_diagnostics<cr>",
			"Document Diagnostics",
		},
		w = {
			"<cmd>Telescope lsp_workspace_diagnostics<cr>",
			"Workspace Diagnostics",
		},
		-- f = { "<cmd>silent FormatWrite<cr>", "Format" },
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		j = {
			"<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
			"Prev Diagnostic",
		},
		p = {
			name = "Peek",
			d = { "<cmd>lua require('lsp.peek').Peek('definition')<cr>", "Definition" },
			t = { "<cmd>lua require('lsp.peek').Peek('typeDefinition')<cr>", "Type Definition" },
			i = { "<cmd>lua require('lsp.peek').Peek('implementation')<cr>", "Implementation" },
		},
		q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
	},
}
