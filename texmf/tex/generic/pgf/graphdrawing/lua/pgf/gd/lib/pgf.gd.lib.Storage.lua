-- Copyright 2012 by Till Tantau
--
-- This file may be distributed an/or modified
--
-- 1. under the LaTeX Project Public License and/or
-- 2. under the GNU Public License
--
-- See the file doc/generic/pgf/licenses/LICENSE for more information

--- @release $Header: /cvsroot/pgf/pgf/generic/pgf/graphdrawing/lua/pgf/gd/lib/pgf.gd.lib.Storage.lua,v 1.3 2012/06/22 08:12:13 tantau Exp $



---
-- A storage is an object that, as the name suggests, allows you to
-- ``store stuff.'' Basically, you use a storage object like a
-- table. The only difference is that (a) the keys of this table are
-- weak, so the entries will go away if you no longer use the key any
-- more and (b) whenever you access the table with a key that is a
-- table and that was not yet used, an empty table is created
-- automatically for this key inside the storage.
--
-- The typical way you use storages is best explained with the
-- following example: Suppose you want to write a depth-first search
-- algorithm for a graph. This algorithm might wish to mark all nodes
-- it has visisted. It could just say |v.marked = true|, but this might
-- clash with someone else also using the |marked| key. The solution is
-- to use the fact that all vertices have a storage attached to them. The
-- algorithm can first say
--\begin{codeexample}[code only]
--local mark = {}
--\end{codeexample}
-- to create a unique key and then say
--\begin{codeexample}[code only]
--v.storage[mark] = true
--\end{codeexample}
-- to mark its objects. This way, the algorithm cannot get into
-- conflict with other algorithms and, even better, once the algorithm
-- is done and |mark| goes out of scope, the entries in the storage table
-- will automatically be removed (it is a table with weak keys).
--
-- Now suppose the algorithm would like to store even more stuff in
-- the storage. For this, we might use a table and can use the fact
-- that a storage will automatically create a table when necessary:
--\begin{codeexample}[code only]
--local algo = {} -- some local/unique table
--
--v.storage[algo].marked = true  -- the "storage[algo]" table is
--                               -- created automatically here
--
--v.storage[algo].foo    = "bar"
--\end{codeexample}
-- Again, once |algo| goes out of scope, the table will removed. 
local Storage = {}

-- Namespace
require("pgf.gd.lib").Storage = Storage



function Storage.__index (t, k)
  if type(k) == "table" then
    local new = {}
    rawset(t, k, new)
    return new
  end
end

Storage.__mode = "k"


--- Create a new storage object
--
-- @return A new |Storage| instance.

function Storage.new()
  local new = {}
  setmetatable(new, Storage)
  return new
end







-- Done

return Storage