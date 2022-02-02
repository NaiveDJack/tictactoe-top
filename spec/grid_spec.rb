# frozen_string_literal: true

require_relative '../lib/grid'

describe Grid do
  subject(:grid) { described_class.new }

  it 'sets up the grid' do
    values = grid.instance_variable_get(:@values)
    cells = grid.instance_variable_get(:@cells)
    expect(values).to eq({ empty: ' ', p1: 'X', p2: 'O' })
    expect(cells).to eq([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
  end
end
