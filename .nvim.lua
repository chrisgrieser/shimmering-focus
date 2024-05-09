-- INFO nvim config specifically for Shimmering Focus file
local bo = vim.bo
local cmd = vim.cmd
local fn = vim.fn

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
local group = vim.api.nvim_create_augroup("shimmering-focus-hot-reload", {})
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
	buffer = 0,
	group = group,
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
	"gc",
	function() require("tinygit").smartCommit { pushIfClean = false } end,
	{ desc = "󰊢 Smart-Commit (no push)" }
)

--------------------------------------------------------------------------------
-- NAVIGATION MARKERS

-- goto comment marks (deferred, to override lsp-gotosymbol)
vim.defer_fn(function()
	bo.grepprg = "rg --vimgrep --no-column" -- remove columns for readability
	bufferKeymap("n", "gs", function()
		cmd([[silent! lgrep "^(  - \#\# \|/\*\*)" %]]) -- riggrep-search for navigaton markers
		require("telescope.builtin").loclist {
			prompt_prefix = " ",
			prompt_title = "Navigation Markers",
			trim_text = true,
			previewer = false,
			layout_config = { horizontal = { width = 0.7 } },
			path_display = function() return "" end, -- hide redundant filename
		}
	end, { desc = " Search Comment Marks" })
end, 500)

-- next/prev comment marks
bufferKeymap({ "n", "x" }, "<C-j>", [[/^\/\*\*<CR><cmd>nohl<CR>]], { desc = "next comment mark" })
bufferKeymap({ "n", "x" }, "<C-k>", [[?^\/\*\*<CR><cmd>nohl<CR>]], { desc = "prev comment mark" })

-- create comment mark
bufferKeymap("n", "qw", function()
	local hr = {
		"/* ───────────────────────────────────────────────── */",
		"/** ",
		"──────────────────────────────────────────────────── */",
		"",
		"",
	}
	fn.append(".", hr) ---@diagnostic disable-line undefined-field, param-type-mismatch
	local lineNum = vim.api.nvim_win_get_cursor(0)[1] + 2
	local colNum = #hr[2] + 2
	vim.api.nvim_win_set_cursor(0, { lineNum, colNum })
	cmd.startinsert { bang = true }
end, { desc = " Comment Mark" })
