# frozen_string_literal: true

require_relative '../lib/game'

describe Game do
  subject(:game) { described_class.new }

  describe '#turn_picker' do
    context 'when turn_counter is odd' do
      it 'gives player 1 the turn' do
        game.turn_picker(1)
        whose_turn = game.instance_variable_get(:@turn_player)
        expect(whose_turn).to eq(:p1)
      end
    end

    context 'when turn_counter is even' do
      it 'gives player 2 the turn' do
        game.turn_picker(2)
        whose_turn = game.instance_variable_get(:@turn_player)
        expect(whose_turn).to eq(:p2)
      end
    end
  end

  describe '#check_state' do
    subject(:game) { described_class.new(game_grid) }
    let(:game_grid) { instance_double(Grid) }

    it 'calls game over if there is an end state' do
      game.turn_setup
      allow(game_grid).to receive(:line?).and_return([true, 'X'])
      expect(game).to receive(:game_over).with('X')
      game.check_state(7)
    end

    it 'calls game over if turn counter is 10 or greater' do
      game.turn_setup(10)
      allow(game_grid).to receive(:line?).and_return([false, 'X'])
      expect(game).to receive(:game_over).with('none')
      game.check_state(7)
    end
  end
  # calls game over with 'none' if @turn_counter >= 10

  describe '#game_over' do
    it 'sets @game to false' do
      game.game_over(' ')
      game_state = game.instance_variable_get(:@game)
      expect(game_state).to be false
    end
  end
end
