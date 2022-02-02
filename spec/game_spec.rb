# frozen_string_literal: true

require_relative '../lib/game'

describe Game do
  subject(:game) { described_class.new }

  describe '#turn_picker'
  # odd turns make @turn_player = :p1
  # even turns make @turn_player = :p2

  describe '#turn_play'
  # updates turn counter by 1
  # it 'plays one turn' do
  #   turn_counter = instance_variable_get(:@turn_counter)
  #   expect(turn_counter).to change.by(1)
  # end

  describe '#check_state'
  # calls game_over with player if state == true
  # calls game over with 'none' if @turn_counter >= 10

  describe '#game_over' do
    game_state = game.instance_variable_get(:@game)
    expect(game_state).to be false
  end
end
