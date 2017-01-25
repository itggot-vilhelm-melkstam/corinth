class Cursor

	attr_accessor :x, :y

	def initialize(style)
		@x, @y = 0, 0
		@style = style
		@size = 24
		setup
	end

	def setup
		@styles = {}
		Dir.glob("./media/cursor/*.png").each do |style|
			@styles[style.scan(/\/([^\.\/]*).png/)[0][0].to_sym] = Gosu::Image.new(style)
		end
	end

	def update

	end

	def style=(style)
		raise ArgumentError, "Not an available cursorstyle" unless @styles.include? style
		@style = style
	end

	def draw
		@styles[@style].draw(@x, @y, ZOrder::Cursor, (@size/512.0), (@size/512.0))
	end

end
