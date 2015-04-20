class Life
	def initialize(generation)
	end
	
	def to_be_or_not_to_be(cell) 
		neighbours_count(cell) >= 2
	end
	
	def neighbours_count(cell)
		0
	end
end

describe Life do
	describe "to_be_or_not_to_be" do	
		xit 'given lonely life cell returns false' do
			life = Life.new([0, 0])
			expect(life.to_be_or_not_to_be([0, 0])).to be(false)
		end
		
		xit 'given a life cell with one neighbour returns false' do
			life = Life.new([[0, 0], [0, 1]])
			expect(life.to_be_or_not_to_be([0, 0])).to be(false)
		end

		xit 'given a life cell with two neighbours returns true' do
			life = Life.new([[0, 0], [0, 1], [1, 0]])
			expect(life.to_be_or_not_to_be([0, 0])).to be(true)
		end
		
		xit 'given a life cell with two neighbours returns false' do
			life = Life.new([[0, 0], [0, 1], [1, 0]])
			expect(life.to_be_or_not_to_be([0, 0])).to be(false)
		end
	end

	describe "neighbours_count" do
		it "returns 0 if no neighbours" do
			life = Life.new([[0, 0]])
			expect(life.neighbours_count([0, 0])).to eq(0)
		end
	end
end
