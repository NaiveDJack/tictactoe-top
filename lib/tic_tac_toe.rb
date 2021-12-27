# frozen_string_literal: true

# Tic tac toe grid behaviour

class Grid
  def initialize
    @values = { empty: ' ', p1: 'X', p2: 'O' }
    @cells = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def show_grid
    @grid = [["  #{@cells[0]}  |  #{@cells[1]}  |  #{@cells[2]}  "],
             ['-----------------'],
             ["  #{@cells[3]}  |  #{@cells[4]}  |  #{@cells[5]}  "],
             ['-----------------'],
             ["  #{@cells[6]}  |  #{@cells[7]}  |  #{@cells[8]}  "]]
    @grid.each { |n| puts n }
  end

  def show_cell(pos)
    @cells[pos]
  end

  def update_grid(pos, player)
    if @cells[pos - 1] == ' ' && pos.positive? && pos < 10
      @cells[pos - 1] = @values[player]
      show_grid
    else
      puts 'Wrong input!'
      false
    end
  end
end

# player class
class Player
  def initialize(name)
    @name = name
  end

  attr_reader :name
end

# main game logic
class Game
  def initialize
    @game = true
    @grid = Grid.new
    puts 'Tic tac toe with a friend!', "Insert Player 1's name:"
    @p1 = Player.new(gets.chomp)
    puts "Insert player 2's name:"
    @p2 = Player.new(gets.chomp)
    puts "It's going to be #{@p1.name} VS #{@p2.name}!"
    @turn_counter = 1
    @turn_player = :empty
    turn
  end

  def check_win(last_input)
    possible_lines = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                      [0, 3, 6], [1, 4, 7], [2, 5, 8],
                      [0, 4, 8], [2, 4, 6]]

    possible_lines.select! { |line| line.include?(last_input) }

    # transform lines in their values
    possible_lines = transform_lines(possible_lines)

    # reject lines that have an empty value
    possible_lines.reject! { |line| line.include?(' ') }
    # check lines that have only one value when uniqed
    possible_lines.each do |line|
      game_over(line) if line.uniq.size == 1
    end
  end

  def transform_lines(lines)
    lines.map! { |line| line = [@grid.show_cell(line[0]), @grid.show_cell(line[1]), @grid.show_cell(line[2])] }
    lines
  end

  def game_over(line)
    @game = false
    case line.uniq
    when ['X']
      puts "#{@p1.name} wins!"
      @game = false
    when ['O']
      puts "#{@p2.name} wins!"
      @game = false
    end
  end

  def turn_picker
    if @turn_counter.odd?
      @turn_player = :p1
      puts "It's #{@p1.name}'s turn!"
    else
      @turn_player = :p2
      puts "It's #{@p2.name}'s turn!"
    end
  end

  def turn_play
    puts 'Choose a cell [1 - 9]'
    chosen_cell = gets.to_i
    @turn_counter += 1 if @grid.update_grid(chosen_cell, @turn_player)
    chosen_cell
  end

  def turn
    while @game
      if @turn_counter >= 10
        puts "It's a tie!"
        @game = false
      end

      puts "Turn number #{@turn_counter}"
      turn_picker
      chosen_cell = turn_play
      check_win(chosen_cell - 1)
    end
  end
end

game = Game.new