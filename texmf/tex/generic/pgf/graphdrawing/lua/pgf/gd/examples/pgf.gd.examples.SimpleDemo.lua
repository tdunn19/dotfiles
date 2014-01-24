-- Copyright 2010 by Renée Ahrens, Olof Frahm, Jens Kluttig, Matthias Schulz, Stephan Schuster
-- Copyright 2012 by Till Tantau
--
-- This file may be distributed an/or modified
--
-- 1. under the LaTeX Project Public License and/or
-- 2. under the GNU Public License
--
-- See the file doc/generic/pgf/licenses/LICENSE for more information

-- @release $Header: /cvsroot/pgf/pgf/generic/pgf/graphdrawing/lua/pgf/gd/examples/pgf.gd.examples.SimpleDemo.lua,v 1.6 2012/05/21 22:00:06 tantau Exp $


--- A trivial node placing algorithm for demonstration purposes.
-- All nodes are positioned on a circle, independently of which edges are present...

local SimpleDemo = pgf.gd.new_algorithm_class {}

function SimpleDemo:run()
  local g = self.digraph
  local alpha = (2 * math.pi) / #g.vertices

  for i,vertex in ipairs(g.vertices) do
    local radius = vertex.options['/graph drawing/node radius'] or g.options['/graph drawing/radius']
    vertex.pos.x = radius * math.cos(i * alpha)
    vertex.pos.y = radius * math.sin(i * alpha)
  end
end

return SimpleDemo