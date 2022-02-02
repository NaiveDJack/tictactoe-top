# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  subject(:player) { described_class.new }

  it 'sets up the players' do
    name = player.instance_variable_get(:@name)
    expect(name).to be_a(String)
  end
end
