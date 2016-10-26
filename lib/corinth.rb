class Corinth < Gosu::Window

	def initialize
		super 768, 512, false, 100/1000
		self.caption = "CORINTH"

		setup
	end

	def setup
		@cursor = Cursor.new(:cursor_1)
		# @start_menu = StartMenu.new
	end

	def button_down(id)
		close if id == Gosu::KbEscape
	end

	def update

		@cursor.x, @cursor.y = self.mouse_x, self.mouse_y
	end

	def draw
		draw_quad(0,0,0xffff8888, 0,512,0xffff8888 ,768,512,0xffff8888 ,768,0,0xffff8888)
		@cursor.draw
	end

end
