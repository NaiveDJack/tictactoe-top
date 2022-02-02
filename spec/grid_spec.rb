# frozen_string_literal: true

require_relative '../lib/grid'

describe Grid do
  subject(:grid) { described_class.new }

  # would like to test different board situations

  describe '#cell_available?'
  describe '#valid_input?'

  describe '#line?' do
    it 'identifies a non-win state'
    it 'identifies a win state'
    # create a grid with a line
    # expect(grid.line).to be_falsey?
  end
end
