return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#1c1011',
				base01 = '#1c1011',
				base02 = '#a5999a',
				base03 = '#a5999a',
				base04 = '#ffeff1',
				base05 = '#fff8f9',
				base06 = '#fff8f9',
				base07 = '#fff8f9',
				base08 = '#ff9fa0',
				base09 = '#ff9fa0',
				base0A = '#ffbdc4',
				base0B = '#baffa5',
				base0C = '#ffdcdf',
				base0D = '#ffbdc4',
				base0E = '#ffc9ce',
				base0F = '#ffc9ce',
			})

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#a5999a',
				fg = '#fff8f9',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#ffbdc4',
				fg = '#1c1011',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#a5999a' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#ffdcdf', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#ffc9ce',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#ffbdc4',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#ffbdc4',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#ffdcdf',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#baffa5',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#ffeff1' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#ffeff1' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#a5999a',
				italic = true
			})

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()
				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)
					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("Theme reload")
					end
				end))
			end
		end
	}
}
