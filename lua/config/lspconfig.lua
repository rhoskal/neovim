-- Plugin: nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig

local status_ok, nvim_lsp = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local on_attach = function(_client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local flags = {
  debounce_text_changes = 150,
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls
nvim_lsp.bashls.setup {
  flags = flags,
  on_attach = on_attach,
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#dockerls
nvim_lsp.dockerls.setup {
  flags = flags,
  on_attach = on_attach,
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#elixirls
nvim_lsp.elixirls.setup {
  flags = flags,
  on_attach = on_attach,
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#elmls
nvim_lsp.elmls.setup {
  flags = flags,
  on_attach = on_attach,
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonls
nvim_lsp.jsonls.setup {
  flags = flags,
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
          description = "Package config",
          fileMatch = {
            "package.json",
          },
          url = "https://json.schemastore.org/package",
        },
      },
    },
  },
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
nvim_lsp.sumneko_lua.setup {
  flags = flags,
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
        globals = { "vim", "describe", "use", "packer_plugins" },
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
  flags = flags,
  on_attach = on_attach,
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
nvim_lsp.tsserver.setup {
  flags = flags,
  on_attach = on_attach,
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#yamlls
nvim_lsp.yamlls.setup {
  flags = flags,
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
