# frozen_string_literal: true

# Tic tac toe grid behaviour
class Grid
  def initialize
    @values = { empty: ' ', p1: 'X', p2: 'O' }
    @cells = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  # visualisation methods
  def show_grid
    @grid = [["  #{@cells[0]}  |  #{@cells[1]}  |  #{@cells[2]}  "],
             ['—————————————————'],
             ["  #{@cells[3]}  |  #{@cells[4]}  |  #{@cells[5]}  "],
             ['—————————————————'],
             ["  #{@cells[6]}  |  #{@cells[7]}  |  #{@cells[8]}  "]]
    @grid.each { |n| puts n }
  end

  def show_cell(pos)
    @cells[pos]
  end

  # grid alteration methods
  def update_grid(pos, player)
    return unless valid_input?(pos) && cell_available?(pos)

    @cells[pos - 1] = @values[player]
    show_grid
  end

  def cell_available?(pos)
    unless @cells[pos - 1] == ' '
      puts 'Cell is already occupied!'
      return false
    end
    true
  end

  def valid_input?(pos)
    return true if pos.positive? && pos < 10

    puts 'Wrong input!'
    false
  end

  # grid state checkers
  def line?(last_input)
    possible_lines = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                      [0, 3, 6], [1, 4, 7], [2, 5, 8],
                      [0, 4, 8], [2, 4, 6]]

    possible_lines.select! { |line| line.include?(last_input) }

    possible_lines = transform_lines(possible_lines)

    possible_lines.reject! { |line| line.include?(' ') }

    possible_lines.each do |line|
      return true, line.uniq if line.uniq.size == 1
    end
  end

  def transform_lines(lines)
    lines.map! { |line| line = [show_cell(line[0]), show_cell(line[1]), show_cell(line[2])] }
    lines
  end
end
