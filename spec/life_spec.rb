class Life
	def initialize(cells)
		@cells = cells
	end
	def generation
		[]
	end
end

describe Life do
	it 'given one life cell returns zero life cells' do
		life = Life.new([[0, 0]])
		expect(life.generation).to eq([])
	end
end
