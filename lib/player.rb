# frozen_string_literal: true

# player class
class Player
  def initialize
    @name = gets.chomp
  end

  attr_reader :name
end
