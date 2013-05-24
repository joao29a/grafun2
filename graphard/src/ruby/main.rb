load 'fileIO.rb'
load 'tspnn.rb'
load 'fileEC.rb'
load 'graph.rb'
load 'hierholzer.rb'

if(ARGV[0]=="tsp-nn")
	fileIO = FileTSP.new
	graph = fileIO.lerCartesianoNoArquivo(ARGV[1])
	graph.calcDistancias

	res = tspNN(graph)
	custo = res[0]
	tsp = res[1]

	puts "#{custo}"
	tsp.each do |v|
		puts "#{v}"
	end
elsif(ARGV[0]=="ec")
	fileEC = FileEC.new
	graph = fileEC.lerGrafoNoArquivo(ARGV[1])

	eulerian = hierholzer(graph.getGraph)

	eulerian.each do |v|
		puts "#{v}"
	end
end
