load 'fileIO.rb'
load 'graph.rb'
load 'algorithms/tspnn.rb'
load 'algorithms/hierholzer.rb'
load 'algorithms/tsp2opt.rb'

def printVertexs(vertexs)
	vertexs.each do |v|
		puts "#{v}"
	end
end

if("tsp-nn"==ARGV[0])

	fileTSP = FileTSP.new
	plane = CartesianPlane.new
	fileTSP.readGraphInFile(ARGV[1],plane)
	plane.calcDistances

	cost,tspPath = tspNN(plane)

	puts "#{cost}"
	printVertexs(tspPath)

elsif("ec"==ARGV[0])

	fileEC = FileEC.new
	graph = Graph.new 
	fileEC.readGraphInFile(ARGV[1],graph)

	eulerian = hierholzer(graph.getGraph)

	printVertexs(eulerian)
elsif("tsp-nn-2opt"==ARGV[0])

	fileTSP = FileTSP.new
        plane = CartesianPlane.new
        fileTSP.readGraphInFile(ARGV[1],plane)
        plane.calcDistances

        cost,tspPath = tspNN(plane)

	newCost,newTspPath = tsp2opt(tspPath,cost,plane)

        puts "#{newCost}"
        printVertexs(newTspPath)

end
