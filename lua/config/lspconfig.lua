-- Plugin: nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig

local status_lsp_ok, nvim_lsp = pcall(require, "lspconfig")
local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not (status_lsp_ok or status_cmp_ok) then
  return
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = cmp_nvim_lsp.update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
capabilities.textDocument.completion.completionItem.deprecatedSupport = true

vim.diagnostic.config({
  virtual_text = false,
})

local on_attach = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Avoid formatting conflicts with null-ls
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
end

local flags = {
  debounce_text_changes = 150,
}

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls
nvim_lsp.bashls.setup {
  flags = flags,
  handlers = handlers,
  on_attach = on_attach,
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls
nvim_lsp.cssls.setup {
  flags = flags,
  handlers = handlers,
  on_attach = on_attach,
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dockerls
nvim_lsp.dockerls.setup {
  flags = flags,
  handlers = handlers,
  on_attach = on_attach,
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#elixirls
nvim_lsp.elixirls.setup {
  capabilities = capabilities,
  cmd = { "/Users/hansy/.elixir-ls/language_server.sh" },
  filetypes = {
    "elixir",
    "eelixir",
    "heex",
  },
  flags = flags,
  handlers = handlers,
  on_attach = on_attach,
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#elmls
nvim_lsp.elmls.setup {
  capabilities = capabilities,
  flags = flags,
  handlers = handlers,
  on_attach = on_attach,
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#hls
nvim_lsp.hls.setup {
  capabilities = capabilities,
  flags = flags,
  handlers = handlers,
  on_attach = on_attach,
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html
nvim_lsp.html.setup {
  flags = flags,
  handlers = handlers,
  on_attach = on_attach,
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonls
nvim_lsp.jsonls.setup {
  flags = flags,
  handlers = handlers,
  on_attach = on_attach,
  settings = {
    json = {
      format = {
        enabled = true,
      },
      schemas = {
        {
          description = "ESLint config",
          fileMatch = {
            ".eslintrc.json",
            ".eslintrc",
          },
          url = "http://json.schemastore.org/eslintrc",
        },
        {
          description = "NPM config",
          fileMatch = {
            "package.json",
          },
          url = "https://json.schemastore.org/package",
        },
        {
          description = "TypeScript compiler configuration file",
          fileMatch = {
            "tsconfig.json",
            "tsconfig.*.json",
          },
          url = "https://json.schemastore.org/tsconfig.json",
        },
      },
    },
  },
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
nvim_lsp.sumneko_lua.setup {
  capabilities = capabilities,
  flags = flags,
  handlers = handlers,
  on_attach = on_attach,
  settings = {
    Lua = {
      cmd = { "lua-language-server" },
      filetypes = { "lua" },
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";")
      },
      completion = {
        enable = true,
        callSnippet = "Both",
      },
      diagnostics = {
        enable = true,
        globals = {
          "vim",
          "describe",
          "use",
          "packer_plugins",
        },
        disable = { "lowercase-global" },
      },
      workspace = {
        library = {
          vim.api.nvim_get_runtime_file("", true),
          [ vim.fn.expand("$VIMRUNTIME/lua") ] = true,
          [ vim.fn.expand("$VIMRUNTIME/lua/vim/lsp") ] = true,
          [ vim.fn.expand("/usr/share/awesome/lib") ] = true,
        },
        -- adjust these two values if your performance is not optimal
        maxPreload = 2000,
        preloadFileSize = 1000,
      },
      telemetry = { enable = false }
    },
  },
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss
nvim_lsp.tailwindcss.setup {
  capabilities = capabilities,
  flags = flags,
  handlers = handlers,
  on_attach = on_attach,
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
nvim_lsp.tsserver.setup {
  capabilities = capabilities,
  flags = flags,
  handlers = handlers,
  on_attach = on_attach,
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#yamlls
nvim_lsp.yamlls.setup {
  flags = flags,
  handlers = handlers,
  on_attach = on_attach,
  settings = {
    yaml = {
      schemaStore = {
        enable = true,
        url = "https://www.schemastore.org/api/json/catalog.json",
      },
      schemas = {
        kubernetes = "/*.yaml",
        [ "http://json.schemastore.org/github-workflow" ] = ".github/workflows/*.{yml,yaml}",
        [ "http://json.schemastore.org/github-action" ] = ".github/action.{yml,yaml}",
        [ "http://json.schemastore.org/ansible-stable-2.9" ] = "roles/tasks/*.{yml,yaml}",
        [ "http://json.schemastore.org/prettierrc" ] = ".prettierrc.{yml,yaml}",
        [ "http://json.schemastore.org/kustomization" ] = "kustomization.{yml,yaml}",
        [ "http://json.schemastore.org/ansible-playbook" ] = "*play*.{yml,yaml}",
        [ "http://json.schemastore.org/chart" ] = "Chart.{yml,yaml}",
        [ "https://json.schemastore.org/dependabot-v2" ] = ".github/dependabot.{yml,yaml}",
        [ "https://json.schemastore.org/gitlab-ci" ] = "*gitlab-ci*.{yml,yaml}",
        [ "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json" ] = "*api*.{yml,yaml}",
        [ "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json" ] = "docker-compose.{yml,yaml}",
        [ "https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json" ] = "*flow*.{yml,yaml}",
      },
      format = {
        enabled = false,
        completion = true,
        hover = true,
      },
    },
  },
}
