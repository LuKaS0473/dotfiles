-- global settings
local set = vim.opt
set.number = true
set.clipboard = { 'unnamed', 'unnamedplus' }
set.autoindent = true
set.expandtab = false
set.tabstop = 4
set.shiftwidth = 4
set.list = true
set.mouse = 'a'
set.encoding = 'UTF-8'
set.scrolloff = 20

-- i do not know if this is necessary
-- unix lile endings
--vim.api.nvim_exec([[autocmd BufWritePre * set ff=unix]], false)
--vim.api.nvim_exec([[command Hexon :%!xxd]], false)
--vim.api.nvim_exec([[command Hexoff :%!xxd -r]], false)

-- package manager
vim.cmd [[packadd packer.nvim]]
require('packer').startup(function()
	-- packer
	use 'wbthomason/packer.nvim'

	-- colorscheme
	use { 'folke/tokyonight.nvim', branch = 'main' }

	-- lualine
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	
	-- language server
	use 'neovim/nvim-lspconfig'
	use { 'ms-jpq/coq_nvim', branch = 'coq' }

	-- show git diff
	use 'mhinz/vim-signify'

	-- treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run =[[:TSUpdate]],
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

	-- don't know if useful
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'

	-- telescope
	use 'nvim-telescope/telescope.nvim'
	
	-- misc
	use 'ap/vim-css-color'
	use {
		'kyazdani42/nvim-web-devicons',
		config = function()
			require'nvim-web-devicons'.setup {
				default = true;
			}
		end
	}
	use {
		'iamcco/markdown-preview.nvim',
		config = 'vim.call("mkdp#util#install")'
	}
	use {
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
	}
	use { "numtostr/FTerm.nvim",
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
	use "petertriho/nvim-scrollbar"
	use "ray-x/lsp_signature.nvim"
	use {
	  "narutoxy/dim.lua",
	  requires = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
	  config = function()
		require('dim').setup({})
	  end
	}
end)

-- colorscheme
vim.cmd[[colorscheme tokyonight]]
set.termguicolors = true

set.updatetime = 750

-- setup lualine
require('lualine').setup({
	options = { theme = 'tokyonight' }
})

-- keybindings
local map = vim.api.nvim_set_keymap
local opts1 = { noremap = true, silent = true }
local opts2 = { silent = true }

map('n', '<C-z>', '<CMD>lua require("FTerm").toggle()<CR>', opts2)
map('t', '<C-z>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', { silent = true})
map('n', '<TAB>', ':tabn<CR>', opts2)
map('n', '<C-TAB>', ':tabp<CR>', opts2)
map('n', '<F8>', ':TagbarToggle<CR>', opts2)
map('n', 't', ':Telescope find_files<CR>', opts2)
map('n', '<C-t>', ':Telescope live_grep<CR>', opts2)

-- disable arrow keys
--map('', '<C-j>', '<C-w><down>' , opts2)
--map('', '<C-k>', '<C-w><up>'   , opts2)
--map('', '<C-h>', '<C-w><left>' , opts2)
--map('', '<C-l>', '<C-w><right>', opts2)
map('n', '<Up>', '<Nop>' , opts2)
map('n', '<Down>', '<Nop>'   , opts2)
map('n', '<Left>', '<Nop>' , opts2)
map('n', '<Right>', '<Nop>', opts2)

--Exit terminal mode
map('t', '<Esc>', '<C-\\><C-n>', opts1 )

--Keep visual selection
map('v', '>', '>gv', opts2)
map('v', '<', '<gv', opts2)

map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts1 ) 
map('n', 'gb', '<C-^>', opts1 )
map('n', 'gh', ':lua vim.lsp.buf.hover()<CR>', opts1 )

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

require("lsp_signature").setup({})

-- html lsp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
}

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

