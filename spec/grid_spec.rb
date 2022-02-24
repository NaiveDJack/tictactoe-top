# frozen_string_literal: true

require_relative '../lib/grid'

describe Grid do
  subject(:grid) { described_class.new }

  # would like to test different board situations

  describe '#cell_available?' do
    context 'when the cell is occupied' do
      subject(:busy_grid) { described_class.new(['X', 'O', 'X', 'O', 'O', 'X', '0', 'X', 'O']) }
      it 'prints an error message' do
        expect($stdout).to receive(:puts).with('Cell is already occupied!')
        busy_grid.cell_available?(4)
      end
    end
    context 'when the cell is available' do
      subject(:free_grid) { described_class.new([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']) }
      it 'returns true with no prints' do
        expect($stdout).not_to receive(:puts).with('Cell is already occupied!')
        expect(free_grid.cell_available?(4)).to eq(true)
        free_grid.cell_available?(4)
      end
    end
  end
  describe '#valid_input?'

  describe '#line?' do
    context 'when the grid has no lines' do
      subject(:non_winning_grid) { described_class.new(['X', ' ', ' ', 'O', 'O', ' ', ' ', 'X', ' ']) }
      it 'returns False' do
        expect(non_winning_grid.line?(4)).to eq(false)
        non_winning_grid.line?(4)
      end
    end

    context 'when the grid has a line' do
      subject(:winning_grid) { described_class.new(['X', 'X', 'X', 'O', 'O', ' ', ' ', ' ', ' ']) }
      it 'returns an array with True and the winner' do
        expect(winning_grid.line?(2)).to eq([true, ['X']])
        winning_grid.line?(2)
      end
    end
  end
end
