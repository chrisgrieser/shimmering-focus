-- INFO nvim config specifically for Shimmering Focus file
local function bufferKeymap(mode, lhs, rhs, opts)
	opts.buffer = true
	opts.silent = true
	vim.keymap.set(mode, lhs, rhs, opts)
end

--------------------------------------------------------------------------------
-- HOT-RELOADING

-- from all perma-repos, identify the one's that are Obsidian vaults and have
-- shimmering focus as theme
local permaRepos = os.getenv("HOME") .. "/.config/perma-repos.csv"
local themeFiles = {}
for line in io.lines(permaRepos) do
	local vaultName, vaultPath, _, _ = line:match("^(.-),(.-),(.-),(.-)$")
	if vaultName:find("[Vv]ault") then
		local cssPath = vim.fs.normalize(vaultPath .. "/.obsidian/themes/Shimmering Focus/theme.css")
		local themeExists = vim.loop.fs_stat(cssPath) ~= nil
		if themeExists then themeFiles[vaultName] = cssPath end
	end
end

-- touch symlink on filechange, to trigger Obsidian's hot-reload
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
	buffer = 0,
	group = vim.api.nvim_create_augroup("shimmering-focus", {}),
	callback = function()
		for _, themeFile in pairs(themeFiles) do
			vim.fn.system { "touch", "-h", themeFile }
		end
	end,
})

--------------------------------------------------------------------------------

-- never push, since build script already pushes
bufferKeymap(
	"n",
	"<leader>gc",
	function() require("tinygit").smartCommit { pushIfClean = false } end,
	{ desc = "󰊢 Smart-Commit (no push)" }
)

--------------------------------------------------------------------------------
-- COMMENT MARKERS

-- goto comment marks (deferred, to override lsp-gotosymbol)
vim.defer_fn(function()
	bufferKeymap("n", "gs", function()
		local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
		local linesWithMarkers = {}
		for lnum, line in pairs(lines) do
			if line:find([[^[/#]%*%*]]) then
				table.insert(linesWithMarkers, { lnum = lnum, line = line })
			end
		end
		vim.ui.select(linesWithMarkers, {
			prompt = " Comment Markers",
			format_item = function(item) return item.line:sub(5) end,
		}, function(line)
			if not line then return end
			vim.api.nvim_win_set_cursor(0, { line.lnum, 4 })
		end)
	end, { desc = " Goto Comment Marks" })
end, 1)

-- next/prev comment marks
bufferKeymap({ "n", "x" }, "<C-j>", [[/^[/#]\*\*<CR><cmd>nohl<CR>]], { desc = " Next Comment Mark" })
bufferKeymap({ "n", "x" }, "<C-k>", [[?^[/#]\*\*<CR><cmd>nohl<CR>]], { desc = " Prev Comment Mark" })

-- create comment mark
bufferKeymap("n", "qw", function()
	local hr = {
		"/* ───────────────────────────────────────────────── */",
		"/** ",
		"──────────────────────────────────────────────────── */",
		"",
		"",
	}
	vim.fn.append(".", hr) ---@diagnostic disable-line undefined-field, param-type-mismatch
	local lineNum = vim.api.nvim_win_get_cursor(0)[1] + 2
	vim.api.nvim_win_set_cursor(0, { lineNum, 0 })
	vim.cmd.startinsert { bang = true }
end, { desc = " Create Comment Mark" })
