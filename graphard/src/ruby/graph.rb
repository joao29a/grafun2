class Vertex
	attr_accessor :edges
	
	def initialize
		@edges = Hash.new
	end
	
	def addAdj(edge)
		@edges[edge] = edge
	end
end

class Graph

        def initialize
                @graph = Hash.new
        end

        def addVertice(index)
                @graph[index] = Vertex.new
        end
	
	def addEdge(index,edge)
		@graph[index].addAdj(edge)
	end

	def getGraph
		return @graph
	end
end
