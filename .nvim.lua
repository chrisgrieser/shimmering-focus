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

local permaRepos = os.getenv("HOME") .. "/.config/perma-repos.csv"
local themeFiles = {}
for line in io.lines(permaRepos) do
	local name, path, _, _ = line:match("^(.-),(.-),(.-),(.-)$")
	if name:find("[Vv]ault") then
		local cssPath = vim.fs.normalize(path .. "/.obsidian/themes/Shimmering Focus/theme.css")
		table.insert(themeFiles, cssPath)
	end
end

-- touch symlink on filechange, to trigger Obsidian's hot-reload
local group = vim.api.nvim_create_augroup("shimmering-focus-hot-reload", {})
vim.api.nvim_create_autocmd(
	{ "InsertLeave", "TextChanged", "BufLeave", "FocusLost" },
	{
		buffer = 0,
		group = group,
		callback = function(ctx)
			local debounce = ctx.event == "FocusLost" and 0 or 2000 -- save at once on focus loss
			vim.b.touchQueued = true

			vim.defer_fn(function()
				for _, themeFile in pairs(themeFiles) do
					fn.system({ "touch", "-h", themeFile })
				end
				vim.b.touchQueued = false
			end, debounce)
		end,
	}
)

--------------------------------------------------------------------------------

-- never push, since build script already pushes
bufferKeymap("n", "gc", function()
	require("tinygit").smartCommit({ pushIfClean = false })
end, { desc = "󰊢 Smart-Commit (no push)" })

--------------------------------------------------------------------------------
-- COMMENT MARKS

-- goto comment marks (deferred, to override lsp-gotosymbol)
vim.defer_fn(function()
	bo.grepprg = "rg --vimgrep --no-column" -- remove columns for readability
	bufferKeymap("n", "gs", function()
		cmd([[silent! lgrep "^(  - \# <<\|/\* <)" %]]) -- riggrep-search for navigaton markers
		require("telescope.builtin").loclist({
			prompt_prefix = " ",
			prompt_title = "Navigation Markers",
			trim_text = true,
		})
	end, { desc = " Search Comment Marks" })
	-- search only for variables
	bufferKeymap("n", "gw", function()
		cmd([[silent! lgrep "^\s*--" %]]) -- riggrep-search for css variables
		require("telescope.builtin").loclist({
			prompt_prefix = "󰀫 ",
			prompt_title = "CSS Variables",
			trim_text = true,
		})
	end, { desc = " Search CSS Variables" })
end, 500)

-- next/prev comment marks
bufferKeymap(
	{ "n", "x" },
	"<C-j>",
	[[/^\/\* <<CR>:nohl<CR>]],
	{ desc = "next comment mark" }
)
bufferKeymap(
	{ "n", "x" },
	"<C-k>",
	[[?^\/\* <<CR>:nohl<CR>]],
	{ desc = "prev comment mark" }
)

-- create comment mark
bufferKeymap("n", "qw", function()
	local hr = {
		"/* ───────────────────────────────────────────────── */",
		"/* << ",
		"──────────────────────────────────────────────────── */",
		"",
		"",
	}
	fn.append(".", hr) ---@diagnostic disable-line undefined-field, param-type-mismatch
	local lineNum = vim.api.nvim_win_get_cursor(0)[1] + 2
	local colNum = #hr[2] + 2
	vim.api.nvim_win_set_cursor(0, { lineNum, colNum })
	cmd.startinsert({ bang = true })
end, { desc = " Comment Mark" })
