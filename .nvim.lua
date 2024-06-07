-- INFO nvim config specifically for Shimmering Focus file
local function bufferKeymap(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { buffer = true, silent = true, nowait = true })
end

-- never push, since build script already pushes
bufferKeymap("n", "gc", function() require("tinygit").smartCommit { pushIfClean = false } end)

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
			prompt = " Navigation Markers",
			format_item = function(item) return item.line:sub(5) end,
		}, function(line)
			if not line then return end
			vim.api.nvim_win_set_cursor(0, { line.lnum, 4 })
		end)
	end)
end, 1)

-- next/prev navigation marks
bufferKeymap({ "n", "x" }, "<C-j>", [[/^[/#]\*\*<CR><cmd>nohl<CR>]])
bufferKeymap({ "n", "x" }, "<C-k>", [[?^[/#]\*\*<CR><cmd>nohl<CR>]])

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
end)
