vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.clipboard = { 'unnamed', 'unnamedplus' }
vim.opt.autoindent = true
vim.opt.expandtab = false 
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.list = true
vim.opt.mouse = 'a'
vim.opt.encoding = 'UTF-8'
vim.opt.scrolloff = 10

--vim.api.nvim_exec([[set guifont="SauceCodePro Nerd Font Mono"]], false)

--Unix lile endings
vim.api.nvim_exec([[autocmd BufWritePre * set ff=unix]], false)

vim.api.nvim_exec([[command Hexon :%!xxd]], false)
vim.api.nvim_exec([[command Hexoff :%!xxd -r]], false)


require('packer').startup(function()

	use 'wbthomason/packer.nvim'

	--colorscheme
	use 'morhetz/gruvbox'
	use { 'folke/tokyonight.nvim', branch = 'main' }
	use 'Nis5l/niscolor-vim'
	use 'EdenEast/nightfox.nvim'

	--visual
	use {
		'hoob3rt/lualine.nvim',
		config = function()
			require('lualine').setup {
			  options = {theme = 'tokyonight'}
			}
		end,
	}
	use {
		'p00f/nvim-ts-rainbow',
		requires = { "nvim-treesitter/nvim-treesitter" },
	}

	use {
		'kyazdani42/nvim-web-devicons',
		config = function()
			require'nvim-web-devicons'.setup {
				default = true;
			}
		end
	}

	--autocomplete/format
	use 'neovim/nvim-lspconfig'
	--use 'nvim-lua/lsp_extensions.nvim'
	use {
		'folke/trouble.nvim',
		config = function()
			require("trouble").setup{}
		end,
	}

	use { 'ms-jpq/coq_nvim', branch = 'coq' }
--	use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }

	--git
	use 'mhinz/vim-signify'
	use 'f-person/git-blame.nvim'

	--Telecope
	use {
		'nvim-treesitter/nvim-treesitter',
		run = [[:TSUpdate]],
		config = function()
			require('nvim-treesitter.configs').setup {
				ensure_installed = "all",
				highlight = {
					enable = true,
				},
				rainbow = {
					enable = true,
					extended_mode = true,
				}
			}
		end,
	}
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'

	--misc
	use 'b3nj5m1n/kommentary'
	use 'ap/vim-css-color'

	use {
		'iamcco/markdown-preview.nvim',
		config = 'vim.call("mkdp#util#install")'
	}
	use 'AndrewRadev/bufferize.vim'
	use {
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
	}

	use {
		"numtostr/FTerm.nvim",
		config = function()
			require'FTerm'.setup({
				border = 'double',
				dimensions  = {
					height = 0.9,
					width = 0.9,
				},
			})
		end,
	}

	use { "alec-gibson/nvim-tetris", branch = 'dev' }
	use "petertriho/nvim-scrollbar"
	use {
		"ianding1/leetcode.vim",
		config = function()
		end,
	}

	use { "ray-x/lsp_signature.nvim" }
	use { "johngrib/vim-game-snake" }
	use {
	  "narutoxy/dim.lua",
	  requires = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
	  config = function()
		require('dim').setup({})
	  end
	}
	--[[ use {
	  'romgrk/barbar.nvim',
	  requires = {'kyazdani42/nvim-web-devicons'}
	} ]]
	use { "neomake/neomake" }

	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	}

	use { 'dstein64/vim-startuptime' }

	use { 'mechatroner/rainbow_csv' }
end)

vim.g.gitblame_enabled = 0
vim.g.gitblame_message_template = '<sha> • <summary> • <date> • <author>'

vim.g.leetcode_browser = "firefox"
vim.g.leetcode_solution_filetype = "c"

vim.opt.termguicolors = true

--signify
vim.opt.updatetime = 100

vim.g.rainbow_active = 1

vim.cmd[[colorscheme tokyonight-night]]

vim.api.nvim_set_keymap('n', '<C-z>', '<CMD>lua require("FTerm").toggle()<CR>', { silent = true })
vim.api.nvim_set_keymap('t', '<C-z>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', { silent = true})
vim.api.nvim_set_keymap('n', '<TAB>', ':tabn<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-TAB>', ':tabp<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<F8>', ':TagbarToggle<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 't', ':Telescope find_files<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-t>', ':Telescope live_grep<CR>', { silent = true })

vim.api.nvim_set_keymap('', '<C-j>', '<C-w><down>' , { silent = true })
vim.api.nvim_set_keymap('', '<C-k>', '<C-w><up>'   , { silent = true })
vim.api.nvim_set_keymap('', '<C-h>', '<C-w><left>' , { silent = true })
vim.api.nvim_set_keymap('', '<C-l>', '<C-w><right>', { silent = true })

--Exit terminal mode
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true } )

--Keep visual selection
vim.api.nvim_set_keymap('v', '>', '>gv', { silent = true })
vim.api.nvim_set_keymap('v', '<', '<gv', { silent = true })

vim.api.nvim_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gb', '<C-^>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gh', ':lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })


vim.g.coq_settings = {
	auto_start = 'shut-up',
	['keymap.recommended'] = true,
	['keymap.jump_to_mark'] = '',
	["clients.snippets.warn"] = {},
	--https://github.com/ms-jpq/coq_nvim/issues/92
	['clients.lsp.always_on_top'] = {},
--	["clients.tabnine.enabled"] = true,
--	["display.pum.x_truncate_len"] = 1000,
}

require("mason").setup()
require("mason-lspconfig").setup({
    --ensure_installed = { "tsserver", "rust_analyzer", "jdtls", "cssls" }
    ensure_installed = { "rust_analyzer" }
})

local lsp = require "lspconfig"
local coq = require "coq"

local setup = coq.lsp_ensure_capabilities;
--local setup = function()
--  return {}
--end

lsp.rust_analyzer.setup(setup())
lsp.tsserver.setup(setup())
lsp.vimls.setup(setup())
lsp.ocamlls.setup(setup())
lsp.pylsp.setup(setup())
lsp.intelephense.setup(setup({cmd = { "intelephense", "--stdio" }}))
lsp.jdtls.setup(setup())
lsp.ccls.setup(setup())
lsp.cssls.setup(setup())

require("lsp_signature").setup({})

local colors = require("tokyonight.colors").setup()

require("scrollbar").setup({
	handle = {
		color = colors.bg_highlight,
	},
	marks = {
		Search = { color = colors.orange },
		Error = { color = colors.error },
		Warn = { color = colors.warning },
		Info = { color = colors.info },
		Hint = { color = colors.hint },
		Misc = { color = colors.purple },
	}
})

--https://github.com/ray-x/lsp_signature.nvim
--https://github.com/mhinz/vim-crates
--https://github.com/RRethy/vim-illuminate
--https://github.com/jbyuki/instant.nvim

