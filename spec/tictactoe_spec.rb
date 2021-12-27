# frozen_string_literal: true

require_relative '../lib/tic_tac_toe'

describe Game do
  subject(:game) { described_class.new }
  let(:winning_grid) { instance_double(Grid) }
  winning_grid.instance_variable_set( :@cells, ['X', 'X', 'X', ' ', ' ', ' ', ' ', ' ', ' '])
  game.p1.instance_variable_set('you')
end