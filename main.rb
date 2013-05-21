load 'fileEC.rb'
load 'graph.rb'
load 'hierholzer.rb'

fileEC = FileEC.new
graph = fileEC.lerGrafoNoArquivo(ARGV[1])

eulerian = hierholzer(graph.getGraph)

eulerian.each do |v|
	puts "#{v}"
end
