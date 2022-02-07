# frozen_string_literal: true

# player class
class Player
  attr_reader :name
  
  def initialize
    @name = gets.chomp
  end
end
