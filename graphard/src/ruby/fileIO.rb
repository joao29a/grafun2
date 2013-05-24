class PlanoCartesiano
	attr_accessor :plano
        def initialize()
                @plano = Hash.new
		@dist = Hash.new
        end

        def addVertice(index,x,y)
                @plano[index] = [x,y]
        end

        def getVertice(index)
                return @plano[index]
        end

	def getAllVertice
		@plano.each {|key, value| print "#{key} | "; getValue(value)}
	end

	def getValue(value)
		value.each do |v|
			print "#{v} "
		end
		puts
	end

	def calcDistancias	
		@plano.each do |key1, v1|
			@plano.each do |key2 ,v2|
				@dist[[key1.to_i,key2.to_i]] = ((Math.sqrt(
						(v2[0].to_f - v1[0].to_f)**2 + 
						(v2[1].to_f - v1[1].to_f)**2)
					)+0.5).to_int	
			end
		end		
	end
	
	def printDist	
		@plano.each do |key1, v1|
                       	@plano.each do |key2 ,v2|	
				print "#{@dist[[key1.to_i,key2.to_i]]}"
				puts
			end
		end
	end
	
	def getDist
		return @dist
	end
end

class FileTSP
        def lerCartesianoNoArquivo(inputFile)
                plano = PlanoCartesiano.new
                file = File.new(inputFile,"r")
                while (line = file.gets)
                        splited = line.split
                        plano.addVertice(splited[0],splited[1],splited[2])
                end
                file.close()
                return plano
        end
end

