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

class CartesianPlane
	attr_accessor :plane, :distances

        def initialize()
                @plane = Hash.new
		@distances = Hash.new
        end

        def addVertex(index,x,y)
                @plane[index] = [x,y]
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
			
				@distances[[key1.to_i,key2.to_i]] = 
					((Math.sqrt(
					  (v2[0].to_f - v1[0].to_f)**2 + 
					  (v2[1].to_f - v1[1].to_f)**2)
					)+0.5).to_int	
			end
		end		
	end
	
	def getDistance(key1,key2)
		return @distances[[key1,key2]]
	end

	def getPlane
		return @plane
	end
end
