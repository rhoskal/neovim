local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
    install_path
  })
end

-- don't throw any error on first use by packer
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  profile = {
    enable = true, -- enable profiling via :PackerCompile profile=true
    threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim"

  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("config/treesitter")
    end,
    run = ":TSUpdate",
  }

  use {
    "editorconfig/editorconfig-vim",
    config = function()
      require("config/editorconfig")
    end,
  }

  use {
    "neovim/nvim-lspconfig",
    config = function()
      require("config/lspconfig")
    end,
  }

  use {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("config/telescope")
    end,
    requires = {
      { "nvim-lua/plenary.nvim" },
    },
  }

  -- use {
  --   "ntk148v/vim-horizon",
  --   config = function()
  --     require("config/horizon")
  --   end,
  -- }

  use {
    "EdenEast/nightfox.nvim",
    config = function()
      require("config/nightfox")
    end,
  }

  -- use {
  --   "folke/tokyonight.nvim",
  --   config = function()
  --     require("config/tokyonight")
  --   end,
  -- }
  -- use "navarasu/onedark.nvim"

  use {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("config/lualine")
    end,
    requires = {
      "kyazdani42/nvim-web-devicons",
      opt = true,
    },
  }

  use {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("config/explorer")
    end,
    requires = {
      "kyazdani42/nvim-web-devicons",
      opt = true,
    },
  }

  use {
    "numToStr/Comment.nvim",
    config = function()
      require("config/comments")
    end,
  }

  use {
    "windwp/nvim-autopairs",
    config = function()
      require("config/autopairs")
    end,
  }

  use {
    "goolord/alpha-nvim",
    config = function()
      require("config/alpha")
    end,
    requires = {
      "kyazdani42/nvim-web-devicons",
      opt = true,
    },
  }

  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("config/gitsigns")
    end,
    requires = {
      "nvim-lua/plenary.nvim"
    },
  }

  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require("config/completions")
    end,
  }

  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-path"
  use "saadparwaiz1/cmp_luasnip"
  use "L3MON4D3/LuaSnip"

  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("config/formatters")
    end,
    requires = {
      "nvim-lua/plenary.nvim"
    },
  }

  use {
    "phaazon/hop.nvim",
    branch = "v1",
    config = function()
      require("config/hop")
    end,
  }

  use "famiu/bufdelete.nvim"

  use {
    "akinsho/toggleterm.nvim",
    config = function()
      require("config/toggleterm")
    end,
  }

  use {
    "folke/which-key.nvim",
    config = function()
      require("config/which-key")
    end,
  }

  use "purescript-contrib/purescript-vim"

  if packer_bootstrap then
    require("packer").sync()
  end
end)
