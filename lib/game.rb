# frozen_string_literal: true

require_relative './grid'
require_relative './player'

# main game logic
class Game
  attr_reader :game, :grid

  def initialize
    @game = true
    puts 'Tic tac toe with a friend!'
  end

  # setup functions
  def setup
    grid_setup
    player_setup
    turn_setup
  end

  def grid_setup
    @grid = Grid.new
  end

  def player_setup
    puts "Insert Player 1's name:"
    @p1 = Player.new
    puts "Insert player 2's name:"
    @p2 = Player.new
    puts "It's going to be #{@p1.name} VS #{@p2.name}!"
  end

  def turn_setup
    @turn_counter = 1
    @turn_player = :empty
  end

  # game functions
  def start
    turn
  end

  def turn
    while @game
      puts "Turn number #{@turn_counter}"
      turn_picker(@turn_counter)
      puts 'Choose a cell [1 - 9]'
      turn_play(gets.to_i)
    end
  end

  def turn_picker(turn_number)
    if turn_number.odd?
      @turn_player = :p1
      puts "It's #{@p1.name}'s turn!"
    else
      @turn_player = :p2
      puts "It's #{@p2.name}'s turn!"
    end
  end

  def turn_play(chosen_cell)
    @turn_counter += 1 if @grid.update_grid(chosen_cell, @turn_player)
    check_state(chosen_cell - 1)
  end

  # check game state functions
  def check_state(last_input)
    state, player = @grid.line?(last_input)

    game_over(player) if state == true
    game_over('none') if @turn_counter >= 10 && state == false
  end

  # game over logic
  def game_over(winner)
    case winner
    when ['X']
      puts "#{@p1.name} wins!"
    when ['O']
      puts "#{@p2.name} wins!"
    else
      puts "It's a tie!"
    end

    @game = false
  end
end
