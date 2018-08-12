require 'pry'
module Players

class Computer < Player

  def taken(board)
    exes = []
    ohs = []
    open_spot = []
    board.cells.each_with_index do |x,i=0|
      if x == "X"
        exes << i
      elsif x == "O"
        ohs << i
      else
        open_spot << i
      end
      end
        if self.token == "X"
          exes
        else
          ohs
        end
    end

    def openings(board)
      exes = []
      ohs = []
      open_spot = []
      board.cells.each_with_index do |x,i=0|
        if x == "X"
          exes << i
        elsif x == "O"
          ohs << i
        else
          open_spot << i
        end
        end
        sample = [0,1,2,3,4,5,6,7,8]
        sample - ohs - exes
      end

  def test(taken_result)
    win= [
      [0,1,2], # Top row
      [3,4,5],  # Middle row
      [6,7,8],  # Bottom row
      [0,3,6],  # First column
      [1,4,7],  # Second column
      [2,5,8],  # Third column
      [0,4,8],  # diagonal 1
      [2,4,6]  # diagonal 2
      #an array for each win combination
    ]
    no = []
    position = []
      if taken_result != []
        win.each do |x|
          compare = x & taken_result
            if compare.count >= 2
              answer =  x - taken_result
              position = answer
            else
              no << x
            end
          end
          if position[0] != nil
            position[0] += 1
          else
            position[0]
          end
      else
        nil
    end
  end

  def move(board)
    taken_result = taken(board)
    best_move = test(taken_result)
    if best_move == nil && board.cells[4] == " "
      input = 5.to_s
    elsif best_move == nil
      input = rand(1..9).to_s
    else
      input = best_move.to_s
    #if board.cells[4].nil? || board.cells[4] == " "
      #input = 5.to_s
    #  binding.pry
  #  elsif board.cells[6].nil? || board.cells[6] == " "
  #    input = 7.to_s
  #  elsif board.cells[8].nil? || board.cells[8] == " "
  #    input = 9.to_s
  #  elsif board.cells[0].nil? || board.cells[0] == " "
  #    input = 1.to_s
  #  elsif board.cells[2].nil? || board.cells[2] == " "
  #    input = 3.to_s
  #  else
    #  input = rand(1..9).to_s
    end
  end

end

end
