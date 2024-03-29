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

M = {
  s(
    { trig = "tii", dscr = "Expands 'tii' into LaTeX's textit{} command." },
    fmta("\\textit{<>}", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "tbb", dscr = "Expands 'tbb' into LaTeX's textbf{} command." },
    fmta("\\textbf{<>}", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "tuu", dscr = "Expands 'tuu' into LaTeX's underline{} command." },
    fmta("\\underline{<>}", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "ttt", dscr = "Expands 'ttt' into LaTeX's texttt{} command." },
    fmta("\\texttt{<>}", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "tcc", dscr = "Expands 'tcc' into LaTeX's textcolor{}{} command." },
    fmta([[\textcolor{<>}{<>}]], {
      i(1, "blue"),
      i(2, "text"),
    })
  ),
}

return M
