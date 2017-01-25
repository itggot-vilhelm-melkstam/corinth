module ZOrder
  Map, Enemy, Tower, UI, Menu, Cursor = *0..5
end

class Corinth < Gosu::Window

	def initialize
		super 768, 512, false, 100/1000
		self.caption = "CORINTH"

		setup
	end

	def setup
		@entities = []

		@cursor = Cursor.new(:cursor_1)
		@start_menu = StartMenu.new(self)
		@start_menu.entities = @entities
		@start_menu.setup
	end

	def button_down(id)
		close if id == Gosu::KbEscape

		register_click(id, self.mouse_x, self.mouse_y) if (256..268).include? id
	end

	def register_click(id, x, y)
		entity = @entities.select{ |e| ((e.x1)..(e.x2)).include? x and ((e.y1)..(e.y2)).include? y }.sort_by{|e| e.z}.first
		if entity
			send(entity.function_name)
		end
	end

	def start_game
		@start_menu.delete_entites
		@start_menu = nil

		@game = Game.new(self)
		@game.entities = @entities
	end

	def update
		@game.update if @game

		@cursor.x, @cursor.y = self.mouse_x, self.mouse_y
	end

	def draw
		@start_menu.draw if @start_menu
		@game.draw if @game


		@cursor.draw
	end

end
