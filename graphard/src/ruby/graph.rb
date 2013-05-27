class Vertex
	attr_accessor :edges
	
	def initialize
		@edges = Hash.new
	end
	
	def addAdj(edge)
		@edges[edge] = edge
	end
end

class VertexTSP

	attr_accessor :cord, :key, :father

	def initialize(x,y)
		@cord = [x,y]
	end

end

class VertexKEY
        
        attr_accessor :vertex, :key

        def initialize(vertex,key)
                @vertex = vertex
                @key = key
        end

        def <(vertex)
                @key < vertex.key
        end

        def >(vertex)
                @key > vertex.key
        end

        def ==(vertex)
                @vertex == vertex
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

class CartesianPlane

        def initialize()
                @plane = Hash.new
		@distances = Hash.new
        end

        def addVertex(index,x,y)
                @plane[index] = VertexTSP.new(x,y)
        end

	def rmVertex(index)
		@plane.delete(index)	
	end
	
        def getVertex(index)
                return @plane[index]
        end

	def calcDistances	
		@plane.each do |key1, v1|
			@plane.each do |key2 ,v2|
				@distances[[key1.to_i,key2.to_i]] = ((Math.sqrt(
								(v2.cord[0].to_f - v1.cord[0].to_f)**2 + 
								(v2.cord[1].to_f - v1.cord[1].to_f)**2)
								)+0.5).to_int
			end
		end		
	end
	
	def getDistance(key1,key2)
		return @distances[[key1,key2]]
	end

	def setKey(index,key)
		@plane[index].key = key
	end

	def getKey(index)
		return @plane[index].key
	end

	def setFather(index,father)
		@plane[index].father = father
	end

	def getFather(index)
		return @plane[index].father
	end

	def getPlane
		return @plane
	end

	def getDistances
		return @distances
	end
end
