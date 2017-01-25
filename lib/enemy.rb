class Enemy

	attr_accessor :delete, :health

	def initialize(start, map)
		@image = Gosu::Image.new("media/enemies/enemy.png")
		@map = map
		@pos = start
		@visited = [] << start
		@delete = false

		@health = 200
	end

	def update

	end

	def move
		@possible = [[@pos[0] - 1, @pos[1]], [@pos[0] + 1, @pos[1]], [@pos[0], @pos[1] -1], [@pos[0], @pos[1] + 1]]
		if @possible.select{|pos| not @visited.include? pos and @map[pos[1]][pos[0]] == "p"}.first
			@pos = @possible.select{|pos| not @visited.include? pos and @map[pos[1]][pos[0]] == "p"}.first
		else
			@delete = true
		end
		@visited << @pos
	end

	def draw
		@image.draw(@pos[0]*16, @pos[1]*16, ZOrder::Enemy)
	end

end