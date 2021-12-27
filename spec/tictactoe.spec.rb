# frozen_string_literal: true

require_relative '../lib/tic_tac_toe'

describe Game do
  describe '#initialize' do
    subject(:game) { described_class.new }

    context 'when starting' do
      before do
        player_one = 'p1'
        allow(game).to receive(:gets).and_return(player_one)
        player_two = 'p2'
        allow(game).to receive(:gets).and_return(player_two)
      end

      it 'takes right input' do
        error_message = 'Wrong input!'
        expect(game).not_to receive(:puts).with(error_message)
      end
    end
  end

  describe '#turn' do
    subject(:game) { described_class.new }
    context 'first turn' do
      before do
        valid_input = '1'
        allow(game).to receive(:gets).and_return(valid_input)
      end

      it 'takes right input' do
        error_message = 'Wrong input!'
        expect(game).not_to receive(:puts).with(error_message)
      end
    end
  end
end
