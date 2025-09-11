local options = {
  formatters_by_ft = {
    sh = { "beautysh" },
    bash = { "beautysh" },
    zsh = { "beautysh" },
    css = { "prettier" },
    html = { "prettier" },
    lua = { "stylua" },
    python = { "autoflake" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    cs = { "clang-format" },
    json = { "prettier" },
    jsonc = { "prettier" },
    javascript = { "prettier" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
