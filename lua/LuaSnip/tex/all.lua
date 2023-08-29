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

M = {
  -- Use of insert node placeholder text
  s(
    { trig = "hr", dscr = "The hyperref package's href{}{} command (for url links)" },
    fmta([[\href{<>}{<>}]], {
      i(1, "url"),
      i(2, "display name"),
    })
  ),
  s(
    { trig = "h1", dscr = "Top-level section", snippetType = "autosnippet" },
    fmta([[\section{<>}]], { i(1) }),
    { condition = line_begin }
  ),
  s(
    { trig = "new", dscr = "A generic new environmennt" },
    fmta(
      [[
      \begin{<>}
          <>
      \end{<>}
    ]],
      {
        i(1),
        i(2),
        rep(1),
      }
    )
  ),
  s(
    { name = "Table", trig = "ta", dscr = "A generic table" },
    fmta(
      [[
      \begin{center}
      \begin{tabular}{|c|c|c|}
      \hline
        A & B & C \\
      \hline
        A & B & C \\
        A & B & C \\
      \hline
      \end{tabular}
      \end{center}
    ]],
      {}
    )
  ),
}

return M
