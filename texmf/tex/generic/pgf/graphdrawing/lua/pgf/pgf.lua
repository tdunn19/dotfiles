-- Copyright 2012 by Till Tantau
--
-- This file may be distributed an/or modified
--
-- 1. under the LaTeX Project Public License and/or
-- 2. under the GNU Public License
--
-- See the file doc/generic/pgf/licenses/LICENSE for more information

--- @release $Header: /cvsroot/pgf/pgf/generic/pgf/graphdrawing/lua/pgf/pgf.lua,v 1.5 2012/08/29 11:07:00 tantau Exp $


-- Declare the pgf namespace:

pgf = {}



local function tostring_table(t, prefix, depth)
  if type(t) ~= "table" or (getmetatable(t) and getmetatable(t).__tostring) or depth <= 0 then
    return tostring(t)
  else
    local r = "{\n"
    for k,v in pairs(t) do
      r = r .. prefix .. "  " .. tostring(k) .. "=" .. tostring_table(v, prefix .. "  ", depth-1) .. ",\n"
    end
    return r .. prefix .. "}"
  end
end

---
-- Writes debug info on the \TeX\ output, separating the parameters
-- by spaces. The debug information will include a complete traceback
-- of the stack, allowing you to see ``where you are'' inside the Lua
-- program.
--
-- Note that this function resides directly in the |pgf| table. The
-- reason for this is that you can ``always use it'' since |pgf| is
-- always available in the global name space.
--
-- @param ... List of parameters to write to the \TeX\ output.

function pgf.debug(...)
  local stacktrace = debug.traceback("",2)
  texio.write_nl(" ")
  texio.write_nl("Debug called for: ")
  -- this is to even print out nil arguments in between
  local args = {...}
  for i = 1, table.getn(args) do
    if i ~= 1 then texio.write(", ") end
    texio.write(tostring_table(args[i], "", 5))
  end
  texio.write_nl('')
  for w in string.gmatch(stacktrace, "/.-:.-:.-%c") do
    texio.write('by ', string.match(w,".*/(.*)"))
  end
end






return pgf