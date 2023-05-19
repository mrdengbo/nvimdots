local bind = require("keymap.bind")
local map_cu = bind.map_cu
local map_cr = bind.map_cr
local map_cmd = bind.map_cmd

-- format select code
vim.api.nvim_create_user_command("FormatSelectCode", function()
	vim.lsp.buf.format({
		async = true,
		range = {
			["start"] = vim.api.nvim_buf_get_mark(0, "<"),
			["end"] = vim.api.nvim_buf_get_mark(0, ">"),
		},
	})
end, {})

--set file auto reload when file be modify
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})

-- this is my custom key binding --
local plug_map = {
	["n|<leader>s"] = map_cu("write"):with_noremap():with_silent():with_desc("edit: Save file"),

	-- spilt window
	["n|sv"] = map_cr("<Esc>:vsplit<CR>"):with_noremap():with_silent():with_desc("window: spilt window vertically"),
	["n|sp"] = map_cr("<Esc>:split<CR>"):with_silent():with_noremap():with_desc("window: spilt window horizontally"),
	["n|sc"] = map_cr("<Esc>:q<CR>"):with_silent():with_noremap():with_desc("window: close current split window"),
	--close window
	["n|<leader>q"] = map_cr("<Esc>:q<CR>")
		:with_silent()
		:with_noremap()
		:with_desc("window: close current split window"),
	["n|Q"] = map_cr("q!"):with_desc("edit: Force quit"),
	--buffer handle
	["n|<leader>bd"] = map_cr("BufDel"):with_noremap():with_silent():with_desc("buffer: Close current"),
	["n|<leader>bl"] = map_cr("BufferLineCycleNext"):with_noremap():with_silent():with_desc("buffer: Switch to next"),
	["n|<leader>bh"] = map_cr("BufferLineCyclePrev"):with_noremap():with_silent():with_desc("buffer: Switch to prev"),
	["n|<leader>bp"] = map_cr("BufferLinePick"):with_noremap():with_silent():with_desc("buffer: buffer pick"),
	--nvimtree handle
	["n|<leader>nn"] = map_cr("NvimTreeToggle"):with_noremap():with_silent():with_desc("filetree: Toggle"),
	["n|<leader>n]"] = map_cr(":NvimTreeResize +10"):with_noremap():with_silent():with_desc("filetree: Resize +20"),
	["n|<leader>n["] = map_cr(":NvimTreeResize -10"):with_noremap():with_silent():with_desc("filetree: RResize -20"),
	-- format select code
	["nv|<leader>cf"] = map_cmd("<Esc>:FormatSelectCode<CR>")
		:with_noremap()
		:with_silent()
		:with_desc("format select code"),
}

bind.nvim_load_mapping(plug_map)
