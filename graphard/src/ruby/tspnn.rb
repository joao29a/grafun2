
def getSmaller(u,plano,dist)
	smaller = -1;
	smallerDist = 0;		
	plano.each do |key, v|
	aux = dist[[u.to_i,key.to_i]]
	
	if(aux != nil) 
		if(aux>0)
			if(smaller == -1)
				smaller = key
				smallerDist = aux
			else
				if(smallerDist > aux)
					smaller = key
					smallerDist = aux
				end	
			end
		end
	end
	end
	return [smaller,smallerDist]
end

def tspNN(g)
	v0 = g.plano.first[0]
	c = [v0]
	v = v0
	dist = g.getDist
	custo = 0;
	while g.plano.length != 1
		g.plano.delete(v)	
		u = getSmaller(v,g.plano,dist)	
		custo += u[1]
		c.push(u[0])
		v = u[0]
	end
	custo += dist[[v.to_i,v0.to_i]]
	c.push(v0)
	return [custo,c]
end
