class Game

	def initialize(window)
		@window = window
		seed_map

		@enemies = []

		@colors = {"p" => 0xff_fff59d, "s" => 0xff_757575, "w" => 0xff_2196f3, "" => 0xff_8bc34a}

		@enemies = [] << Enemy.new(CSV.read("./maps/standard.csv")[0].map{|c| c.to_i}, @map)
		@towers = []

		@tick = 0

		@side_menu = SideMenu.new(@window)

		seed

		#Tower.new()
	end

	def seed
		@balance = 1000
	end

	def entities=(entities)
		@entities = entities
		@side_menu.entities = @entities
	end

	def update
		@tick += 1
		if @tick >= 10
			@enemies.each do |enemy|
				enemy.move
			end
			@tick = 0
		end
		@enemies.delete_if{|enemy| enemy.nil? or enemy.delete or enemy.health <= 0}
		if rand <= 0.01
			@enemies << Enemy.new(CSV.read("./maps/standard.csv")[0].map{|c| c.to_i}, @map)
		end
	end

	def seed_map
		@map = CSV.read("./maps/standard.csv", {:col_sep => ";"})[1..32]
	end

	def draw
		@side_menu.draw

		@map.each_with_index do |row, y|
			row.each_with_index do |square, x|
				square = "" unless square
				clr = @colors[square]
				@window.draw_quad(x*16,y*16,clr, x*16,y*16+16,clr, x*16+16,y*16+16,clr, x*16+16,y*16,clr, ZOrder::Map)
			end
		end

		@enemies.each{|enemy| enemy.draw }
	end

end
