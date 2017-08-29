
class Board

	@@range = 0..2

	def initialize
		
		@matrix = Array.new(3) { Array.new(3) }
	end

	def c(x, y)
		
		@matrix[x][y].nil? ? " " : @matrix[x][y]
	end

	def mark(simb, x, y)

		raise "Posição já preenchida. [#{x}, #{y}]" unless @matrix[x][y].nil?

		if !@@range.include?(x) || !@@range.include?(y)

			raise "Posição fora dos limites. [#{x}, #{y}]" 
		end

		@matrix[x][y] = simb

	end

	def inspect
		"\n     0     1     2    X" + 
		"\n" + 
		"\n0    #{c(0, 0)}  |  #{c(1, 0)}  |  #{c(2, 0)}  " +
		"\n   _____|_____|_____" +
		"\n        |     |" +
		"\n1    #{c(0, 1)}  |  #{c(1, 1)}  |  #{c(2, 1)}" +
		"\n   _____|_____|_____" +
		"\n        |     |" +
		"\n2    #{c(0, 2)}  |  #{c(1, 2)}  |  #{c(2, 2)}" +
		"\n\nY\n"
	end

	private :c
end