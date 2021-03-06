require 'life'
describe Life do
  describe "survivor?" do 
    it 'given lonely live cell returns false' do
      life = Life.new([0, 0])
      expect(life.survivor?([0, 0])).to be(false)
    end

    it 'given a live cell with one neighbour returns false' do
      life = Life.new([[0, 0], [0, 1]])
      expect(life.survivor?([0, 0])).to be(false)
    end

    it 'given a live cell with two neighbours returns true' do
      life = Life.new([[0, 0], [0, 1], [1, 0]])
      expect(life.survivor?([0, 0])).to be(true)
    end

    it 'given a live cell with one neighbour and one non-neighbour returns false' do
      life = Life.new([[0, 0], [0, 1], [1, 5]])
      expect(life.survivor?([0, 0])).to be(false)
    end

    it 'given a live cell with four neighbours returns false' do
      life = Life.new([[0, 0], [0, 1], [1, 0], [1, 1], [0, -1]])
      expect(life.survivor?([0, 0])).to be(false)
    end	
  end

  describe "neighbours_count" do
    it "returns 0 if no neighbours" do
      life = Life.new([[0, 0]])
      expect(life.neighbours_count([3, 0])).to eq(0)
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

  describe '#to_be_born?' do
    it 'given a dead cell with no neighbours returns false' do
      life = Life.new([[10, 10]])
      expect(life.to_be_born?([8, 8])).to be(false)
    end

    it 'given a dead cell with one neighbour returns false' do
      life = Life.new([[10, 10]])
      expect(life.to_be_born?([10, 9])).to be(false)
    end

    it 'given a dead cell with two neighbours returns false' do
      life = Life.new([[10, 10], [9, 10]])
      expect(life.to_be_born?([10, 9])).to be(false)
    end

    it 'given a dead cell with three neighbours returns true' do
      life = Life.new([[10, 10], [9, 10], [9, 9]])
      expect(life.to_be_born?([10, 9])).to be(true)
    end

    it 'given a dead cell with four neighbours returns false' do
      life = Life.new([[10, 10], [9, 10], [9, 9], [11, 9]])
      expect(life.to_be_born?([10, 9])).to be(false)
    end
  end

  describe "#evolve" do
    it "kills lonely cell" do
      life = Life.new([[10, 10]])
      life.evolve
      expect(life.generation).to be_empty
    end

    it 'given generation of three, keeps alive the cell with 2 neighbours' do
      life = Life.new([[10, 10], [10, 11], [9, 9]])
      life.evolve
      expect(life.generation).to include([10, 10])
    end

    it 'spawns new cells' do
      life = Life.new([[10, 10], [9, 10], [9, 9]])
      life.evolve
      expect(life.generation).to include([10, 9])
    end

    it 'keeps "block" shape stable' do
      life = Life.new([[10, 9], [10, 10], [9, 9], [9, 10]])
      life.evolve
      expect(life.generation).to match_array([[10, 9], [10, 10], [9, 9], [9, 10]])
    end

    it 'alternates direction of 3 cells in a row, blinker pattern' do
      life = Life.new([[10, 9], [10, 10], [10, 11]])
      life.evolve
      expect(life.generation).to match_array([[9, 10], [10, 10], [11, 10]])
      life.evolve
      expect(life.generation).to match_array([[10, 9], [10, 10], [10, 11]])
    end
  end

  describe '#candidates' do
    it 'empty generation has no candidates' do
      life = Life.new([])
      expect(life.candidates).to eq([])
    end

    it 'finds all dead cells surrounding live ones' do
      life = Life.new([[9,9]])
      expect(life.candidates).to match_array([[8,9], [8,8], [9,8], [8,10], [10,8], [10,10], [10, 9], [9, 10]])
    end

    it 'ignores duplicates among candidates' do
      life = Life.new([[0, 2], [2, 0]])
      expect(life.candidates.count([1, 1])).to eq(1)
    end

    it 'ignores living cells among candidates' do
      life = Life.new([[0, 2], [1, 1]])
      expect(life.candidates).not_to include([1,1])
    end
  end
end
