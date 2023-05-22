return function()
	vim.api.nvim_create_user_command("RestoreNvimTree", function()
		local api = require("nvim-tree.api")
		api.tree.toggle()
		api.tree.reload()
	end, {})

	local config = function()
		vim.cmd([[
        let g:auto_session_post_restore_cmds = ["RestoreNvimTree"] 
        ]])
	end

	require("auto-session").setup({
		log_level = "info",
		auto_session_enable_last_session = true,
		auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
		auto_session_enabled = true,
		auto_save_enabled = true,
		auto_restore_enabled = true,
		auto_session_suppress_dirs = nil,
		bypass_session_save_file_types = nil, -- table: Bypass auto save when only buffer open is one of these file types
		cwd_change_handling = { -- table: Config for handling the DirChangePre and DirChanged autocmds, can be set to nil to disable altogether
			restore_upcoming_session = true, -- boolean: restore session for upcoming cwd on cwd change
			pre_cwd_changed_hook = nil, -- function: This is called after auto_session code runs for the `DirChangedPre` autocmd
			post_cwd_changed_hook = nil, -- function: This is called after auto_session code runs for the `DirChanged` autocmd
		},
		session_lens = {
			theme_conf = { border = true },
			previewer = false,
		},
		config(),
		require("lualine").setup({
			options = {
				theme = "nord",
			},
			sections = { lualine_c = { require("auto-session.lib").current_session_name } },
		}),
		vim.keymap.set("n", "<leader>as", require("auto-session.session-lens").search_session, {
			noremap = true,
		}),
	})
end
