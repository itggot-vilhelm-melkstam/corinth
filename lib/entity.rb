class Entity

	attr_reader :x1, :y1, :x2, :y2, :z, :clickable, :function_name, :belongs_to

	def initialize(x1, y1, x2, y2, z, clickable, function_name = "", belongs_to = "")
		@x1, @y1, @x2, @y2 = x1, y1, x2, y2
		@z = z
		@clickable = clickable
		@created_at = Time.now
		@function_name = function_name
		@belongs_to = belongs_to
	end


end
