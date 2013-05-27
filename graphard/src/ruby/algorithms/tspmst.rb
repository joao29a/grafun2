def tspMst(graph)
	r = graph.getPlane.first[0]
	mstPrim(graph,r)
	tree = createTree(graph)
	custo,path = createPath(graph,tree)
	return custo,path
end

def mstPrim(graph,r)
	graph.getPlane.each do |index,value|
		graph.setKey(index,Float::INFINITY)
		graph.setFather(index,nil)
	end
	graph.setKey(r,0)
	graphDump = Marshal.load(Marshal.dump(graph))
	q = []
	graph.getPlane.each do |index,value|
		q.push(VertexKEY.new(index,graph.getKey(index)))
	end
	heap = Heapmin.new
	while (!q.empty?)
		heap.buildHeap(q)
		u = heap.extractRoot(q) #extract min in this case
		graphDump.getPlane.delete(u.vertex)
		graphDump.getPlane.each do |index,value|
			distance = graph.getDistance(u.vertex.to_i,index.to_i) 
			if (distance < graph.getKey(index))
				graph.setKey(index,distance)
				graph.setFather(index,u)
				q.each do |v|
					if (index == v.vertex)
						v.key = distance
					end
				end
			end	
		end
	end
end

def createTree(graph)
	tree = Hash.new { |key,value| key[value] = [] }
	graph.getPlane.each do |index,value|
		v = graph.getFather(index)
		if (!v.nil?)
			tree[v.vertex].push(index)
		else tree[index]
		end	
	end
	return tree
end

def createPath(graph,tree)
	path = []
	preOrder(tree,tree.first[0],path)
	path.push(tree.first[0])
	custo = 0
	for i in 0..path.size-1
		if (i!=path.size-1)
			custo+=graph.getDistance(path[i].to_i,
				path[i+1].to_i)
		end
	end
	return custo,path
end

def preOrder(tree,father,path)
	path.push(father)
	if (tree.has_key?(father))
		sons = tree[father]
		while (!sons.empty?)
			descent = getSon(sons)
			preOrder(tree,descent,path)
		end
	end
end

def getSon(sons)
	temp = sons[0]
	sons[0] = sons[sons.size-1]
	sons[sons.size-1] = temp
	return sons.pop
end
