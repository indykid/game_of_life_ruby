class Life
	attr_reader :generation
	def initialize(generation)
		@generation = generation
	end
	
	def evolve
		@generation = @generation.select {|cell| survivor?(cell)}
									.concat(candidates.select {|cell| to_be_born?(cell) })
	end

	def survivor?(cell) 
		(2..3).include?(neighbours_count(cell))
	end
	
	def to_be_born?(cell)
		neighbours_count(cell) == 3
	end

	def neighbours_count(cell)
		surrounding_cells(cell).select { |cell| @generation.include?(cell) }.length
	end

	def candidates 
		generation.flat_map { |live_cell| surrounding_cells(live_cell) }
			.reject { |cell| generation.include?(cell) }
			.uniq
	end

	private

	def neighbourhood_lines(line)
		(line-1..line+1).to_a
	end

	def surrounding_cells(cell)
		rows = neighbourhood_lines(row_for(cell))
		columns = neighbourhood_lines(column_for(cell))
		generate_grid(rows, columns).reject { |neighbour_cell| neighbour_cell == cell }
	end

	def generate_grid(rows, columns)
		grid = []
		rows.each do |r|
			columns.each do |c|
				grid << create_cell(r, c)
			end
		end
		grid
	end

	def create_cell(row, column)
		[row, column]
	end

	def row_for(cell)
		cell.first
	end

	def column_for(cell)
		cell.last
	end
end
