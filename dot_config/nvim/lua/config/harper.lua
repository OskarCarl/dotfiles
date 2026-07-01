-- General LSP setup
vim.lsp.config['*'] = {
    capabilities = { textDocument = { semanticTokens = { multilineTokenSupport = true } } },
    root_markers = { '.git' },
}
vim.diagnostic.config({ virtual_lines = true })

-- Harper specific setup
vim.lsp.config['harper'] = {
    cmd = { 'harper-ls', '--stdio' },
    filetypes = { 'markdown', 'text', 'tex', 'typst' }
}
vim.lsp.enable('harper')

