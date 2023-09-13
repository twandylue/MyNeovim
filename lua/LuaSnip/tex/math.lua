local status, ls = pcall(require, "luasnip")
if not status then
  print("luasnip is not installed")
  return
end

M = {}

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

local tex_utils = require("LuaSnip.tex.tex_utils")

M = {
  s(
    { name = "Equation", trig = "eq", dscr = "Expands 'eq' into an equation environment" },
    fmta(
      [[
       \begin{equation}
         <>
       \end{equation}
     ]],
      { i(1) }
    )
  ),
  s(
    { name = "Environment", trig = "mm", dscr = "Add $ $", snippetType = "autosnippet" },
    fmta("$<>$", {
      d(1, get_visual),
    }),
    { condition = tex_utils.not_in_mathzone }
  ),
  s(
    { name = "Fraction", trig = "ff", snippetType = "autosnippet" },
    fmta("\\frac{<>}{<>}", {
      d(1, get_visual),
      i(2),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { name = "Or", trig = "or", snippetType = "autosnippet" },
    fmta("\\lor <>", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { name = "And", trig = "and", snippetType = "autosnippet" },
    fmta("\\land <>", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { name = "Implies", trig = "ip", snippetType = "autosnippet" },
    fmta("\\implies <>", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { name = "Not", trig = "not", snippetType = "autosnippet" },
    fmta("\\neg <>", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { name = "Equivalent", trig = "ei", snippetType = "autosnippet" },
    fmta("\\equiv <>", {
      d(1, get_visual),
    }),
    { condition = tex_utils.in_mathzone }
  ),
}

return M
