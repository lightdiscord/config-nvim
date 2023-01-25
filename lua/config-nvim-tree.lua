require("nvim-tree").setup {
	renderer = {
		icons = {
			show = {
				file = false,
				folder = false,
				git = false,
				folder_arrow = false,
				modified = false,
			}
		}
	}
}

require('lualine').setup {
	options = { section_separators = '', component_separators = '' }
}
