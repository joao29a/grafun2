class PlanoCartesiano

        def initialize()
                @plano = Hash.new
        end

        def addVertice(index)
                @plano[index]
        end
	def addEdge(index,a)
		if (@plano[index]==nil)
			@plano[index] = [a]
		else
			@plano[index] = @plano[index].push(a);
		end
	end

        def getVertice(index)
                return @plano[index]
        end
	def getAllVertice
		@plano.each {|key, value| print "Vertex #{key}: "; getValue(value)}
	end
	def getValue(value)
		value.each do |v|
			print "#{v} | "
		end
		puts
	end
end

class FileIO
        def lerCartesianoNoArquivo(inputFile)
                plano = PlanoCartesiano.new
                file = File.new(inputFile,"r")
		edges = false
                while (line = file.gets)
                        splited = line.split
			if (splited[0].eql? "#")
				edges = true
				next
                        end
			if (!edges)
				plano.addVertice(splited[0])
			else
				plano.addEdge(splited[0],splited[1]);
			end
                end
                file.close()
                return plano
        end
end

fileIO = FileIO.new
plano = fileIO.lerCartesianoNoArquivo("arquivo2")
plano.getAllVertice
