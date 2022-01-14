local fn = vim.fn
local api = vim.api
local lsp = vim.lsp
local config = require("user.lsp.config")

local M = {}

M.setup = function()
	for _, sign in ipairs(config.signs.values) do
		fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	vim.diagnostic.config(config)
	lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, config.float)
	lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, config.float)
end

M.show_line_diagnostics = function()
	return vim.diagnostic.open_float(0, config.float)
end

local lsp_highlight_document = function(client)
	if client.resolved_capabilities.document_highlight then
		local augroup = [[
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]]
		api.nvim_exec(augroup, false)
	end
end

local lsp_keymaps = function(bufnr)
	local opts = { noremap = true, silent = true }
	local map = function(keys, command)
		api.nvim_buf_set_keymap(bufnr, "n", keys, command, opts)
	end

	map("K", "<CMD>lua vim.lsp.buf.hover()<CR>")
	map("gD", "<CMD>lua vim.lsp.buf.declaration()<CR>")
	map("gd", "<CMD>lua vim.lsp.buf.definition()<CR>")
	map("gi", "<CMD>lua vim.lsp.buf.implementation()<CR>")
	map("gr", "<CMD>lua vim.lsp.buf.references()<CR>")
	map("gl", '<CMD>lua require("user.lsp.handlers").show_line_diagnostics()<CR>')
	map("[d", '<CMD>lua vim.diagnostic.goto_prev({ border = "solid" })<CR>')
	map("]d", '<CMD>lua vim.diagnostic.goto_next({ border = "solid" })<CR>')
	map("<C-k>", "<CMD>lua vim.lsp.buf.signature_help()<CR>")
	map("<leader>q", "<CMD>lua vim.diagnostic.setloclist()<CR>")
	map("<leader>lr", "<CMD>lua vim.lsp.buf.rename()<CR>")
	-- api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<CMD>lua vim.lsp.buf.code_action()<CR>")
	-- api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<CMD>lua vim.diagnostic.open_float()<CR>")
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
	end
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

local status, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if not status then
	return
end

M.capabilities = cmp_lsp.update_capabilities(lsp.protocol.make_client_capabilities())

return M
