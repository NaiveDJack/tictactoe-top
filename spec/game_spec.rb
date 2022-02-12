# frozen_string_literal: true

require_relative '../lib/game'

describe Game do
  subject(:game) { described_class.new }

  describe '#turn_picker' do
    # tests need Player instance double
    it 'gives player 1 the turn if counter is odd' do
      game.turn_picker(1)
      whose_turn = game.instance_variable_get(:@turn_player)
      expect(whose_turn).to eq(:p1)
    end
    # odd turns make @turn_player = :p1
    it 'gives player 2 the turn if counter is even' do
      game.turn_picker(2)
      whose_turn = game.instance_variable_get(:@turn_player)
      expect(whose_turn).to eq(:p2)
    end
    # even turns make @turn_player = :p2
  end

  describe '#turn_play' do
    # test needs Grid instance double
    let(:game_grid) { instance_double(Grid) }

    before do
      allow(:game_grid).to receive(:update_grid).with(8, :p1).and_return(true)
    end

    it 'updates turn counter by 1' do
      turn_counter = game.instance_variable_get(:@turn_counter)
      game.turn_play(8)
      expect(turn_counter).to change.by(1)
    end
  end

  describe '#check_state' do
    # test needs Grid instance double
    it 'calls game over if there is an end state' do
      game.check_state([true, 'X'])
      expect(self).to receive(game_over)
    end

    it 'calls game over if turn counter is 10 or greater'
  end
  # calls game_over with player if state == true
  # calls game over with 'none' if @turn_counter >= 10

  describe '#game_over' do
    it 'sets @game to false' do
      game.game_over(' ')
      game_state = game.instance_variable_get(:@game)
      expect(game_state).to be false
    end
  end
end
