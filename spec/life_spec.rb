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
	it "given two non-adjacent cells returns zero life cells" do
		life = Life.new([[0, 0], [0, 5]])
		expect(life.generation).to eq([])
	end
	
	it "given two adjacent cells returns zero life cells" do
		life = Life.new([[0, 0], [0, 1]])
		expect(life.generation).to eq([])
	end

	it "given a cell with two adjacent cells returns that cell" do
	end
end
