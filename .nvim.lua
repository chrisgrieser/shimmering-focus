local bo = vim.bo
local cmd = vim.cmd
local fn = vim.fn
local keymap = vim.keymap.set

--------------------------------------------------------------------------------
-- COMMENT MARKS

-- goto comment marks (deferred, to override lsp-gotosymbol)
vim.defer_fn(function()
	bo.grepprg = "rg --vimgrep --no-column" -- remove columns for readability
	keymap("n", "gs", function()
		cmd([[silent! lgrep "^(\# <<\|/\* <)" %]]) -- riggrep-search for navigaton markers in SF
		require("telescope.builtin").loclist {
			prompt_prefix = " ",
			prompt_title = "Navigation Markers",
			trim_text = true,
			fname_width = 0,
		}
	end, { desc = " Search Comment Marks", buffer = true })
	-- search only for variables
	keymap("n", "gw", function()
		cmd([[silent! lgrep "^\s*--" %]]) -- riggrep-search for css variables
		require("telescope.builtin").loclist {
			prompt_prefix = "󰀫 ",
			prompt_title = "CSS Variables",
			trim_text = true,
			fname_width = 0,
		}
	end, { desc = " Search CSS Variables", buffer = true })
end, 500)

-- next/prev comment marks
keymap(
	{ "n", "x" },
	"<C-j>",
	[[/^\/\* <<CR>:nohl<CR>]],
	{ buffer = true, desc = "next comment mark" }
)
keymap(
	{ "n", "x" },
	"<C-k>",
	[[?^\/\* <<CR>:nohl<CR>]],
	{ buffer = true, desc = "prev comment mark" }
)

--------------------------------------------------------------------------------

-- never push, since build script already pushes
keymap(
	"n",
	"gc",
	function() require("tinygit").smartCommit { pushIfClean = false } end,
	{ desc = "󰊢 Smart-Commit (no push)", buffer = true }
)

-- create comment mark
keymap("n", "qw", function()
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
	cmd.startinsert { bang = true }
end, { buffer = true, desc = " Comment Mark" })

-- FIX syntax highlighting
-- various other solutions are described here: https://github.com/vim/vim/issues/2790
-- using treesitter, this is less of an issue, but treesitter css
-- highlighting isn't good yet, so…
keymap(
	"n",
	"<localleader>s",
	"<cmd>syntax sync fromstart<CR>",
	{ buffer = true, desc = " Fix Syntax Hl" }
)
