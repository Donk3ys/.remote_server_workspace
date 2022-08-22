return require'packer'.startup(function()
	-- General
  use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'

	-- Buffers
	-- use 'romgrk/barbar.nvim'
	use 'matbme/JABS.nvim'

	-- Comments
	use 'numToStr/Comment.nvim'
	use 'JoosepAlviste/nvim-ts-context-commentstring'

	-- Auto Complete
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'windwp/nvim-autopairs'

	-- File Explore
	use 'nvim-telescope/telescope.nvim'
	--use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use 'nvim-telescope/telescope-file-browser.nvim'

	-- Folds
	use 'kevinhwang91/nvim-ufo'
	use 'kevinhwang91/promise-async'

	-- Git
	use 'lewis6991/gitsigns.nvim'
	use 'kdheepak/lazygit.nvim'

	-- lsp
	use 'neovim/nvim-lspconfig'

	-- Terminal
	use 'akinsho/toggleterm.nvim'

	-- Tree Sitter
 	 use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

	---- UI
	use 'sainnhe/gruvbox-material'
	use 'kyazdani42/nvim-web-devicons'
	use 'NTBBloodbath/galaxyline.nvim'
	use 'petertriho/nvim-scrollbar'
	use 'j-hui/fidget.nvim'
	use 'RRethy/vim-illuminate'
end)
