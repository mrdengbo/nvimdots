local custom = {}

custom["navarasu/onedark.nvim"] = {
	lazy = true,
	config = require("custom.onedark"),
}

custom["mg979/vim-visual-multi"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("custom.vim-visual-multi"),
}

custom["folke/todo-comments.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("custom.todo-comments"),
}

return custom
