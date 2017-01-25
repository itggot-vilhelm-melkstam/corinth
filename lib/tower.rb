class Tower

	def initialize(type)
		@type = type

		@x = @y = 0

		seed
	end

	def update

	end

	def seed
		if @type == :block_shooter
			@range = 256
			@fire_rate = 5
		end
	end

	def draw
		@image.draw(@x * 32, @y * 32, ZOrder::Tower)
	end


end