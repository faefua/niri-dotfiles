require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd", "lua_ls", "ast_grep", "pylsp", "ts_ls" }
vim.lsp.enable(servers)
