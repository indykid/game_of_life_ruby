class Life
	def initialize(generation)
	end
	
	def to_be_or_not_to_be(cell)
		false
	end
end

describe Life do
	describe "to_be_or_not_to_be" do	
		it 'given lonely life cell returns false' do
			life = Life.new([0, 0])
			expect(life.to_be_or_not_to_be([0, 0])).to be(false)
		end
	end
end
