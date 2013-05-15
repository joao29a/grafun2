class PlanoCartesiano

        def initialize()
                @plano = Hash.new
        end

        def addVertice(index,x,y)
                @plano[index] = [x,y]
        end

        def getVertice(index)
                return @plano[index]
        end

end

class FileIO
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

fileIO = FileIO.new
plano = fileIO.lerCartesianoNoArquivo("arquivo")
puts plano.getVertice("1")
