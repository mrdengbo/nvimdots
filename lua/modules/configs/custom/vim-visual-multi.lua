return function()
	local config = function()
		vim.cmd([[
        let g:VM_default_mappings = 1
        let g:VM_show_warnings = 0
        let g:VM_theme = 'iceblue'
        let g:VM_maps = {}
        let g:VM_maps["Undo"] = 'u'
        let g:VM_maps["Redo"] = '<C-r>'
        ]])
	end
	config()
end
