# frozen_string_literal: true

require_relative '../lib/tic_tac_toe'

describe Grid do
  subject(:grid) { described_class.new }

  it 'sets up the grid' do
    values = grid.instance_variable_get(:@values)
    cells = grid.instance_variable_get(:@cells)
    expect(values).to eq({ empty: ' ', p1: 'X', p2: 'O' })
    expect(cells).to eq([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
  end
end

describe Player do
  subject(:player) { described_class.new }

  it 'sets up the players' do
    name = player.instance_variable_get(:@name)
    expect(name).to be_a(String)
  end
end

describe Game do
  subject(:game) { described_class.new }

  describe '#turn' do
    # a turn happens
    # turn counter goes up
    xit 'plays one turn' do
      expect(game).to receive(:turn_play)
    end

    # turn counter gets to 10
    # turn counter does not go up
    # game ends
    xit 'stops the game at turn 10' do
      game.instance_variable_set(:@turn_counter, 10)
      expect(game.game).to be false
    end
  end

  describe '#check_win' do
    let(:winning_grid) { instance_double(Grid) }

    # mock grid becomes Game @grid
    # check win on the mock grid
    # game over is called
    before do
      winning_grid.instance_variable_set(:@cells, ['X', 'X', 'X', 'O', 'O', ' ', ' ', ' ', ' '])
      game.instance_variable_set(:@grid, winning_grid)
    end

    xit 'identifies a win state' do
      game.check_win('X')
      expect(game.game).to be false
    end
  end
end
