class SideMenu

	def initialize(window)
		@window = window

		@menu = towers
	end

	def towers
		# @entities << Entity.new()
	end

	def entities=(entities)
		@entities = entities
	end

	def update

	end

	def draw
		clr = 0xff_f5f5f5
		@window.draw_quad(512,0,clr, 768,0,clr, 768,512,clr, 512,512,clr, ZOrder::UI)
	end

end