# frozen_string_literal: true

require_relative '../lib/game'

describe Game do
  subject(:game) { described_class.new }

  describe '#turn_picker' do
    before do
      whose_turn = game.instance_variable_get(:@turn_player)
    end

    it 'gives player 1 the turn if counter is odd' do
      game.turn_picker(1)
      expect(whose_turn).to eq(:p1)
    end
    # odd turns make @turn_player = :p1
    it 'gives player 2 the turn if counter is even' do
      game.turn_picker(2)
      expect(whose_turn).to eq(:p2)
    end
    # even turns make @turn_player = :p2
  end

  describe '#turn_play' do
    it 'updates turn counter by 1' do
      # turn_counter = game.instance_variable_get(:@turn_counter)
    end
    # it 'plays one turn' do
    #   turn_counter = instance_variable_get(:@turn_counter)
    #   expect(turn_counter).to change.by(1)
    # end
  end

  describe '#check_state'
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
