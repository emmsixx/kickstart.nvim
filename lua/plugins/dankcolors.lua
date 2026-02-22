return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#100F0F',
				base01 = '#100F0F',
				base02 = '#857a80',
				base03 = '#857a80',
				base04 = '#d8cad1',
				base05 = '#fff8fb',
				base06 = '#fff8fb',
				base07 = '#fff8fb',
				base08 = '#ff969c',
				base09 = '#ff969c',
				base0A = '#e278af',
				base0B = '#b1f798',
				base0C = '#ffc0e0',
				base0D = '#e278af',
				base0E = '#ff9dcf',
				base0F = '#ff9dcf',
			})

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#857a80',
				fg = '#fff8fb',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#e278af',
				fg = '#100F0F',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#857a80' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#ffc0e0', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#ff9dcf',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#e278af',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#e278af',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#ffc0e0',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#b1f798',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#d8cad1' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#d8cad1' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#857a80',
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
