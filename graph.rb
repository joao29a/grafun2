class Vertex
	attr_accessor :edges, :index
	
	def initialize(vertex)
		@vertex = vertex
	end
	
	def addAdj(edge)
		if (@edges==nil)
			@edges = Hash.new
		end		
		@edges[edge] = edge
	end

	def getAdjacency
		return @edges
	end

	def getVertex
		return @vertex
	end
	
end

class Graph

        def initialize
                @graph = Hash.new
        end

        def addVertice(index)
                @graph[index] = Vertex.new(index)
        end
	
	def addEdge(index,edge)
		@graph[index].addAdj(edge)
	end

        def getEdges(index)
                return @graph[index].getAdjacency
        end
	
	def getGraph
		return @graph
	end
end
