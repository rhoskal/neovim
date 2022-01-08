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
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  profile = {
    enable = true, -- enable profiling via :PackerCompile profile=true
    threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
  },
}

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    "nvim-treesitter/nvim-treesitter",
    config = [[ require("config/treesitter") ]],
    run = ":TSUpdate",
  }

  use {
    "editorconfig/editorconfig-vim",
    config = [[ require("config/editorconfig") ]],
  }

  if packer_bootstrap then
    require("packer").sync()
  end
end)
