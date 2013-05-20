class Graph

        def initialize()
                @graph = Hash.new
        end

        def addVertice(index)
                @graph[index]
        end
	def addEdge(index,a)
		if (@graph[index]==nil)
			@graph[index] = [a]
		else
			@graph[index] = @graph[index].push(a);
		end
	end

        def getVertice(index)
                return @graph[index]
        end
	def getAllVertice
		@graph.each {|key, value| print "Vertex #{key}: "; getValue(value)}
	end
	def getValue(value)
		value.each do |v|
			print "#{v} | "
		end
		puts
	end
end

class FileIO
        def lerGrafoNoArquivo(inputFile)
                graph = Graph.new
                file = File.new(inputFile,"r")
		edges = false
                while (line = file.gets)
                        splited = line.split
			if (splited[0].eql? "#")
				edges = true
				next
                        end
			if (!edges)
				graph.addVertice(splited[0])
			else
				graph.addEdge(splited[0],splited[1]);
			end
                end
                file.close()
                return graph
        end
end

fileIO = FileIO.new
graph = fileIO.lerGrafoNoArquivo("arquivo2")
graph.getAllVertice
