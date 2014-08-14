#draw a board
def draw_board(board)
  system 'clear'
  puts " #{board[1]} | #{board[2]} | #{board[3]} "
  puts "---+---+---"
  puts " #{board[4]} | #{board[5]} | #{board[6]} "
  puts "---+---+---"
  puts " #{board[7]} | #{board[8]} | #{board[9]} "
end

#create an initialized square hash
def initialize_square
  square = {}
  (1..9).each do |key|
    square[key] = ' '
  end
  return square
end

def player_choice(board)
  loop do
    puts "Choose a position (from 1 to 9) to place a piece:"
    player_input = gets.chomp.to_i
    
    if board[player_input] == ' '
      board[player_input] = 'O' 
      break
    else
      puts "The position you choose has been chosen, please choose again."
    end
  end
end

def computer_choice(board)
  temp_hash = board.select {|k,v| v == ' '}
  board[temp_hash.keys.sample] = 'X'
end

#check if there is a winner
def check_win(board)
  #list all of winning condition
  win_condition = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 9], [2, 5, 8],
                  [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  player_selseced = board.select {|k,v| v == 'O'}
  com_selected = board.select {|k,v| v == 'X'}

  if win_condition.include?(player_selseced.keys)
    puts "You won!"
  elsif win_condition.include?(com_selected.keys)
    puts "Computer won!"
  end
end




loop do
  new_board = initialize_square
  draw_board(new_board)
  begin
    player_choice(new_board)
    draw_board(new_board)
    check_win(new_board) 
    computer_choice(new_board)
    draw_board(new_board)
    check_win(new_board) 
  end while true

  puts "Good bye!"
  break
end 