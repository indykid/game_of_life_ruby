class Life
	def generation
		[]
	end
end

describe Life do
	it 'given one life cell returns zero life cells' do
		life = Life.new
		expect(life.generation).to eq([])
	end
end
