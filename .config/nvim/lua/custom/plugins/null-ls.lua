local present, null_ls = pcall(require, "null-ls")
if not present then
  return
end

local b = null_ls.builtins
local sources = {
  b.formatting.prettier,
  b.formatting.stylua,
  b.formatting.black,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local function on_attach(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { bufnr = bufnr }
      end,
    })
  end
end

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = on_attach,
}
