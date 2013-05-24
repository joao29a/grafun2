load 'fileIO.rb'
load 'graph.rb'
load 'algorithms/tspnn.rb'
load 'algorithms/hierholzer.rb'

if(ARGV[0]=="tsp-nn")

	fileTSP = FileTSP.new
	plane = CartesianPlane.new
	fileTSP.readGraphInFile(ARGV[1],plane)
	plane.calcDistances

	cost,tspRes = tspNN(plane)

	puts "#{cost}"
	tspRes.each do |v|
		puts "#{v}"
	end

elsif(ARGV[0]=="ec")

	fileEC = FileEC.new
	graph = Graph.new 
	fileEC.readGraphInFile(ARGV[1],graph)

	eulerian = hierholzer(graph.getGraph)

	eulerian.each do |v|
		puts "#{v}"
	end

end
