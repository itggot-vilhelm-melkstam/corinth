class StartMenu

	attr_accessor :entities

	def initialize(window)
		@window = window
		@entities = []

	end

	def setup
		@entities << Entity.new(64,64, 704,192, ZOrder::Menu, true, :start_game, :start_menu)
		@start_game_txt = Gosu::Image.from_text('Start Game', 128)
	end

	def delete_entites
		@entities.delete_if{|e| e.belongs_to == :start_menu}
	end

	def update

	end

	def draw
		@window.draw_quad(0,0,0xff_03a9f4, 0,512,0xff_03a9f4, 768,512,0xff_03a9f4 ,768,0,0xff_03a9f4)
		@window.draw_quad(64,64,0xff_fafafa, 64,192,0xff_fafafa, 704,192,0xff_fafafa, 704,64,0xff_fafafa)
		@start_game_txt.draw_rot(384, 128, ZOrder::UI, 0, 0.5, 0.5, 1, 1, 0xff_ff5722)
	end

end
