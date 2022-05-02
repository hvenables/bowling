RSpec.describe Game do
  let(:game) { described_class.new }

  it "will score 0 for an all gutter game" do
    20.times { game.roll(0) }
    expect(game.score).to eq 0
  end

  it "will score 20 for an all ones game" do
    20.times { game.roll(1) }
    expect(game.score).to eq 20
  end

  it "will score 150 for an all fives game" do
    21.times { game.roll(5) }
    expect(game.score).to eq 150
  end

  it "will score 300 for a perfect game" do
    12.times { game.roll(10) }
    expect(game.score).to eq 300
  end
end
