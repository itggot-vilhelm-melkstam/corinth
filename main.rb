require 'gosu'
Dir.glob("./lib/*.rb").each do |klass|
	require_relative klass
end

corinth = Corinth.new
corinth.show
