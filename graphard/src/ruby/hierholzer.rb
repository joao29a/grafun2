def hierholzer(g)
	v = g.first[0]
	s = [v]
	c = []
	while (!s.empty?)	
		u = s.pop
		c.push(u) 
		while (!g[u].edges.empty?)
			s.push(u)
			v = g[u].edges.delete(g[u].edges.first[0])
			g[v].edges.delete(u);
			u = v
		end
	end
	return c
end
