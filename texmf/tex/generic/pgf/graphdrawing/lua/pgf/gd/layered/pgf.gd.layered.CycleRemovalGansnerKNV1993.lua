-- Copyright 2011 by Jannis Pohlmann
--
-- This file may be distributed and/or modified
--
-- 1. under the LaTeX Project Public License and/or
-- 2. under the GNU Public License
--
-- See the file doc/generic/pgf/licenses/LICENSE for more information

-- @release $Header: /cvsroot/pgf/pgf/generic/pgf/graphdrawing/lua/pgf/gd/layered/pgf.gd.layered.CycleRemovalGansnerKNV1993.lua,v 1.3 2012/07/16 22:09:35 tantau Exp $



--- An sub of Modular for removing cycles

CycleRemovalGansnerKNV1993 = {}
CycleRemovalGansnerKNV1993.__index = CycleRemovalGansnerKNV1993


-- Namespace
require("pgf.gd.layered").CycleRemovalGansnerKNV1993 = CycleRemovalGansnerKNV1993

-- Imports
local Simplifiers = require "pgf.gd.lib.Simplifiers"




function CycleRemovalGansnerKNV1993.new(main_algorithm, graph)
  local algorithm = {
    main_algorithm = main_algorithm,
    graph = graph,
  }
  setmetatable(algorithm, CycleRemovalGansnerKNV1993)
  return algorithm
end



function CycleRemovalGansnerKNV1993:run()
  -- merge nonempty sets into supernodes
  --
  -- ignore self-loops
  --
  -- merge multiple edges into one edge each, whose weight is the sum of the 
  --   individual edge weights
  --
  -- ignore leaf nodes that are not part of the user-defined sets (their ranks 
  --   are trivially determined)
  --
  -- ensure that supernodes S_min and S_max are assigned first and last ranks
  --   reverse in-edges of S_min
  --   reverse out-edges of S_max
  --
  -- ensure the supernodes S_min and S_max are are the only nodes in these ranks
  --   for all nodes with indegree of 0, insert temporary edge (S_min, v) with delta=0
  --   for all nodes with outdegree of 0, insert temporary edge (v, S_max) with delta=0
  
  -- classify edges as tree/forward, cross and back edges using a DFS traversal
  local tree_or_forward_edges, cross_edges, back_edges = Simplifiers:classifyEdges(self.graph)

  -- reverse the back edges in order to make the graph acyclic
  for _,edge in ipairs(back_edges) do
    edge.reversed = true
  end
end


-- done

return CycleRemovalGansnerKNV1993