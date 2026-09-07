local M = {}

function M.setup()
	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

	parser_config.mlog = {
		install_info = {
			url = "Nibato/tree-sitter-mlog.git",
			files = { "src/parser.c" }, -- add "src/scanner.c" if you use an external scanner
			branch = "main",
		},
		filetype = "mlog",
	}
end

return M
