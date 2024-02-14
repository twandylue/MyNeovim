local M = {}

local status, ls = pcall(require, "luasnip")
if not status then
  print("luasnip is not installed")
  return
end

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local helpers = require("LuaSnip.luasnip-helper-funcs")
local get_visual = helpers.get_visual
local line_begin = require("luasnip.extras.expand_conditions").line_begin
local tex_utils = require("LuaSnip.tex.tex_utils")

-- Typst detection functions
local function in_markup()
  return vim.api.nvim_eval("typst#in_markup()") == 1
end

local function in_math()
  return vim.api.nvim_eval("typst#in_math()") == 1
end

local function in_code()
  return vim.api.nvim_eval("typst#in_code()") == 1
end

local function in_comment()
  return vim.api.nvim_eval("typst#in_comment()") == 1
end

M = {
  s(
    { trig = "mm", dscr = "Add $ $" },
    fmta("$<>$", {
      d(1, get_visual),
    })
  ),

  -- NOTE: keeping as notes
  -- s(
  --   { trig = "hr", dscr = "The hyperref package's href{}{} command (for url links)" },
  --   fmta([[\href{<>}{<>}]], {
  --     i(1, "url"),
  --     i(2, "display name"),
  --   })
  -- ),
  -- s(
  --   { trig = "h1", dscr = "Top-level section", snippetType = "autosnippet" },
  --   fmta([[\section{<>}]], { i(1) }),
  --   { condition = line_begin }
  -- ),
  -- s(
  --   { trig = "new", dscr = "A generic new environmennt" },
  --   fmta(
  --     [[
  --     \begin{<>}
  --         <>
  --     \end{<>}
  --   ]],
  --     {
  --       i(1),
  --       i(2),
  --       rep(1),
  --     }
  --   )
  -- ),
  -- s(
  --   { name = "Table", trig = "ta", dscr = "A generic table. \\usepackage{array}" },
  --   fmta(
  --     [[
  --     \begin{center}
  --       \begin{tabular}{ | m{3cm} | m{3cm} | m{3cm} | }
  --         \hline
  --         A1 & B1 & C1 \\
  --         \hline
  --         A2 & B2 & C2 \\
  --         \hline
  --         A3 & B3 & C3 \\
  --         \hline
  --       \end{tabular}
  --     \end{center}
  --     ]],
  --     {}
  --   )
  -- ),
  -- s(
  --   { name = "vertical space", trig = "vs", dscr = "Insert \\vspace{}" },
  --   fmta(
  --     [[
  --     \vspace{<>}
  --   ]],
  --     { i(1, "5mm") }
  --   )
  -- ),
  -- s(
  --   { name = "horizontal space", trig = "hs", dscr = "Insert \\hspace{}" },
  --   fmta(
  --     [[
  --     \hspace{<>}
  --   ]],
  --     { i(1, "5mm") }
  --   )
  -- ),
  -- s(
  --   { name = "no indent", trig = "noi", dscr = "Insert \\hspace{}" },
  --   fmta("\\noindent <>", {
  --     d(1, get_visual),
  --   })
  -- ),
}

return M
