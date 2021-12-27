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
