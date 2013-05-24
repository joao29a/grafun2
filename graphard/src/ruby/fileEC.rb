class FileEC       
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
				graph.addEdge(splited[1],splited[0]);
			end
                end
                file.close
                return graph
        end
end
