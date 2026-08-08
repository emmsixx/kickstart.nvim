-- Static snapshot of the Matugen base16 palette for source color #b0324c
-- (the same seed used by ../../niri/colors.kdl). Update these values
-- manually when the palette changes -- regenerate with:
--   matugen color hex '#b0324c' --json hex --mode dark --dry-run
-- No live DMS/base46 dependency: this must render identically on any
-- machine, DMS installed or not.

local palette = {
	base00 = "#1f0e11",
	base01 = "#352226",
	base02 = "#4b363a",
	base03 = "#614a4f",
	base04 = "#765f64",
	base05 = "#8c7378",
	base06 = "#a2878d",
	base07 = "#b89ba1",
	base08 = "#ff625e",
	base09 = "#d77d87",
	base0A = "#d67d88",
	base0B = "#b19500",
	base0C = "#c68b3c",
	base0D = "#ff5f7c",
	base0E = "#d18700",
	base0F = "#6f5b5c",
}

vim.pack.add { "https://github.com/RRethy/base16-nvim" }
require("base16-colorscheme").setup(palette)

vim.api.nvim_set_hl(0, "Visual", { bg = palette.base02, fg = palette.base06, bold = true })
vim.api.nvim_set_hl(0, "Statusline", { bg = palette.base0A, fg = palette.base00 })
vim.api.nvim_set_hl(0, "LineNr", { fg = palette.base03 })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = palette.base0E, bold = true })

vim.api.nvim_set_hl(0, "Statement", { fg = palette.base0E, bold = true })
vim.api.nvim_set_hl(0, "Keyword", { link = "Statement" })
vim.api.nvim_set_hl(0, "Repeat", { link = "Statement" })
vim.api.nvim_set_hl(0, "Conditional", { link = "Statement" })

vim.api.nvim_set_hl(0, "Function", { fg = palette.base0D, bold = true })
vim.api.nvim_set_hl(0, "Macro", { fg = palette.base0D, italic = true })
vim.api.nvim_set_hl(0, "@function.macro", { link = "Macro" })

vim.api.nvim_set_hl(0, "Type", { fg = palette.base0C, bold = true, italic = true })
vim.api.nvim_set_hl(0, "Structure", { link = "Type" })

vim.api.nvim_set_hl(0, "String", { fg = palette.base0B, italic = true })

vim.api.nvim_set_hl(0, "Operator", { fg = palette.base05 })
vim.api.nvim_set_hl(0, "Delimiter", { fg = palette.base05 })
vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "Delimiter" })
vim.api.nvim_set_hl(0, "@punctuation.delimiter", { link = "Delimiter" })

vim.api.nvim_set_hl(0, "Comment", { fg = palette.base04, italic = true })

local current_file_path = debug.getinfo(1, "S").source:sub(2)
if not _G._dms_colors_watcher then
	local uv = vim.uv or vim.loop
	_G._dms_colors_watcher = uv.new_fs_event()
	_G._dms_colors_watcher:start(
		current_file_path,
		{},
		vim.schedule_wrap(function()
			if vim.g.colors_name == "dms" then
				vim.cmd.colorscheme("dms")
				vim.notify("Theme reload", vim.log.levels.INFO, { title = "dms" })
			end
		end)
	)
end

vim.g.colors_name = "dms"
