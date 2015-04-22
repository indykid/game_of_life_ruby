class Life
	def initialize(generation)
		@generation = generation
	end
	
	def to_be_or_not_to_be(cell) 
		count = neighbours_count(cell) 
		count > 1 && count < 4
	end
	
	def neighbours_count(cell)
		count = 0
		surrounding_cells(cell).each do |cell|
			count+= 1 if @generation.include? cell
		end	
		count
	end

	def surrounding_cells(cell)
		row = cell[0]
		column = cell[1]
		surrounding_cells = []
		rows = neighbourhood_lines(row)
		columns = neighbourhood_lines(column)
		rows.each do |r|
			columns.each do |c|
				surrounding_cells << [r, c] unless r == row && c == column
			end
		end
		surrounding_cells
	end
	
	def neighbourhood_lines(line)
		(line-1..line+1).to_a
	end
end

describe Life do
	describe "to_be_or_not_to_be" do	
		it 'given lonely life cell returns false' do
			life = Life.new([0, 0])
			expect(life.to_be_or_not_to_be([0, 0])).to be(false)
		end
		
		it 'given a life cell with one neighbour returns false' do
			life = Life.new([[0, 0], [0, 1]])
			expect(life.to_be_or_not_to_be([0, 0])).to be(false)
		end

		it 'given a life cell with two neighbours returns true' do
			life = Life.new([[0, 0], [0, 1], [1, 0]])
			expect(life.to_be_or_not_to_be([0, 0])).to be(true)
		end
		
		it 'given a live cell with one neighbour and one non-neighbour returns false' do
			life = Life.new([[0, 0], [0, 1], [1, 5]])
			expect(life.to_be_or_not_to_be([0, 0])).to be(false)
		end
		
		it 'given a live cell with four neighbours returns false' do
			life = Life.new([[0, 0], [0, 1], [1, 0], [1, 1], [0, -1]])
			expect(life.to_be_or_not_to_be([0, 0])).to be(false)
		end	
	end

	describe "neighbours_count" do
		it "returns 0 if no neighbours" do
			life = Life.new([[0, 0]])
			expect(life.neighbours_count([0, 0])).to eq(0)
		end
	
		it "returns 1 if one neighbour" do
			life = Life.new([[0, 0], [0, 1]])
			expect(life.neighbours_count([0, 0])).to eq(1)
		end
		
		it "returns 2 if 2 neighbours" do
			life = Life.new([[0, 0], [0, 1], [1, 1]])
			expect(life.neighbours_count([0, 0])).to eq(2)
		end
		
		it "returns 2 if 2 neighbours" do
			life = Life.new([[0, 0], [0, 1], [1, 1], [2, 0]])
			expect(life.neighbours_count([0, 0])).to eq(2)
		end
	end

	
	
end
