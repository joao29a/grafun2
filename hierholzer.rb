def hierholzer(g)
	v = g.first[0]
	s = [v]
	c = []
	while (!s.empty?)	
		u = s.pop
		c.unshift(u) #insert in the front of the array
		while (!g[u].edges.empty?)
			s.push(u)
			v = g[u].edges.delete_at(0);
			g[v].edges.delete(u);
			u = v
		end
	end
	return c
end